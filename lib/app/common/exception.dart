class GenericException implements Exception {
  final ExceptionCode code;
  final dynamic info;
  // final MetaDetail? detail;

  GenericException({this.code = ExceptionCode.unknown, this.info});

  @override
  String toString() {
    return '$runtimeType: ${code.value}';
  }

  static ExceptionCode getExCode(String code) {
    switch (code) {
      case 'call_cs':
        return ExceptionCode.callCs;
      case 'bad_request':
        return ExceptionCode.unknown;
      default:
        return ExceptionCode.unknown;
    }
  }

  static String getStringCode(ExceptionCode exCode) {
    switch (exCode) {
      case ExceptionCode.callCs:
        return 'call_cs';
      case ExceptionCode.unknown:
        return 'bad_request';
      default:
        return 'bad_request';
    }
  }

  String get message {
    switch (runtimeType) {
      case NotFoundException:
        return '${code.value}: $info\nis not found.';
      case NotUniqueException:
        return '${code.value}: $info\nalready exists.';
      case NullEmptyException:
        return '${code.value}\nmust not be null or empty.';
      case LengthException:
        return '${code.value} must be $info letters or shorter.';
      case FalseException:
        return '${code.value} $info must be true.';
      case RemovalException:
        return code == ExceptionCode.category
            ? 'Cannot be removed;\nthis category contains notes.'
            : 'Cannot be removed';
      case ServerRequestException:
        return info as String;
      case MetaException:
        return info;
      default:
        return 'Unknown error occurred.';
    }
  }
}

class NotFoundException extends GenericException {
  NotFoundException({required ExceptionCode code, required String target})
      : assert(target.isNotEmpty),
        super(code: code, info: target);
}

class NotUniqueException extends GenericException {
  NotUniqueException({required ExceptionCode code, required String value})
      : assert(value.isNotEmpty),
        super(code: code, info: value);
}

class NullEmptyException extends GenericException {
  NullEmptyException({required ExceptionCode code}) : super(code: code);
}

class LengthException extends GenericException {
  LengthException({required ExceptionCode code, required int max})
      : assert(max > 0),
        super(code: code, info: max);
}

class RemovalException extends GenericException {
  RemovalException({required ExceptionCode code}) : super(code: code);
}

class FalseException extends GenericException {
  FalseException({required ExceptionCode code, required bool value})
      : assert(value == false),
        super(code: code, info: value);
}

class ServerRequestException extends GenericException {
  ServerRequestException({required ExceptionCode code, required String value})
      : super(
            code: code,
            info: value.isEmpty
                ? 'Sorry server is busy, Please try again later'
                : value);
}

class MetaException extends GenericException {
  MetaException({required ExceptionCode code, required double value})
      : super(code: code, info: value);
}

class CallCsException extends GenericException {
  CallCsException({required ExceptionCode code})
      : super(
            code: code,
            info:
                'Terjadi kesalahan dengan data anda. Silakan hubungi CS untuk melakukan operasi ini.');
}

enum ExceptionCode {
  unknown,
  callCs,
  category,
  categoryId,
  categoryName,
  note,
  noteId,
  noteTitle,
  rule,
  signInEmail,
  signInPassword,
  signInTerms,
  serverFailure,
  limitExceeded,
}

extension ExceptionCodeValue on ExceptionCode {
  String get value {
    switch (this) {
      case ExceptionCode.callCs:
        return 'call_cs';
      case ExceptionCode.category:
        return 'Category';
      case ExceptionCode.categoryId:
        return 'Category ID';
      case ExceptionCode.categoryName:
        return 'Category name';
      case ExceptionCode.note:
        return 'Note';
      case ExceptionCode.noteId:
        return 'Note ID';
      case ExceptionCode.noteTitle:
        return 'Note title';
      case ExceptionCode.rule:
        return 'Rule «not Available';
      case ExceptionCode.signInEmail:
        return 'SignIn email';
      case ExceptionCode.signInPassword:
        return 'SignIn password';
      case ExceptionCode.signInTerms:
        return 'SignIn terms';
      case ExceptionCode.serverFailure:
        return 'Server Error';
      case ExceptionCode.limitExceeded:
        return 'Limit Exceeded';
      default:
        return 'Unknown';
    }
  }
}
