import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyEnv {
  static final String ip = dotenv.env['IP'] ?? '';
  static final String ipRiot = dotenv.env['IP_RIOT'] ?? '';
  static final String ipTft = dotenv.env['IP_TFT'] ?? '';
  static final String riotKey = dotenv.env['RIOT_KEY'] ?? '';
}
