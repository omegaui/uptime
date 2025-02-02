import 'dart:io';

import 'package:intl/intl.dart';
import 'package:uptime/core/extensions/live_session_state_extension.dart';
import 'package:uptime/core/extensions/time_extension.dart';
import 'package:uptime/core/sessions/live_session.dart';

const validArgs = [
  '--version',
  '--short',
  '--hours',
  '--time',
  '--all',
  '--millisecondsSinceEpoch',
  '--help',
];

void main(List<String> args) async {
  if (args.contains('--version')) {
    stdout.writeln("v0.0.1+5");
    exit(0);
  }
  if (args.contains('--help')) {
    stdout.writeln("uptime is a cli tool to check current session duration,");
    stdout.writeln(
        "moreover, this tool is just a part of Nakime Windows Service,\nfor a full fledged UI checkout https://github.com/omegaui/nakime");
    stdout.writeln();
    stdout.writeln("usage: uptime [options]");
    stdout.writeln("options:");
    stdout.writeln();
    stdout.writeln('--version\t\t\tPrints tool version.');
    stdout.writeln(
        '--short\t\t\t\tPrints duration in short format. Example: 2 d 1 h 5 m 10 s');
    stdout.writeln(
        '--hours\t\t\t\tPrints elapsed hours in decimal format. Example: 2.5 which equals to 2 hours 30 minutes');
    stdout.writeln(
        '--time\t\t\t\tPrints time at which session was started. Example: 31/01/2025 09:25:21 PM');
    stdout.writeln(
        '--time\t\t\t\tPrints time along with duration. Example: 31/01/2025 09:25:21 PM (1 h 15 m 17 s)');
    stdout.writeln(
        '--millisecondsSinceEpoch\tPrints millisecond since epoch. Example: 1738338921000');
    stdout.writeln('--help\t\t\t\tPrints this help message');
    exit(0);
  }
  await LiveSession.init();
  if (LiveSession.state.isError) {
    stderr.writeln(
        "An error occurred reading live session data, please make sure NakimeWindowsService is installed correctly and is running.");
    exit(127);
  } else if (LiveSession.state.isEmpty) {
    stdout.writeln(
        "No session data found, please start the NakimeWindowsService.");
    exit(1);
  } else {
    final duration = DateTime.now().difference(LiveSession.systemStartupTime);
    if (args.contains('--short')) {
      stdout.writeln(duration.timeShort);
    } else if (args.contains('--hours')) {
      stdout.writeln(duration.asHours);
    } else if (args.contains('--time')) {
      stdout.writeln(DateFormat('dd/MM/yyyy hh:mm:ss a')
          .format(LiveSession.systemStartupTime));
    } else if (args.contains('--all')) {
      stdout.writeln(
          "${DateFormat('dd/MM/yyyy hh:mm:ss a').format(LiveSession.systemStartupTime)} (${duration.timeShort})");
    } else if (args.contains('--millisecondsSinceEpoch')) {
      stdout.writeln(LiveSession.systemStartupTime.millisecondsSinceEpoch);
    } else {
      if (args.isNotEmpty) {
        final invalidArgs = args.where((e) => !validArgs.contains(e));
        if (invalidArgs.isNotEmpty) {
          stderr.writeln("Invalid arguments: $invalidArgs");
          exit(1);
        }
      }
      stdout.writeln(duration.time);
    }
  }
  exit(0);
}
