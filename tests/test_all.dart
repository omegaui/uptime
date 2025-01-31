import 'package:uptime/core/sessions/live_session.dart';
import 'package:uptime/main.dart' as uptime;

void main() async {
  await LiveSession.init();
  // uptime.main(['--debug']);
  uptime.main(['--short', '--debug']);
  // uptime.main(['--hours', '--debug']);
  // uptime.main(['--time', '--debug']);
  // uptime.main(['--all', '--debug']);
  // uptime.main(['--millisecondsSinceEpoch', '--debug']);
}
