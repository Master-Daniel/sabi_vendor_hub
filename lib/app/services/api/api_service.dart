import 'dart:async';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:sabi_vendor_hub_mobile/app/constants/enviroment.dart';
import 'package:sabi_vendor_hub_mobile/app/utils/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Add the User import
// import 'package:zulushare_mobile/app/models/user.dart'; // Adjust the import path as needed

class ApiService {
  final Logger logger = Logger();
  static final ApiService _instance = ApiService._internal(Dio());
  factory ApiService() => _instance;

  final Dio _dio;
  String? _accessToken;
  String? _refreshToken;
  bool _isRefreshing = false;
  final List<Function(Object?)> _refreshQueue = [];

  ApiService._internal(this._dio) {
    // Base configuration for Dio
    _dio
      ..options.baseUrl = AppEnvironment.API_URL
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

    // Initialize tokens and add interceptors
    _initializeService();
  }

  Future<void> _initializeService() async {
    await _loadTokens();
    _setupInterceptors();
  }

  // Load tokens from SharedPreferences
  Future<void> _loadTokens() async {
    final prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('accessToken');
    _refreshToken = prefs.getString('refreshToken');

    appLog('Access token: $_accessToken');
    appLog('Refresh token: $_refreshToken');
  }

  void _setupInterceptors() {
    // Add interceptor for logging and custom handling
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) => _handleRequest(options, handler),
      onResponse: (response, handler) => _handleResponse(response, handler),
      onError: (error, handler) => _handleError(error, handler),
    ));
  }

  // Save tokens to SharedPreferences
  Future<void> _saveTokens() async {
    final prefs = await SharedPreferences.getInstance();
    if (_accessToken != null) {
      await prefs.setString('accessToken', _accessToken!);
    }
    if (_refreshToken != null) {
      await prefs.setString('refreshToken', _refreshToken!);
    }
  }

  // Clear tokens from SharedPreferences
  Future<void> _clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
    _accessToken = null;
    _refreshToken = null;
  }

  // Handle outgoing requests
  Future<void> _handleRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (_accessToken != null) {
      options.headers['Authorization'] = 'Bearer $_accessToken';
    }
    appLog("${options.method} ${options.uri} with $_accessToken");
    handler.next(options);
  }

  // Handle responses
  void _handleResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  // Handle errors
  Future<void> _handleError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 ||
        err.response?.statusCode == 403 ||
        err.response?.statusCode == 419) {
      try {
        await _handleTokenRefresh(err, handler);
      } catch (refreshError) {
        // If token refresh fails, handle logout and reject the error
        appLog('Authentication failed completely, logging user out');
        await _handleAuthFailure();
        handler.reject(err);
      }
    } else {
      handler.next(err);
    }
  }

  // Handle auth failure by logging user out
  Future<void> _handleAuthFailure() async {
    await clearTokens();
   // User.logout();
  }

  // Handle token refresh
  Future<void> _handleTokenRefresh(
      DioException err, ErrorInterceptorHandler handler) async {
    appLog('Access token expired. Attempting to refresh...');

    if (_isRefreshing) {
      // If a refresh is already in progress, wait for it to complete
      try {
        await _queueRefresh();
        err.requestOptions.headers['Authorization'] = 'Bearer $_accessToken';
        final retryResponse = await _dio.fetch(err.requestOptions);
        handler.resolve(retryResponse);
        return;
      } catch (refreshError) {
        throw refreshError;
      }
    }

    appLog('Starting token refresh process...');
    _isRefreshing = true;

    try {
      appLog("Attempting token refresh");
      final refreshResponse =
          await _dio.get('/refresh?refreshToken=$_refreshToken');
      appLog("refreshResponse: ${refreshResponse.data}");

      _accessToken = refreshResponse.data["data"]['accessToken'];
      _refreshToken = refreshResponse.data["data"]['refreshToken'];
      appLog('New access token: $_accessToken');
      appLog('New refresh token: $_refreshToken');
      await _saveTokens();
      _processQueue(null);

      // Retry the original request with the new token
      err.requestOptions.headers['Authorization'] = 'Bearer $_accessToken';
      final retryResponse = await _dio.fetch(err.requestOptions);
      handler.resolve(retryResponse);
    } catch (refreshError) {
      appLog('Failed to refresh token: $refreshError');
      _processQueue(refreshError);
      throw refreshError;
    } finally {
      _isRefreshing = false;
    }
  }

  // Queue refresh handling
  Future<void> _queueRefresh() async {
    appLog('Queuing refresh...');
    final completer = Completer();
    _refreshQueue.add((error) {
      if (error != null) {
        completer.completeError(error);
      } else {
        completer.complete();
      }
    });
    return completer.future;
  }

  // Process queued requests
  void _processQueue(Object? error) {
    for (final request in _refreshQueue) {
      request(error);
    }
    _refreshQueue.clear();
  }

  // Utility methods for making API calls
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    appLog('GET $path with $_accessToken');
    logger.i('GET $path with $_accessToken');
    return _dio.get(
      path,
      queryParameters: queryParameters,
      data: data,
    );
  }

  Future<Response> post(String path, {dynamic data}) async {
    appLog('POST $path with $_accessToken');
    logger.i('POST $path with $_accessToken');
    return _dio.post(
      path,
      data: data,
    );
  }

  Future<Response> put(String path, {dynamic data}) async {
    appLog('PUT $path with $_accessToken');
    logger.i('PUT $path with $_accessToken');
    return _dio.put(
      path,
      data: data,
    );
  }

  Future<Response> patch(String path, {dynamic data}) async {
    appLog('PATCH $path with $_accessToken');
    logger.i('PATCH $path with $_accessToken');
    return _dio.patch(
      path,
      data: data,
    );
  }

  Future<Response> delete(String path, {dynamic data}) async {
    appLog('DELETE $path with $_accessToken');
    logger.i('DELETE $path with $_accessToken');
    return _dio.delete(
      path,
      data: data,
    );
  }

  // Public methods to manage tokens
  Future<void> setTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    await _saveTokens();
  }

  Future<void> clearTokens() async {
    await _clearTokens();
  }
}
