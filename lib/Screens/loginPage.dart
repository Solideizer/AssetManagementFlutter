import 'package:flutter_asset/Screens/assetUI.dart';
import 'package:flutter_asset/Authentication/authService.dart';
import 'package:flutter_asset/Screens/registerPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool validateForm() {
    if (_formKey.currentState.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String validateEmail(email) {
    if (email.isEmpty) {
      return "Lütfen e-posta adresinizi giriniz";
    } else if (!email.contains("@")) {
      return "Geçerli bir e-posta adresi giriniz";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.75),
                  blurRadius: 10,
                  spreadRadius: 2)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _emailController,
                      validator: validateEmail,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.black,
                        ),
                        hintText: 'E-Posta',
                        prefixText: ' ',
                        hintStyle: TextStyle(color: Colors.black54),
                        focusColor: Colors.black,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      cursorColor: Colors.white,
                      controller: _passwordController,
                      validator: (val) => val.length < 6
                          ? "Şifre 6 karakterden daha kısa olamaz"
                          : null,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.black,
                        ),
                        hintText: 'Şifre',
                        prefixText: ' ',
                        hintStyle: TextStyle(
                          color: Colors.black54,
                        ),
                        focusColor: Colors.black,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    InkWell(
                      onTap: () {
                        if (validateForm()) {
                          _authService
                              .login(_emailController.text,
                                  _passwordController.text)
                              .then(
                            (value) {
                              return Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AssetPage(),
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.black, width: 2),
                          //color: colorPrimaryShade,
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              "Giriş",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.amber[400],
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 1,
                            width: 75,
                            color: Colors.black,
                          ),
                          Text(
                            "Kayıt ol",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          Container(
                            height: 1,
                            width: 75,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
