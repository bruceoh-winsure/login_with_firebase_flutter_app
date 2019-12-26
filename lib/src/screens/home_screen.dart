import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
              Stack(
                children: <Widget>[
                  _inputForm(size)
                  // Container(
                  //   width: 100,
                  //   height: 50,
                  //   color: Colors.black,
                  // ),
                ],
              ),
              Container(
                height: size.height * 0.1,
              ),
              Text("Don't have an Account? Create One"),
              Container(
                height: size.height * 0.05,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: "Email",
                  ),
                  validator: (String str) {
                    if (str.isEmpty) {
                      return "Please input correct email";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: "Password",
                  ),
                  validator: (String str) {
                    if (str.isEmpty) {
                      return "Please input correct Password";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Forgot Password")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
