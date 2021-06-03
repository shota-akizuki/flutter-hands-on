import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class SuzuriAPIRequest {
  @protected
  final http.Client client;
  @protected
  final String token;
  @protected
  final authority = "suzuri.jp";
  @protected
  final prefix = "/api/v1";

  String get authorization => "Bearer $token";

  SuzuriAPIRequest({
    @required this.client,
  }) : token = DotEnv.env["TOKEN"];
}
