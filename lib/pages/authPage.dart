import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:udemy_project/scoped_model/main_model.dart';


class Auth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthState();
  }
}



class AuthState extends State<Auth> {

  String _emailValue;
  String _passwordValue;
  bool _accepted = false;

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double deviceWith = MediaQuery
        .of(context)
        .size
        .width;
    final double targetWidth = deviceWith > 550.0 ? 500 : deviceWith * 0.95;
    return Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Container(
            decoration: BoxDecoration(image:
            DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/background.jpg'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
            ),
              color: Theme
                  .of(context)
                  .accentColor,
            ),

            padding: EdgeInsets.all(10.0),
            child: Center(
              child:
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                      width: targetWidth,
                      child: Column(children: <Widget>[
                        TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(labelText: 'Email',
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.6)),
                        validator: (String value) {
                         if(!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(value)){
                           return "not an email";
                         }
                        },
                          onSaved: (String value) {
                            this._emailValue = value.isEmpty ? "s" : value;
                          },),

                        //Text(titleValue),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password',
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.6)),
                          obscureText: true,
                          onSaved: (String value) {
                            this._passwordValue = value.isEmpty ? "s" : value;
                          },
                        ),
                        DecoratedBox(
                          child:
                          SwitchListTile(
                            dense: true,
                            title: Text('Accept Terms',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            value: _accepted,
                            onChanged: (bool value) {
                              setState(() {
                                _accepted = value ?? false;
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6)),
                        ),
                        SizedBox(height: 10.0,),
                        ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model) {
                          return RaisedButton(
                              child: Text('Login'),
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              onPressed: () {

                                if (!_formKey.currentState.validate())
                                  return;
                                _formKey.currentState.save();
                                model.login(this._emailValue, this._passwordValue);
                                Navigator.pushReplacementNamed(
                                    context, '/products');
                              }
                          );
                        })
                      ],)
                  ),
                ),
              ),
            )
        )
    );
  }
}