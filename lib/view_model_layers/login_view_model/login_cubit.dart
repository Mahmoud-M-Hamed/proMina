import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/application_layer/services/network_services/end_points_service/end_points.dart';
import 'package:promina/models_layer/login_model/login_model.dart';
import '../../application_layer/components/navigation_pages.dart';
import '../../application_layer/services/network_services/dio_services_management/dio_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LogInModel? logInModel;

  //<< -----------------------------------<controllers>-------------------------------->>

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //<< -----------------------------------<validation>-------------------------------->>

  String? emailValidationFunction({required String validation}) {
    if (validation.isEmpty) return 'Please enter email address';
    if (!validation.contains('@example.net')) return 'Invalid email address';
    return null;
  }

  String? passwordValidationFunction({required String validation}) {
    if (validation.isEmpty) return 'Please enter password';
    return null;
  }

  //<< -----------------------------------<login back-end>-------------------------------->>


  Future<void> userLogIn({
    required String? email,
    required String? password,
  }) async {
    emit(LoginLoadingState());
    await DioHelper.postData(url: EndPoints.logIn, data: {
      "email": email,
      "password": password,
    }).then((value) {
      logInModel = LogInModel.fromJson(value.data);
      emit(LoginSuccessState());
    }).catchError((e) {
      emit(LoginErrorState());
    });
  }

  void onClickSubmitButton(context) {
    if (formKey.currentState!.validate()) {
      userLogIn(
        email: emailController.text,
        password: passwordController.text,
      ).whenComplete(() {
        if (state is LoginSuccessState) {
          Future.delayed(
            const Duration(seconds: 1),
            () => NavigatePages.navigateToHomeActivity(
              context,
              token: logInModel!.token,
            ),
          );
        }
      });
    }
  }
}
