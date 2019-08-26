import 'package:flutter/material.dart';



class FormBuilder extends StatefulWidget {
  final Map<String,Object> toBuild;
  FormBuilder(this.toBuild);
  @override
  State<StatefulWidget> createState() {
    return FormBuilderState();
  }

}

class FormBuilderState extends State<FormBuilder> {

  //props
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  var formPropData = {
    'TextField' : {
      'Text': 'test',
    },
  };

  List<Widget> formObjectBuilder(){


  }
  //widgets
  Widget emailFormField(Function(String) save) {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: 'Email',
          filled: true,
          fillColor: Colors.white.withOpacity(0.6)),
      validator: (String value) {
        if(!emailChecker(value))
          return "not an email";
      },
      onSaved: (String value) {
        var saveValue = value.isEmpty ? "s" : value;
        save(saveValue);
      },);
  }

  Widget passwordFormField(Function(String) save) {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: 'Email',
          filled: true,
          fillColor: Colors.white.withOpacity(0.6)),
      validator: (String value) {
        if(value.length < 7)
          return "password too short";
      },
      onSaved: (String value) {
        var saveValue = value.isEmpty ? "s" : value;
        save(saveValue);
      },);
  }

  Widget multiTextFormField(Function(String) save) {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(labelText: 'Email',
          filled: true,
          fillColor: Colors.white.withOpacity(0.6)),
      maxLines: 3,
      validator: (String value) {
        if(!emailChecker(value))
          return "not an email";
      },
      onSaved: (String value) {
        var saveValue = value.isEmpty ? "s" : value;
        save(saveValue);
      },);
  }

  Widget numberFormField(Function(int) save, Map<String,Object>props) {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.number,
      decoration:  props["decoration"] ?? InputDecoration(labelText: props["labelText"] ?? 'number',
          filled: true,
          fillColor: Colors.white.withOpacity(0.6)),
      validator: (String value) {
        if(numberChecker(value))
          return "Not empty and needs to be number";;
      },
      onSaved: (String value) {
        var saveValue = value.isEmpty ? "s" : value;
        save(int.parse(saveValue));
      },);
  }

  Widget currencyFormField(Function(int) save) {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: 'Email',
          filled: true,
          fillColor: Colors.white.withOpacity(0.6)),
      validator: (String value) {
        if(!emailChecker(value))
          return "not an email";
      },
      onSaved: (String value) {
        var saveValue = value.isEmpty ? "s" : value;
        save(int.parse(saveValue));
      },);
  }

  //validators
  bool emailChecker(String value){
    if(RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(value))
        return true;
    return false;
  }

  bool numberChecker(String value){
    if (value.isEmpty || !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value))
      return false;
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
            width: 10,
            child: Column(children: <Widget>[]
            )
        )
    );
  }
}