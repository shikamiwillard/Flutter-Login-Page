import 'package:flutter/material.dart';
import 'package:flutter_login_page/AuthProvider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";
  final Function onSignedOut;

  const HomePage({@required this.onSignedOut});
  void _signOut(BuildContext context) async {
    try {
      var auth = AuthProvider.of(context).auth;
      await auth.signOut();
      // Navigator.pushReplacementNamed(context, LoginPage.routeName);
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: <Widget>[
          FlatButton(
            child: Text('Logout',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                )),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text('Welcome', style: TextStyle(fontSize: 42)),
        ),
      ),
    );
  }
}
