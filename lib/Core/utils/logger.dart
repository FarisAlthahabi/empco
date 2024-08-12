import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(methodCount: 5),
);

// ignore: unused_element
class _ReleaseFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => true;
}
