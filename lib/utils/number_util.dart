import 'dart:math';

class NumberUtil {
  static String format(double n) {
    if (n >= 1000000000) {
      n /= 1000000000;
      return "${n.toStringAsFixed(2)}B";
    } else if (n >= 1000000) {
      n /= 1000000;
      return "${n.toStringAsFixed(2)}M";
    } else if (n >= 10000) {
      n /= 1000;
      return "${n.toStringAsFixed(2)}K";
    } else {
      return n.toStringAsFixed(4);
    }
  }

  static String formatCN(dynamic value) {
    final num = double.tryParse(value.toString());
    if (num == null) {
      return ''; // 处理非数字输入
    }

    if (num >= 10000 && num < 100000000) {
      // 大于一万小于一亿
      final quotient = (num / 10000).floor();
      final remainder = num % 10000;
      if (remainder == 0) {
        return '$quotient万';
      } else {
        return '$quotient.${(remainder / 1000).floor()}万';
      }
    } else if (num >= 100000000) {
      // 大于等于一亿
      final quotient = (num / 100000000).floor();
      final remainder = num % 100000000;
      if (remainder == 0) {
        return '$quotient亿';
      } else {
        return '$quotient.${(remainder / 10000000).floor()}亿';
      }
    } else {
      // 小于一万
      return value.toStringAsFixed(2);
    }
  }

  static int getDecimalLength(double b) {
    String s = b.toString();
    int dotIndex = s.indexOf(".");
    if (dotIndex < 0) {
      return 0;
    } else {
      return s.length - dotIndex - 1;
    }
  }

  static int getMaxDecimalLength(double a, double b, double c, double d) {
    int result = max(getDecimalLength(a), getDecimalLength(b));
    result = max(result, getDecimalLength(c));
    result = max(result, getDecimalLength(d));
    return result;
  }

  static bool checkNotNullOrZero(double? a) {
    if (a == null || a == 0) {
      return false;
    } else if (a.abs().toStringAsFixed(4) == "0.0000") {
      return false;
    } else {
      return true;
    }
  }
}
