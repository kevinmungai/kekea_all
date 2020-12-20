extension GetPlainNum on String {
  String getPlainNum() {
    if (this != null) {
      if (this.isNotEmpty) {
        return this.replaceAll(RegExp(r'[, .]'), '');
      }
    }
    return "";
  }
}
