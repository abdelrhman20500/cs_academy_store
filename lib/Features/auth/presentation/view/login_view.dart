import 'package:cs_academy_store/Features/auth/presentation/view/widgets/custom_bottom.dart';
import 'package:cs_academy_store/Features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:cs_academy_store/Features/auth/presentation/view_manager/login_cubit.dart';
import 'package:cs_academy_store/Features/auth/presentation/view_manager/login_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: BlocProvider(
        create: (context) => LoginCubit(Dio()),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login Success"),
                  backgroundColor: Colors.green,),);
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error),
                  backgroundColor: Colors.red,),);
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/logo.png",
                        height: height*0.2,width: width*0.5,),
                      SizedBox(height: height*0.02,),
                      const Text("Login", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                      SizedBox(height: height*0.02,),
                      CustomTextFormField(
                        keyboardType: TextInputType.text,
                        hintText: "UserName",
                        controller: userNameController,
                        suffixIcon: const Icon(Icons.person_outline),
                      ),
                      SizedBox(height: height*0.02,),
                      CustomTextFormField(
                        keyboardType: TextInputType.text,
                        hintText: "Password",
                        controller: passwordController,
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      ),
                      SizedBox(height: height*0.01,),
                      const Align(
                          alignment: Alignment.bottomRight,
                          child: Text("forget Your Password?")),
                      SizedBox(height: height*0.05,),
                      state is LoginLoading ? const Center(child: CircularProgressIndicator(),)
                          :CustomBottom(text: "Login",onPressed: (){
                        if(formKey.currentState!.validate()){
                          BlocProvider.of<LoginCubit>(context).login(
                              userName: userNameController.text,
                              password: passwordController.text
                          );
                        }
                      }),
                      SizedBox(height: height*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account ?"),
                          SizedBox(width: width*0.02,),
                          const Text("SignUp"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          } ,
        ),
      ),
    );
  }
}


