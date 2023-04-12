import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina/application_layer/services/network_services/dio_services_management/dio_service.dart';
import 'package:promina/application_layer/services/network_services/end_points_service/end_points.dart';
import 'package:promina/models_layer/get_gallery_model/get_gallery_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  // <<--------------------------------<upload Image>------------------------------------------->>
  File? fileImage;

  Future<void> uploadImageToApi(
      {required String token, required ImageSource imageSource}) async {
    emit(UploadImageGalleryLoadingState());
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      fileImage = File(pickedFile.path);
      FormData formData = FormData.fromMap({
        'img': await MultipartFile.fromFile(fileImage!.path),
      });
      await DioHelper.postImage(
              url: EndPoints.upload, data: formData, token: token)
          .whenComplete(() {
        emit(UploadImageGallerySuccessState());
        getImagesFromApi(token: token);
      }).catchError((e) {
        emit(UploadImageGalleryErrorState());
      });
    }
  }


// <<--------------------------------<Get Image>------------------------------------------->>

  GalleryImagesModel? galleryImagesModel;

  Future<void> getImagesFromApi({required String token}) async {
    emit(GetImageFromApiLoadingState());
    await DioHelper.getData(url: EndPoints.myGallery, token: token)
        .then((value) {
      galleryImagesModel = GalleryImagesModel.fromJson(value.data);
      emit(GetImageFromApiSuccessState());
    }).catchError((e) {
      emit(GetImageFromApiErrorState());
    });
  }
}
