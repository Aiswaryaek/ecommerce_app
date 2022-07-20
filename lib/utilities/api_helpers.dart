import 'package:ecommerce_app/utilities/base_urls.dart';
import 'package:http/http.dart';


class Resource<T> {
  String? url;
  T Function(Response response)? parse;

  Resource({this.url,this.parse});
}



Uri getUrl(String component) {
  var url= Uri.parse(BaseUrls.devApiBaseUrl + component);
  return url;
}