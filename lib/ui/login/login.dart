import 'package:dog_app_provider/app/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login'),
          Column(
            children: [
              ChangeNotifierProvider<LoginProvider>(
                create: (_) => LoginProvider(),
                child: Consumer<LoginProvider>(
                  builder: (_, model, child) => _buildLoginProvider(model),
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
                onTap: () async {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoginProvider(LoginProvider model) {
    return Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              style: TextStyle(
                color: !model.correctEmail
                    ? Colors.red
                    : Colors.black,
              ),
              onChanged: (value) {
                model.email = value;
              },
              // enabled: !state.isBusy,
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
            TextField(
              style: TextStyle(
                color: !model.correctPassword
                    ? Colors.red
                    : Colors.black,
              ),
              onChanged: (value) {
                model.password = value;
              },
              // enabled: !state.isBusy,
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
            // state.submissionSuccess
            //     ? const Padding(
            //         padding: EdgeInsets.only(top: 15),
            //         child: Text('200'),
            //       )
            //     : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
