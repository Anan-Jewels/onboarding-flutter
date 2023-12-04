part of provider_app_apis;

/// This is the class to manage all endpoints used in the application for APIs.
class APIUtilities {
  /// this is the base URL or host URL.
  static const String _baseUrl =
      'https://6525210567cfb1e59ce6ae75.mockapi.io/api/v1/';

  /// login
  static const String loginUrl = '${_baseUrl}login';

  /// registration
  static const String registrationUrl = '${_baseUrl}registration';

  static const String productUrl = '${_baseUrl}designstyles';
}
