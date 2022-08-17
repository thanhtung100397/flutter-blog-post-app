
class StringUtils {
  static isEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static isNotEmpty(String? value) {
    return !StringUtils.isEmpty(value);
  }
}