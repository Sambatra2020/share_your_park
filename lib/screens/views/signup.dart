import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/models/user.dart' as userModel;
import 'package:share_your_park/screens/views/car.dart';
import 'package:validators/validators.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();
  String currentFirstName;
  String currentLastName;
  String currentEmail;
  String currentAdress;
  int currentCodePostal;
  String currentNumeroPhone;
  userModel.UserInformation newUser = userModel.UserInformation();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          child: Container(
            child: Column(children: [
              Container(
                  height: size.height / 2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color(0xFFFF008D),
                        Color(0xFFFF6EBE),
                      ])),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          //color: Colors.amber,
                          margin: EdgeInsets.only(left: 40, top: 5),
                          child: Align(
                              child: Image.asset(
                            'assets/images/bien.png',
                            height: 260,
                            width: 240,
                            alignment: Alignment(0, 1),
                          )),
                        ),
                        // SizedBox(height: 5,),
                        /*Center(
                            child: Text("Enregistre-toi !",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontFamily: 'Quicksand')))*/
                      ],
                    ),
                  )),
              Container(
                height: 10.0,
                color: Color(0xFFA3005A),
              ),
              Form(
                key: _formkey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Row(
                      children: [
                        Expanded(
                          //margin: EdgeInsets.symmetric(vertical:5, horizontal: 130),
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFFF008D))),
                              prefixIcon: Icon(FontAwesome.user,
                                  color: Color(0xFFFF008D)),
                              labelText: 'Nom',
                              labelStyle: TextStyle(
                                color: Color(0xFFFF008D),
                                fontSize: 15,
                              ),
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'obligatoire' : null,
                            onChanged: (val) =>
                                setState(() => currentFirstName = val),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          //margin: EdgeInsets.symmetric(vertical:5, horizontal: 130),
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFFF008D))),
                              labelText: 'Prénom',
                              labelStyle: TextStyle(
                                color: Color(0xFFFF008D),
                                fontSize: 15,
                              ),
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'obligatoire' : null,
                            onChanged: (val) =>
                                setState(() => currentLastName = val),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Row(
                      children: [
                        Expanded(
                          //margin: EdgeInsets.symmetric(vertical:5, horizontal: 130),
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFFF008D))),
                              prefixIcon: Icon(FontAwesome.home,
                                  color: Color(0xFFFF008D)),
                              labelText: 'Adresse',
                              labelStyle: TextStyle(
                                color: Color(0xFFFF008D),
                                fontSize: 15,
                              ),
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'obligatoire' : null,
                            onChanged: (val) =>
                                setState(() => currentAdress = val),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          //margin: EdgeInsets.symmetric(vertical:5, horizontal: 130),
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFFF008D))),
                              labelText: 'Code postal',
                              labelStyle: TextStyle(
                                color: Color(0xFFFF008D),
                                fontSize: 15,
                              ),
                            ),
                            validator: (val) =>
                                isNumeric(val) != true || val.length != 4
                                    ? 'obligatoire'
                                    : null,
                            onChanged: (val) => setState(
                                () => currentCodePostal = int.parse(val)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF008D))),
                        prefixIcon:
                            Icon(FontAwesome.phone, color: Color(0xFFFF008D)),
                        labelText: 'Numéro de téléphone',
                        labelStyle: TextStyle(
                          color: Color(0xFFFF008D),
                          fontSize: 15,
                        ),
                      ),
                      validator: (val) => val.isEmpty || val.length != 18
                          ? 'n° phone obligatoire'
                          : null,
                      onChanged: (val) =>
                          setState(() => currentNumeroPhone = val),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF008D))),
                        prefixIcon: Icon(FontAwesome.envelope,
                            color: Color(0xFFFF008D)),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color(0xFFFF008D),
                          fontSize: 15,
                        ),
                      ),
                      validator: (val) => EmailValidator.validate(val) == false
                          ? 'Email obligatoire'
                          : null,
                      onChanged: (val) => setState(() => currentEmail = val),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF008D))),
                        prefixIcon:
                            Icon(FontAwesome.lock, color: Color(0xFFFF008D)),
                        labelText: 'Mot de passe',
                        labelStyle: TextStyle(
                          color: Color(0xFFFF008D),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 240,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        color: Color(0xFFFF008D),
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            newUser.setId("nata01");
                            newUser.setFirstName(currentFirstName);
                            newUser.setLastName(currentLastName);
                            newUser.setNumeroPhone(currentNumeroPhone);
                            newUser.setEmail(currentEmail);
                            newUser.setCodePostal(currentCodePostal);
                            newUser.setAdress(currentAdress);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Car(
                                          newUser: newUser,
                                        )));
                          }
                        },
                        child: Text(
                          "S'inscrire",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Quicksand'),
                        )),
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
