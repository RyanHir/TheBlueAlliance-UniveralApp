import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as decode;
import 'package:tba/constants.dart';

const _baseURL = "https://www.thebluealliance.com/api/v3";
const _baseHeader = {
  "X-TBA-Auth-Key": "$kAPIKey",
  "Connection": "keep-alive",
  "Accept": "application/json",
  "Accept-Encoding": "gzip",
  "User-Agent": "gzip"
};

Future<dynamic> fetch(String endpoint, Map<String, String> extra) async {
  // Keys
  final String cacheKey = "/cache/$endpoint/data";
  final String lastModKey = "/cache/$endpoint/last_mod";
  final String url = "$_baseURL/$endpoint";
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final Map<String, String> header = {..._baseHeader, ...extra};

  final response = await http.get(url,
      headers: Map.from(header)
        ..addAll({"If-Modified-Since": prefs.getString(lastModKey) ?? ""}));

  switch (response.statusCode) {
    case 200:
      await Future.wait([
        prefs.setString(cacheKey, response.body),
        prefs.setString(lastModKey, response.headers["last-modified"])
      ]);
      return decode.jsonDecode(response.body);
    case 304:
      debugPrint("Using Data from cache");
      return decode.jsonDecode(prefs.getString(cacheKey));
    default:
      print("Unknown Response Code: ${response.statusCode}");
      throw UnimplementedError();
  }
}
