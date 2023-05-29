class AppException implements Exception {
  final _message, _prefix;
  AppException([this._message, this._prefix]);
  String toString() {
    return "$_message$_prefix";
  }
}

class FetchDataException extends AppException {
  FetchDataException({String? message})
      : super(message, 'Error During Communication');
}

class BadException extends AppException {
  BadException({String? message}) : super(message, 'Invalid Request');
}

class UnauthorizedException extends AppException {
  UnauthorizedException({String? message})
      : super(message, 'Unauthorized Request');
}

class InvalidInputException extends AppException {
  InvalidInputException({String? message}) : super(message, 'Ivalid Input ');
}
