import 'package:dio/dio.dart';
import 'package:dog_app_provider/app/login_provider.dart';
import 'package:dog_app_provider/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login'),
          ChangeNotifierProvider<LoginProvider>(
            create: (_) => LoginProvider(
              loginService: LoginService(
                Dio(),
              ),
            ),
            child: Consumer<LoginProvider>(
              builder: (_, model, child) => _buildLoginProvider(model),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginProvider(LoginProvider model) {
    return Form(
      key: globalKey,
      child: Column(
        children: [
          Card(
            color: Colors.grey[200],
            margin: const EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    validator: (_) {
                      if (!model.correctEmail) {
                        return "Please Enter Correct Email";
                      }
                      return null;
                    },
                    key: const ValueKey('email_form_field'),
                    style: TextStyle(
                      color: !model.correctEmail ? Colors.red : Colors.black,
                    ),
                    onChanged: (value) {
                      model.email = value;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (_) {
                      if (!model.correctPassword) {
                        return "Please Enter Correct Password";
                      }
                      return null;
                    },
                    key: const ValueKey('password_form_field'),
                    style: TextStyle(
                      color: !model.correctPassword ? Colors.red : Colors.black,
                    ),
                    onChanged: (value) {
                      model.password = value;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  model.token != null
                      ? const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text('200'),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
          InkWell(
            child: Container(
              color: Colors.blue,
              margin: const EdgeInsets.all(15),
              height: 30,
              child: const Text('Submit'),
              alignment: Alignment.center,
            ),
            onTap: () async {
              if (globalKey.currentState!.validate()) {
                await model.login();
              }
            },
          ),
        ],
      ),
    );
  }
}
