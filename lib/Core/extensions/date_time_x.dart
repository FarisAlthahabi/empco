import 'package:intl/intl.dart';
import 'package:moment_dart/moment_dart.dart';

extension DateTimeX on DateTime {
  //Jan 15th 2024
  String get formatMMDoYYYY => Moment(this).format('MMM Do YYYY');

  //January 15th 2024
  String get formatMMMMMDoYYYY => Moment(this).format('MMMM Do YYYY');

  //01/15/2024
  String get formatMMddYYYY => DateFormat('MM/dd/yyyy').format(this);

  //Jan 05, 2023 • 09:54
  String get formatLLLddYYYYHHmm =>
      DateFormat('LLL dd, yyyy • HH:mm').format(this);

  //09:54
  String get formatHHmm => DateFormat('HH:mm').format(this);

  //January 15th 01:44 PM
  String get formatMMMMDohhmma => Moment(this).format('MMMM Do hh:mm a');
}

extension DateTimeX2 on DateTime? {
  String? get formatHHmm {
    final dateTime = this;

    if (dateTime != null) {
      return dateTime.formatHHmm;
    }

    return null;
  }
}
