class Percent {
  static int convert(String total, String cases) {
    if (total.contains('0')) {
      return 0;
    }
    int mTotal = int.parse(total.replaceAll(',', 'replace'));
    int mCases = int.parse(cases.replaceAll(',', 'replace'));
    int percent = ((mCases / mTotal) * 100).ceil();
    return percent;
  }
}
