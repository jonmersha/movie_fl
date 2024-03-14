import 'package:get/get.dart';

class ApIClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String,String> _mainHeaders;
  ApIClient({required this.appBaseUrl}){
    baseUrl=appBaseUrl;
    token="";
    timeout=const Duration(seconds: 30);
    _mainHeaders={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };
  }
  Future<Response> getData(String uri) async {
    try{
      //print(uri);
      Response response= await get(uri);
      //print(response.body);
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }

  }
}
