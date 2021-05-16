import 'package:flutter_asset/authService.dart';
import 'package:flutter_asset/loginPage.dart';
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                        controller: _nameController,
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
                          hintStyle: TextStyle(color: Colors.black),
                          focusColor: Colors.black,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                        )),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextField(
                        controller: _emailController,
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
                          hintStyle: TextStyle(color: Colors.black),
                          focusColor: Colors.black,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                        )),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        cursorColor: Colors.black,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.black,
                          ),
                          hintText: 'Şifre',
                          prefixText: ' ',
                          hintStyle: TextStyle(color: Colors.black),
                          focusColor: Colors.black,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                        )),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        cursorColor: Colors.black,
                        controller: _passwordAgainController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.black,
                          ),
                          hintText: 'Şifrenizi tekrar giriniz',
                          prefixText: ' ',
                          hintStyle: TextStyle(color: Colors.black),
                          focusColor: Colors.white,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                        )),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    InkWell(
                      onTap: () {
                        _authService
                            .createPerson(_nameController.text,
                                _emailController.text, _passwordController.text)
                            .then((value) {
                          return Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            //color: colorPrimaryShade,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                              child: Text(
                            "Kayıt Ol",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
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
        Padding(
          padding: EdgeInsets.only(
            top: size.height * .1,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.amber[400],
                    size: 26,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.20,
                ),
                Text(
                  "Kayıt Olun",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
