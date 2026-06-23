import 'package:cs_academy_store/Core/Utilis/shared_preferences.dart';
import 'package:cs_academy_store/Features/auth/presentation/view_manager/login_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit(this.dio):super(LoginInitial());
  final Dio dio;
  Future<void> login({required String userName, required String password})async{
    emit(LoginLoading());
    try {
      final response = await dio.post("https://dummyjson.com/auth/login",data: {
        "username": userName,
        "password": password,
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        }
      ),);
      if(response.statusCode == 200){
        /// save token ......
        SharedPref.saveToken(response.data["accessToken"]);
        print(response.data["accessToken"]);
        emit(LoginSuccess());
      }else{
        emit(LoginFailure(error: "Please Try again"));
      }
    }catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}