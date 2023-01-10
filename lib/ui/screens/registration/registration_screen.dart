import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _passwordVerificationController =
        TextEditingController();
    TextEditingController _nameController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: TextFormField(
                maxLines: 1,
                controller: _nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Your Name",
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: TextFormField(
                maxLines: 1,
                controller: _emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Your Email",
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: TextFormField(
                maxLines: 1,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Your Password",
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: TextFormField(
                maxLines: 1,
                controller: _passwordVerificationController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Confirm Password",
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () => {
                      // vm.doRegister(_nameController.text,_emailController.text, _passwordController.text)
                    },
                child: Text("Create"))
          ],
        ),
      ),
    );
  }
}
