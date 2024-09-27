class ChartTranslations {
  final String date;
  final String open;
  final String high;
  final String low;
  final String close;
  final String changeAmount;
  final String change;
  final String amount;
  final String vol;

  const ChartTranslations({
    this.date = 'Date',
    this.open = 'Open',
    this.high = 'High',
    this.low = 'Low',
    this.close = 'Close',
    this.changeAmount = 'Change',
    this.change = 'Change%',
    this.amount = 'Amount',
    this.vol = 'Volume',
  });

  ChartTranslations.cn({
    this.date = '日期',
    this.open = '开盘',
    this.high = '最高',
    this.low = '最低',
    this.close = '收盘',
    this.changeAmount = '涨跌额',
    this.change = '涨跌幅',
    this.amount = '成交额',
    this.vol = '成交量',
  });
}

class DepthChartTranslations {
  final String price;
  final String amount;

  const DepthChartTranslations({
    this.price = 'Price',
    this.amount = 'Amount',
  });
}
