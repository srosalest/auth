import 'package:flutter/material.dart';
import 'package:tureciclaje_auth/services/cloudfirestore.dart';
import 'package:tureciclaje_auth/services/flutterfire.dart';
import '../routes.dart';

class Register extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _repeatpasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/TR2.png",
      height: mq.size.height / 4,
    );

    final usernameField = TextFormField(
      controller: _usernameController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        hintText: "John_Doe",
        labelText: "Username",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );

    final emailField = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        hintText: "JohnDoe@domain.code",
        labelText: "Email",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );

    final passwordField = TextFormField(
      obscureText: true,
      controller: _passwordController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        hintText: "password",
        labelText: "Password",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );

    final repeatpasswordField = TextFormField(
      obscureText: true,
      controller: _repeatpasswordController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        hintText: "repeat password",
        labelText: "Re-enter Password",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          usernameField,
          emailField,
          passwordField,
          repeatpasswordField,
        ],
      ),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          await signUp(
            _emailController.text.trim(),
            _passwordController.text.trim(),
            _usernameController.text.trim(),
          );
          await checkAuth();
          //
          userSetup();
          //TODO: agregar camino alternativo en caso no de registrar
          Navigator.of(context).pushNamed(AppRoutes.menu);
        },
      ),
    );

    final button = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        registerButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Already have an account?",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.black),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.authLogin);
              },
              child: Text(
                "Log in",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Container(
            height: mq.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                logo,
                fields,
                Padding(
                  padding: EdgeInsets.only(bottom: 100),
                  child: button,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
