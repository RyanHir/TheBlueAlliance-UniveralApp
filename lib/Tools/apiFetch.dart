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
  final String cacheKey = "/$endpoint/cache";
  final String lastModKey = "/$endpoint/last_mod";

  SharedPreferences prefs = await SharedPreferences.getInstance();

  var header = _baseHeader;
  var url = "$_baseURL/$endpoint";
  extra.forEach((k, v) => header[k] = v);

  if (prefs.containsKey(lastModKey)) {
    try {
      String modDate = prefs.getString(lastModKey);
      header["If-Modified-Since"] = modDate;
      print("Found Date in cache");
    } catch (e) {
      print(e);
    }
  } else {
    print("Missing Date in cache");
  }

  http.Response response = await http.get(url, headers: header);

  print("Response Code: ${response.statusCode}");
  if (response.statusCode == 200) {
    assert(response.headers.containsKey("last-modified"));
    await prefs.setString(cacheKey, response.body);
    await prefs.setString(lastModKey, response.headers["last-modified"]);
    return decode.jsonDecode(response.body);
  } else if (response.statusCode == 304) {
    print("Pulling from Cache");
    assert(prefs.containsKey(cacheKey));
    assert(prefs.containsKey(lastModKey));
    return decode.jsonDecode(prefs.getString(cacheKey));
  } else {
    throw UnimplementedError();
  }
}
