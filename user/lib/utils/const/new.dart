

import 'package:dio/dio.dart';
import 'package:dio_handler/dio_handler.dart';

void main(List<String> args)async {
  Apiservices api=Apiservices();
  String data =  await api.fetchData();
  print(data);
}





class Apiservices{
  static String baseUrl='https://api.thecatapi.com/v1/images/search?limit=10&breed_ids=beng&api_key=REPLACE_ME';
     Dio dio= DioHandler(dio: Dio()).dio;
  Future<dynamic> fetchData() async {
    try {
      Response response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      if(e is DioError){
        return 'DioError: ${e.message}';
      }
      return 'Exception: $e';
    }   
  }  

Future<bool> create()async{
  try{
    Response response = await dio.post(baseUrl,data: {'name':'test'});
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }catch(e){
    if(e is DioError){
      print('DioError: ${e.message}');
    }
  }
  return false;
}
Future<bool> update()async{
  try{
    Response response = await dio.put(baseUrl,data: {'name':'updated name'});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }catch(e){
    if(e is DioError){
      print('DioError: ${e.message}');
    }
  }
  return false;
} 
Future<bool> delete()async{
  try{
    Response response = await dio.delete(baseUrl);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }catch(e){
    if(e is DioError){
      print('DioError: ${e.message}');
    }
  }
  return false;
} 
}