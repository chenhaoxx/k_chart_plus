import 'package:flutter/material.dart';
import 'package:k_chart_plus/k_chart_plus.dart';

class VolRenderer extends BaseChartRenderer<VolumeEntity> {
  late double mVolWidth;
  final ChartStyle chartStyle;
  final ChartColors chartColors;

  VolRenderer(Rect mainRect, double maxValue, double minValue,
      double topPadding, int fixedLength, this.chartStyle, this.chartColors)
      : super(
          chartRect: mainRect,
          maxValue: maxValue,
          minValue: minValue,
          topPadding: topPadding,
          fixedLength: fixedLength,
          gridColor: chartColors.gridColor,
        ) {
    mVolWidth = this.chartStyle.volWidth;
  }

  @override
  void drawChart(VolumeEntity lastPoint, VolumeEntity curPoint, double lastX,
      double curX, Size size, Canvas canvas) {
    double r = mVolWidth / 2;
    double top = getVolY(curPoint.vol);
    double bottom = chartRect.bottom;
    if (curPoint.vol != 0) {
      canvas.drawRect(
          Rect.fromLTRB(curX - r, top, curX + r, bottom),
          chartPaint
            ..color = curPoint.close > curPoint.open
                ? this.chartColors.upColor
                : this.chartColors.dnColor);
    }

    if (lastPoint.MA5Volume != 0) {
      drawLine(lastPoint.MA5Volume, curPoint.MA5Volume, canvas, lastX, curX,
          this.chartColors.ma5Color);
    }

    if (lastPoint.MA40Volume != 0) {
      drawLine(lastPoint.MA40Volume, curPoint.MA40Volume, canvas, lastX, curX,
          this.chartColors.ma10Color);
    }

    if (lastPoint.MA135Volume != 0) {
      drawLine(lastPoint.MA135Volume, curPoint.MA135Volume, canvas, lastX, curX,
          this.chartColors.ma135Color);
    }
  }

  double getVolY(double value) =>
      (maxValue - value) * (chartRect.height / maxValue) + chartRect.top;

  @override
  void drawText(Canvas canvas, VolumeEntity data, double x) {
    TextSpan span = TextSpan(
      children: [
        TextSpan(
            text: "VOL: ${NumberUtil.formatCN(data.vol)}    ",
            style: getTextStyle(this.chartColors.volColor)),
        if (data.MA5Volume.notNullOrZero)
          TextSpan(
              text: "MA5: ${NumberUtil.formatCN(data.MA5Volume!)}    ",
              style: getTextStyle(this.chartColors.ma5Color)),
        if (data.MA40Volume.notNullOrZero)
          TextSpan(
              text: "MA40: ${NumberUtil.formatCN(data.MA40Volume!)}    ",
              style: getTextStyle(this.chartColors.ma10Color)),
        if (data.MA135Volume.notNullOrZero)
          TextSpan(
              text: "MA135: ${NumberUtil.formatCN(data.MA135Volume!)}    ",
              style: getTextStyle(this.chartColors.ma135Color)),
      ],
    );
    TextPainter tp = TextPainter(text: span, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, Offset(x, chartRect.top - topPadding));
  }

  @override
  void drawVerticalText(canvas, textStyle, int gridRows) {
    TextSpan span =
        TextSpan(text: "${NumberUtil.formatCN(maxValue)}", style: textStyle);
    TextPainter tp = TextPainter(text: span, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(
        canvas, Offset(chartRect.width - tp.width, chartRect.top - topPadding));
  }

  @override
  void drawGrid(Canvas canvas, int gridRows, int gridColumns) {
    canvas.drawLine(Offset(0, chartRect.bottom),
        Offset(chartRect.width, chartRect.bottom), gridPaint);
    double columnSpace = chartRect.width / gridColumns;
    for (int i = 0; i <= columnSpace; i++) {
      //vol垂直线
      canvas.drawLine(Offset(columnSpace * i, chartRect.top - topPadding),
          Offset(columnSpace * i, chartRect.bottom), gridPaint);
    }
  }
}
