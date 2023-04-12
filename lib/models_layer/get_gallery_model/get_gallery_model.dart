class GalleryImagesModel{
  GetImagesData? data;
  static const String testCircleAvatarImage = 'https://img.freepik.com/free-photo/'
      'bohemian-man-with-his-arms-crossed_1368-3542.jpg?w=740&t=st=1681180636~exp='
      '1681181236~hmac=5d81379507fa9592f8b114cee0c856c7422347225d0a327a286718c7dcccda4a';

  GalleryImagesModel.fromJson(Map<String, dynamic> json){
    data = GetImagesData.fromJson(json['data']);
  }
}

class GetImagesData {
  List<String> images = [];

  GetImagesData.fromJson(Map<String, dynamic> json){
    json['images'].forEach((e){
      images.add(e);
    });
  }
}