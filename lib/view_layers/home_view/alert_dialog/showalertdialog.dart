import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina/application_layer/components/constants/constants.dart';
import 'package:promina/application_layer/components/reusable_components.dart';
import 'package:promina/application_layer/styles/app_themes.dart';
import 'package:promina/application_layer/styles/themes/icons.dart';
import 'package:promina/view_model_layers/home_view_model/home_cubit.dart';
import '../../../application_layer/styles/themes/colors.dart';

showAlertDialog(context, HomeCubit homeCubit, String token) => showDialog(
      context: context,
      barrierColor: ColorsTheme.kTransparentColor,
      builder: (context) => AlertDialog(
        elevation: 0,
        backgroundColor: ColorsTheme.kTransparentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        content: alertDialogContent(homeCubit, token),
      ),
    );

Widget alertDialogContent(HomeCubit homeCubit, String token) => ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          height: 270,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorsTheme.kWhiteColor,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              rMaterialButton(
                color: ColorsTheme.kGalleryButtonColor,
                horizontal: 15,
                vertical: 15,
                onPressed: () {
                  homeCubit.uploadImageToApi(
                      token: token, imageSource: ImageSource.gallery);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      IconsTheme.kGalleryIcon,
                    ),
                    15.pw,
                    Text(
                      ConstantStrings.kGallery,
                      style: HomeTheme.alertDialogContentStyle,
                    ),
                  ],
                ),
              ),
              40.ph,
              rMaterialButton(
                color: ColorsTheme.kCameraButtonColor,
                horizontal: 15,
                vertical: 15,
                onPressed: () {
                  homeCubit.uploadImageToApi(token: token, imageSource: ImageSource.camera);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      IconsTheme.kCameraIcon,
                    ),
                    15.pw,
                    Text(
                      ConstantStrings.kCamera,
                      style: HomeTheme.alertDialogContentStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
