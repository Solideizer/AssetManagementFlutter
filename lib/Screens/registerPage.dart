import 'package:flutter_asset/Authentication/authService.dart';
import 'package:flutter_asset/Screens/loginPage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  AuthService _authService = AuthService();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateForm() {
    if (_formKey.currentState.validate()) {
      print("validated");
    } else {
      print("not validated");
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
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.cover),
                  color: Colors.amber[400].withOpacity(.75),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.75),
                        blurRadius: 10,
                        spreadRadius: 2)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) => val.isNotEmpty
                              ? null
                              : "Lütfen kullanıcı adınızı giriniz",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            hintText: 'Kullanıcı adı',
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
                          controller: _emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            hintText: 'E-Mail',
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
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          cursorColor: Colors.black,
                          controller: _passwordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          cursorColor: Colors.black,
                          controller: _passwordAgainController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) => val.length < 6
                              ? "Şifre 6 karakterden daha kısa olamaz"
                              : null,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.black,
                            ),
                            hintText: 'Şifrenizi tekrar giriniz',
                            prefixText: ' ',
                            hintStyle: TextStyle(color: Colors.black54),
                            focusColor: Colors.white,
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
                            validateForm();
                            _authService
                                .register(
                                    _nameController.text,
                                    _emailController.text,
                                    _passwordController.text)
                                .then(
                              (value) {
                                return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                            );
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
                                "Kayıt Ol",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber[400],
                                  fontSize: 22,
                                ),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * .07,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
