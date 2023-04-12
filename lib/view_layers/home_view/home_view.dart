import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/application_layer/components/constants/constants.dart';
import 'package:promina/application_layer/components/get_device_size.dart';
import 'package:promina/application_layer/components/navigation_pages.dart';
import 'package:promina/application_layer/components/reusable_components.dart';
import 'package:promina/application_layer/styles/app_themes.dart';
import 'package:promina/models_layer/get_gallery_model/get_gallery_model.dart';
import 'package:promina/view_layers/home_view/alert_dialog/showalertdialog.dart';
import '../../application_layer/styles/themes/colors.dart';
import '../../application_layer/styles/themes/icons.dart';
import '../../view_model_layers/home_view_model/home_cubit.dart';
import '../shared_background/shared_background.dart';
import 'clippath/custome_painter.dart';

class HomeViewActivity extends StatelessWidget {
  final String? token;

  const HomeViewActivity({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 3;
    return BlocProvider(
      create: (context) => HomeCubit()..getImagesFromApi(token: token!),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  const SharedBackgroundView(),
                  Positioned(
                    top: -120,
                    right: -80,
                    child: CustomPaint(
                      size: Size(
                        GetDeviceSize.getDeviceWidth(context) * 0.81,
                        (GetDeviceSize.getDeviceHeight(context) * 0.4)
                            .toDouble(),
                      ),
                      painter: RPSCustomPainter(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        upperSection(context, homeCubit),
                        (state is GetImageFromApiLoadingState)
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : (state is GetImageFromApiErrorState)
                                ? Center(
                                    child: Text(
                                      'Check Internet Connection, Then Try Again...',
                                      style: HomeTheme.welcomeMinaTextStyle,
                                    ),
                                  )
                                : (state is UploadImageGalleryLoadingState ||
                                        state is UploadImageCameraLoadingState)
                                    ? Center(
                                        child: Text(
                                          'Uploading Photo, Please Wait...',
                                          style: LoginTheme.loginTextStyle,
                                        ),
                                      )
                                    : Expanded(
                                        child: GridView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          itemCount: homeCubit
                                              .galleryImagesModel!
                                              .data!
                                              .images
                                              .length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisSpacing:
                                                GetDeviceSize.getDeviceHeight(
                                                        context) /
                                                    25,
                                            crossAxisSpacing:
                                                GetDeviceSize.getDeviceWidth(
                                                        context) /
                                                    20,
                                          ),
                                          itemBuilder: (context, index) =>
                                              Container(
                                            decoration: BoxDecoration(
                                              color: ColorsTheme.kWhiteColor,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color:
                                                      ColorsTheme.kBlack45Color,
                                                  offset: Offset(0, 4),
                                                  blurRadius: 5,
                                                ),
                                              ],
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  homeCubit.galleryImagesModel!
                                                      .data!.images[index],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget upperSection(context, HomeCubit homeCubit) => Column(
        children: [
          20.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Welcome\n${ConstantStrings.kMina}',
                  style: HomeTheme.welcomeMinaTextStyle,
                ),
              ),
              CircleAvatar(
                backgroundColor: ColorsTheme.kWhiteColor,
                radius: 28,
                backgroundImage: NetworkImage(
                  GalleryImagesModel.testCircleAvatarImage.toString(),
                ),
              ),
            ],
          ),
          40.ph,
          Row(
            children: [
              Expanded(
                child: rMaterialButton(
                  onPressed: () {
                    NavigatePages.navigateToLogInActivity(context);
                  },
                  color: ColorsTheme.kWhiteColor,
                  elevation: 0,
                  horizontal: 15,
                  child: Row(
                    children: [
                      const Icon(
                        IconsTheme.kLogOutIcon,
                        color: ColorsTheme.kRedAccentColor,
                      ),
                      10.pw,
                      Text(
                        ConstantStrings.kLogOut.toLowerCase(),
                        style: HomeTheme.logOutAndUploadTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              30.pw,
              Expanded(
                child: rMaterialButton(
                  onPressed: () {
                    showAlertDialog(context, homeCubit, token!);
                  },
                  color: ColorsTheme.kWhiteColor,
                  elevation: 0,
                  horizontal: 15,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          IconsTheme.kUploadIcon,
                          color: ColorsTheme.kOrangeAccentColor,
                        ),
                      ),
                      10.pw,
                      Expanded(
                        flex: 2,
                        child: Text(
                          ConstantStrings.kUpload.toLowerCase(),
                          style: HomeTheme.logOutAndUploadTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          30.ph,
        ],
      );
}
