class LogInModel {
  String? token;
  UserDataModel? user;

  LogInModel.fromJson(Map<String, dynamic> jsonData) {
    token = jsonData['token'];
    user = UserDataModel.fromJson(jsonData['user']);
  }
}

class UserDataModel {
  String? email;

  UserDataModel.fromJson(Map<String, dynamic> jsonData) {
    email = jsonData['email'];
  }
}
