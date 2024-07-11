class DateTimeService {
  DateTime get localNow => DateTime.now();
  DateTime get utcNot => localNow.toUtc();
}
