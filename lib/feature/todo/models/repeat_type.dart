enum RepeatType {
  none,
  daily,
  weekly,
  monthly,
  yearly,
}

extension RepeatTypeExtension on RepeatType {
  String get displayName {
    switch (this) {
      case RepeatType.none:
        return 'Không lặp';
      case RepeatType.daily:
        return 'Hàng ngày';
      case RepeatType.weekly:
        return 'Hàng tuần';
      case RepeatType.monthly:
        return 'Hàng tháng';
      case RepeatType.yearly:
        return 'Hàng năm';
    }
  }
}