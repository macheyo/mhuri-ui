import 'dart:convert';
import 'dart:io';

import 'package:best_flutter_ui_templates/model/token.dart';

class CoreInvoker{

    Future<HttpClientResponse> invoke(String uri, Map data) async{
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(uri));
      request.headers.set('content-type', 'application/json');
      Token token = await getToken();
      request.headers.set('authorization', token.tokenType+' '+token.accessToken);
      request.headers.set('X-TenantID', 'macheyo');
      request.add(utf8.encode(json.encode(data)));
      HttpClientResponse response = await request.close();
      httpClient.close();
      return response;
    }

    Future<Token> getToken() async{
      HttpClient httpClient = new HttpClient();
      Map data = {
        'email': 'kudzai@macheyo.co.zw',
        'password':'Hi@ryl@h2020'
      };
      HttpClientRequest request = await httpClient.postUrl(Uri.parse('https://mhuri-core.herokuapp.com/mhuri/auth/login'));
      request.headers.set('content-type', 'application/json');
      request.headers.set('X-TenantID', 'macheyo');
      request.add(utf8.encode(json.encode(data)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      Map<String, dynamic> tokenMap = jsonDecode(reply);
      return Token.fromJson(tokenMap);
    }
}