import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor/SizeConfig.dart';
import 'package:vendor/homePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 414;
    var h = SizeConfig.screenHeight / 896;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOGIN",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.black38),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: h * 65,
              width: b * 345,
              decoration: BoxDecoration(
                color: Color(0xffefefef),
                borderRadius: BorderRadius.circular(b * 70),
              ),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: txtS(Colors.grey, 16, FontWeight.w500),
                decoration: dec('Email ID'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: h * 65,
              width: b * 345,
              decoration: BoxDecoration(
                color: Color(0xffefefef),
                borderRadius: BorderRadius.circular(b * 70),
              ),
              child: TextField(
                controller: pwdController,
                obscuringCharacter: '*',
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                style: txtS(Colors.grey, 16, FontWeight.w500),
                decoration: dec('Password'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }), (route) => false);
                },
                color: Color(0xff0faae2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(b * 40),
                ),
                elevation: 0,
                height: h * 65,
                minWidth: b * 345,
                child: Text("Login"),
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text("Don't have an account?"),
            SizedBox(
              height: 5,
            ),
            Text(
              "Create Account",
              style: TextStyle(
                  color: Color(0xff0faae2),
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }

  TextStyle txtS(Color col, double siz, FontWeight wg) {
    return TextStyle(
      color: col,
      fontWeight: wg,
      fontSize: SizeConfig.screenWidth * siz / 414,
    );
  }

  InputDecoration dec(String txt) {
    return InputDecoration(
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      hintText: txt,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: SizeConfig.screenWidth * 16 / 414,
        fontWeight: FontWeight.w400,
      ),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight * 23 / 896,
          horizontal: SizeConfig.screenWidth * 23 / 414),
    );
  }

  login() async {
    String email = emailController.text;
    String pwd = pwdController.text;

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pwd)
          .then((credential) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login Successful"),
          backgroundColor: Color(0xff28797c),
          behavior: SnackBarBehavior.floating,
        ));
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
    } catch (e) {
      print(e);
    }
  }
}
