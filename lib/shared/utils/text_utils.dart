class TextUtils {
  static bool isEmpty(final String? text) {
    return text == null || text.isEmpty;
  }

  static bool isNotEmpty(final String? text) {
    return !isEmpty(text);
  }
}
