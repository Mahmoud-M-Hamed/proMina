import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/application_layer/components/constants/constants.dart';
import 'package:promina/application_layer/components/reusable_components.dart';
import 'package:promina/application_layer/styles/app_themes.dart';
import 'package:promina/view_layers/shared_background/shared_background.dart';
import 'package:promina/view_model_layers/login_view_model/login_cubit.dart';
import '../../application_layer/components/get_device_size.dart';
import '../../application_layer/styles/themes/colors.dart';

class LogInViewActivity extends StatelessWidget {
  const LogInViewActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 3;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          LoginCubit loginCubit = LoginCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  const SingleChildScrollView(
                    child: SharedBackgroundView(),
                  ),
                  Positioned(
                    left: GetDeviceSize.getDeviceWidth(context) / 20,
                    child: Image.asset(
                      '${ConstantStrings.kAssetImagePath}edge2.png',
                      height: GetDeviceSize.getDeviceHeight(context) / 5,
                      width: GetDeviceSize.getDeviceWidth(context) / 2.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          130.ph,
                          Text(
                            'My',
                            style: LoginTheme.myGalleryStyle,
                          ),
                          Text(
                            ConstantStrings.kGallery,
                            style: LoginTheme.myGalleryStyle,
                          ),
                          50.ph,
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: GetDeviceSize.getDeviceHeight(context) / 2,
                            width: GetDeviceSize.getDeviceWidth(context) / 1.2,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Form(
                              key: loginCubit.formKey,
                              child: Column(
                                children: [
                                  40.ph,
                                  Text(
                                    ConstantStrings.kLogIn.toUpperCase(),
                                    style: LoginTheme.loginTextStyle,
                                  ),
                                  40.ph,
                                  rTextField(
                                      hintText: ConstantStrings.kUserName,
                                      textEditingController:
                                          loginCubit.emailController,
                                      validator: (validation) =>
                                          loginCubit.emailValidationFunction(
                                              validation: validation!)),
                                  20.ph,
                                  rTextField(
                                      hintText: ConstantStrings.kPassword,
                                      obscureText: true,
                                      textEditingController:
                                          loginCubit.passwordController,
                                      validator: (validation) =>
                                          loginCubit.passwordValidationFunction(
                                              validation: validation!)),
                                  20.ph,
                                  (state is LoginLoadingState)
                                      ? const CircularProgressIndicator()
                                      : rMaterialButton(
                                          vertical: 12,
                                          horizontal: 90,
                                          color: ColorsTheme.kAppMainColor,
                                          onPressed: () {
                                            loginCubit
                                                .onClickSubmitButton(context);
                                          },
                                          child: Text(
                                            (state is LoginErrorState)
                                                ? 'Try Again'
                                                : ConstantStrings.kSubmit
                                                    .toUpperCase(),
                                            style: LoginTheme
                                                .submitTextButtonStyle,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
