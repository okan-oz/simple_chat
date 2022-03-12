import '../module/multilingual/utils/translate_utils.dart';

class ErrorData {
  String? userMessage;
  bool showToUser = false;
  String? exceptionMessage;
  Exception? exception;
  StackTrace? stackTrace;

  ErrorData({
    this.exception,
    this.exceptionMessage,
    this.showToUser = true,
    this.stackTrace,
    this.userMessage,
  });

  factory ErrorData.empty() {
    return ErrorData(
      showToUser: true,
      userMessage: TranslateUtil.getText(
        'code',
        'Beklemediğimiz bir hata oldu , lütfen daha sonra tekrar deneyiniz!',
      ),
    );
  }
}
