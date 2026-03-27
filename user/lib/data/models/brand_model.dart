class BrandModel {
  final String id;
  final String name;
  final String imageUrl;
  final String? logoImage;

  BrandModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.logoImage,
  });
  factory BrandModel.fromMap(Map<String, dynamic> data, String documentId) {
    return BrandModel(
      id: documentId,
      name: data['name'],
      imageUrl: data['imageUrl'],
      logoImage: data['logoImage'],
    );
  }
  Map<String, dynamic> toMap() {
    return {'name': name, 'imageUrl': imageUrl, 'logoImage': logoImage};
  }
}
