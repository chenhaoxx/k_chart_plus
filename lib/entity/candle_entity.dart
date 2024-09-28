// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import,camel_case_types
mixin CandleEntity {
  late double open;
  late double high;
  late double low;
  late double close;

  /// 当前值包含了ma5，ma10，ma20，在初始化时传入的数组
  List<double>? maValueList;

  /// 计算的ema
  /// 按照顺序是：生命线，红线，绿色，上1，上2，下1，下2
  List<double>? newAvgLineList;

  /// 是否信号
  bool isSignal = false;

//  上轨线
  double? up;

//  中轨线
  double? mb;

//  下轨线
  double? dn;

  double? BOLLMA;
}
