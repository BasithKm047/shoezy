import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:shoezy_admin/fetures/core/cloudinar_details.dart';

class CloudinaryServices {
  // final String cloudname;
  static final String  cloudname=CloudinarDetails.cloudname;
  final String uploadPreset=CloudinarDetails.cloudinarypreset;


  // CloudinaryServices({required this.cloudname, required this.uploadPreset});
  String get uploadUrl=>'https://api.cloudinary.com/v1_1/$cloudname/image/upload' ;

  Future<String>uploadUin8List(Uint8List bytes,{required String fileName})async{
    final Dio dio=Dio();
    late MultipartFile multipartFile;
multipartFile=MultipartFile.fromBytes(
  bytes,
  filename: fileName,
  contentType: DioMediaType('image','jpeg'),  
);
final formData=FormData.fromMap({
 'file':multipartFile,
 'upload_preset':uploadPreset,

});

final response=await dio.post(uploadUrl, data: formData,options: Options(headers: {
  'X-Requested-With':'XMLHttpRequest'
}));

if(response.statusCode==200 || response.statusCode==201){
  return response.data['secure_url'] as String;

}else{
  throw Exception('Failed to upload image: ${response.statusCode} - ${response.statusMessage}');
}

  }

  Future<List<String>>uploadMultipleImages(List<Uint8List> images)async{
    final Dio dio=Dio();

    List<String> uploadedUrls=[];
    try{
    for(var image in images){
      final formdata=FormData.fromMap({
        'file':MultipartFile.fromBytes(image,filename: 'image_${DateTime.now().millisecondsSinceEpoch}.jpg'),
        'upload_preset':uploadPreset,
      });
      final response=await  dio.post(
        uploadUrl,
        data: formdata,
      );
      if(response.statusCode==200 || response.statusCode==201){
       uploadedUrls.add(response.data['secure_url'] as String);
      }
      else{  
        throw Exception('Failed to upload image: ${response.statusCode} - ${response.statusMessage}');
    }
    } 
    }on DioException catch (e) {
  log('Cloudinary status: ${e.response?.statusCode}');
  log('Cloudinary body  : ${e.response?.data}'); // <- shows "Invalid upload preset", "Unknown cloud name", etc.
  rethrow;
}
    return uploadedUrls;
  }

}