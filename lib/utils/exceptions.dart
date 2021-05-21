
class AppHttpException implements Exception {
  AppHttpException([this.message = '', this.prefix]);

  final String message;
  final dynamic prefix;

  @override
  String toString() => '$prefix $message';
}

class FetchDataException extends AppHttpException {
  FetchDataException([String message = '{}'])
      : super(message, 'Error during request');
}

class BadRequestException extends AppHttpException {
  BadRequestException([String message = ''])
      : super(message, 'Invalid request');
}

class UnauthorisedException extends AppHttpException {
  UnauthorisedException([String message = ''])
      : super(message, 'Unauthorized request');
}

class InvalidInputException extends AppHttpException {
  InvalidInputException([String message = ''])
      : super(message, 'Invalid input');
}
