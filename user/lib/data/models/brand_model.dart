class BrandModel {
  final String id;
  final String name;
  final String imageUrl;

  BrandModel({required this.id, required this.name, required this.imageUrl});
  factory BrandModel.fromMap(Map<String, dynamic> data, String documentId) {
    return BrandModel(
      id: documentId,
      name: data['name'],
      imageUrl: data['imageUrl'],
    );
  }
  Map<String , dynamic>toMap(){
    return {
      'name':name,
      'imageUrl':imageUrl
    };
  }
}
