import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvVariable {
  EnvVariable._();

  static final EnvVariable _instance = EnvVariable._();

  static EnvVariable get instance => _instance;

  String _baseUrl = '';
  int _counter = 0;

  // TODO Do not push env files on github or bitbucket

  Future<void> initialise() async {
    await dotenv.load(fileName: '.env');

    _baseUrl = dotenv.get('BASE_URL', fallback: '');
    try{
      _counter = int.parse(dotenv.get('COUNTER'));
    }catch(e){
      _counter = 0;
    }
  }

  String get baseUrl => _baseUrl;
  int get counter => _counter;
}