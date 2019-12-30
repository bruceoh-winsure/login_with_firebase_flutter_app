import 'package:flutter/material.dart';
import 'package:login_with_firebase_flutter_app/data/user_database/data_user_repository.dart';
import 'package:login_with_firebase_flutter_app/http/auth_manager.dart';
import 'package:login_with_firebase_flutter_app/models/user/user_repository.dart';
import 'package:login_with_firebase_flutter_app/src/screens/login_backgroud_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserRepository _userRepository = DataUserRepository();
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    int test1231 = 0;
    var test = _userRepository.getTest().then((onValue){
      print("here" + onValue.toString());
      test1231 = onValue;


    });

    print(test1231);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomPaint(
            size: size,
            painter: LoginBackground(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _logoImage,
              Stack(
                children: <Widget>[
                  _inputForm(size),
                  _inputButton(size),
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

  Widget get _logoImage => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
          child: FittedBox(
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage("https://i3.wp.com/i.gifer.com/7pv.gif"),
            ),
          ),
        ),
      );

  Widget _inputButton(Size size) => Positioned(
        left: size.width * 0.1,
        right: size.width * 0.1,
        bottom: 0,
        child: SizedBox(
          height: 50,
          child: RaisedButton(
            color: Colors.blue,
            onPressed: () async {
              if(_formKey.currentState.validate()){
                print("button pressed!!");
                var http = AuthManager();
                await http.signIn();
              }



            },
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
        ),
      );

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
                    icon: Icon(Icons.vpn_key),
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
