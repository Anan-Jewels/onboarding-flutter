part of provider_app_exceptions;

/// Class to handle General API Exception.
class GeneralAPIException implements Exception {
  /// Constructor of General Exceptions.
  GeneralAPIException({this.message});
  final String _title = '''API Request Failed!''';

  /// message to show with this exception.
  final String? message;

  /// getter of message.
  String? getMessage() => message;

  /// show snackbar.
  void showToast(BuildContext context) {
    FancySnackbar.showSnackbar(
      context,
      title: _title,
      message: message ?? '''API Request Failed!''',
      snackBarType: FancySnackBarType.error,
    );
  }
}
