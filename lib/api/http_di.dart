import 'package:http/http.dart' as HTTP;
import 'package:mini_food_app/data/constant.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

class CustomizeBaseResponse {
  bool error;
  Map<String, dynamic>? data;

  CustomizeBaseResponse({this.error = false, this.data});
}

class Logger extends MiddlewareContract {
  @override
  void interceptRequest(RequestData data) {
    print('Method: ${data.method}\n');
    print('Url: ${data.url}\n');
    print('Body: ${data.body}\n');
  }

  @override
  void interceptResponse(ResponseData data) {
    print('Status Code: ${data.statusCode}\n');
    print('Method: ${data.method}\n');
    print('Url: ${data.url}\n');
    print('Body: ${data.body}\n');
    print('Headers: ${data.headers}\n');
  }

  @override
  void interceptError(err) {
    print('Error: $err');
  }
}

class FFApiClientExtension {
  HttpWithMiddleware http = HttpWithMiddleware.build(
    middlewares: [
      HttpLogger(logLevel: LogLevel.HEADERS),
    ],
  );

  Map<String, String> configHeader() {
    return {
      'content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
  }

  Map<String, String> configApiKey() {
    return {
      'apiKey': FFConstant.API_KEY,
    };
  }

  Future<CustomizeBaseResponse> get(String endPoint, Map<String, dynamic> param) async {
    param.addAll(configApiKey());
    final url = Uri.https(FFConstant.BASE_URL, endPoint, param);

    try {
      final HTTP.Response response = await http.get(
        url,
        headers: configHeader(),
      );
      if (response.statusCode == 200) {
        return CustomizeBaseResponse(data: response.body as Map<String, dynamic>);
      } else {
        return CustomizeBaseResponse(error: true);
      }
    } catch (e) {
      return CustomizeBaseResponse(error: true);
    }
  }
}
