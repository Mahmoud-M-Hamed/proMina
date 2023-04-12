part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class UploadImageGalleryLoadingState extends HomeStates {}

class UploadImageGallerySuccessState extends HomeStates {}

class UploadImageGalleryErrorState extends HomeStates {}

class UploadImageCameraLoadingState extends HomeStates {}

class UploadImageCameraSuccessState extends HomeStates {}

class UploadImageCameraErrorState extends HomeStates {}

class GetImageFromApiLoadingState extends HomeStates {}

class GetImageFromApiSuccessState extends HomeStates {}

class GetImageFromApiErrorState extends HomeStates {}
