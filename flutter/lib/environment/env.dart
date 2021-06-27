import 'dart:io';

const int  port = 80;
final String serverUrl = Platform.isAndroid ? "http://10.0.2.2:$port": "http://localhost:$port";