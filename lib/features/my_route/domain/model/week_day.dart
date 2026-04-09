class WeekDay {
  const WeekDay({
    required this.dayKey,   // translation key e.g. 'day_mon'
    required this.date,     // display number e.g. '12'
    required this.isSelected,
  });

  final String dayKey;
  final String date;
  final bool   isSelected;
}