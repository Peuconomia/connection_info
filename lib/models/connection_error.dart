library connection_info;

import 'package:connection_info/enums/connection_error.dart';

class ConnectionError extends Error {
  ConnectionErrorType errorType;
  String errorDescription;

  ConnectionError({
    required this.errorType,
    required this.errorDescription,
  });
}
