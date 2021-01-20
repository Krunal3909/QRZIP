import 'package:flutter/services.dart';
import 'package:shopping_app/screens/login/login_ui.dart';
import 'package:shopping_app/services/auth.dart';
import 'package:shopping_app/utills/colors.dart';
import 'package:shopping_app/utills/imports.dart';
import 'package:shopping_app/utills/size_config.dart';
import 'package:shopping_app/widget/custome_round_button_enable.dart';
import 'package:shopping_app/widget/custome_round_text_form_field.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/widget/loading.dart';

class RegisterUi extends StatefulWidget {
  static String id = '/RegisterUi';
  List<String> videoList;


  @override
  _RegisterUiState createState() => _RegisterUiState();
}


class _RegisterUiState extends State<RegisterUi> {

  bool passwordToggle = false;
  bool passwordError = false;
  bool emailError = false;
  bool usernameError = false;
  bool genderError = false;
  bool mobileError = false;
  bool birthdateError = false;

  String email = '';
  String password = '';
  String username = '';
  String dob = '';
  String mobileno = '';

  final AuthService _auth = AuthService();
  final _loginFormKey = GlobalKey<FormState>();
  final _usernameFieldController = TextEditingController();
  final _dateFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();
  final _mobileFieldController = TextEditingController();
  final _passFieldController = TextEditingController();
  DateTime _selectedDate;

  // state variable
  int gender = 0;
  bool loading = false;

  void _handleRadioValueChange(int value) {
    setState(() {
      gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(SizeConfig.sizes(26)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Registration",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: SizeConfig.sizes(10),
                          ),
                          Text(
                            "Create an account",
                            style: Theme.of(context).textTheme.headline3,
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateLogin(context);
                        },
                        child: Text(
                          "Sign in",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Colors.lightGreen),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Theme.of(context).dividerColor,
                ),
                Form(
                  key: _loginFormKey,
                  child: Container(
                    width: SizeConfig.width,
                    padding: EdgeInsets.all(SizeConfig.sizes(26)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Username",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(fontWeight: FontWeight.bold)),
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            CustomRoundedTextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _usernameFieldController,
                              hintText: 'xyz',
                              prefixIcon: Icon(
                                Icons.account_box,
                                color: MyColors.grayOneColor,
                              ),
                              onChanged: (val){
                                setState(() => username = val);
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  setState(() {
                                    usernameError = true;
                                  });
                                } else {
                                  setState(() {
                                    usernameError = false;
                                  });
                                }
                              },
                            ),
                            Visibility(
                                visible: usernameError,
                                child: errorText('Username not empty'))
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.sizes(6),
                        ),
                        Container(
                          width: SizeConfig.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Gender",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: SizeConfig.sizes(8),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    right: SizeConfig.sizes(12)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.sizes(6)),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                        color: MyColors.grayOneColor, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Radio(
                                          value: 0,
                                          groupValue: gender,
                                          onChanged: _handleRadioValueChange,
                                        ),
                                        Text("Male",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5
                                                .copyWith(
                                                fontWeight:
                                                FontWeight.bold)),
                                      ],
                                    ),
                                    Container(
                                      height: SizeConfig.sizes(20),
                                      width: 1,
                                      color: Theme.of(context).dividerColor,
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: gender,
                                          onChanged: _handleRadioValueChange,
                                        ),
                                        Text("Female",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5
                                                .copyWith(
                                                fontWeight:
                                                FontWeight.bold)),
                                      ],
                                    ),
                                    Container(
                                      height: SizeConfig.sizes(20),
                                      width: 1,
                                      color: Theme.of(context).dividerColor,
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 2,
                                          groupValue: gender,
                                          onChanged: _handleRadioValueChange,
                                        ),
                                        Text("Other",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5
                                                .copyWith(
                                                fontWeight:
                                                FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.sizes(12),
                        ),
                        Text("Email",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(fontWeight: FontWeight.bold)),
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            CustomRoundedTextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailFieldController,
                              hintText: 'xyz@xyz.com',
                              prefixIcon: Icon(
                                Icons.email,
                                color: MyColors.grayOneColor,
                              ),
                              onChanged: (val){
                                setState(() => email = val);
                              },
                              validator: (String value) {
                                if (!value.contains('@')) {
                                  setState(() {
                                    emailError = true;
                                  });
                                } else {
                                  setState(() {
                                    emailError = false;
                                  });
                                }
                              },
                            ),
                            Visibility(
                                visible: emailError,
                                child: errorText('enter valid email'))
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.sizes(6),
                        ),
                        Text("Date of Birth",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(fontWeight: FontWeight.bold)),
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            CustomRoundedTextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _dateFieldController,
                              readOnly: true,
                              hintText: 'jul 2,1996',
                              onTap: () {
                                _selectDate(context);
                              },
                              prefixIcon: Icon(
                                Icons.date_range,
                                color: MyColors.grayOneColor,
                              ),
                              onChanged: (val){
                                setState(() => dob = val);
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  setState(() {
                                    birthdateError = true;
                                  });
                                } else {
                                  setState(() {
                                    birthdateError = false;
                                  });
                                }
                              },
                            ),
                            Visibility(
                                visible: birthdateError,
                                child: errorText('enter valid date'))
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.sizes(6),
                        ),
                        Text("Mobile",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(fontWeight: FontWeight.bold)),
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            CustomRoundedTextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                                LengthLimitingTextInputFormatter(10),
                              ],
                              controller: _mobileFieldController,
                              hintText: '0000000000',
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(10.0),
                                width: 20,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("+91",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(color: MyColors.grayOneColor)),
                                ),
                              ),
                              onChanged: (val){
                                setState(() => mobileno = val);
                              },
                              validator: (String value) {
                                if (value.isEmpty || value.length < 10) {
                                  setState(() {
                                    mobileError = true;
                                  });
                                } else {
                                  setState(() {
                                    mobileError = false;
                                  });
                                }
                              },
                            ),
                            Visibility(
                                visible: mobileError,
                                child: errorText('enter valid mobile'))
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.sizes(6),
                        ),
                        Text("Password",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(fontWeight: FontWeight.bold)),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomRoundedTextFormField(
                              controller: _passFieldController,
                              hintText: '******',
                              obscureText: passwordToggle,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: MyColors.grayOneColor,
                              ),
                              onChanged: (val){
                               setState(() => password = val);
                              },
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordToggle = !passwordToggle;
                                  });
                                },
                                icon: Icon(
                                  passwordToggle
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.remove_red_eye_rounded,
                                  color: MyColors.grayColor,
                                ),
                              ),
                              validator: (String value) {
                                if (value.length < 6)
                                  setState(() {
                                    passwordError = true;
                                  });
                                else
                                  setState(() {
                                    passwordError = false;
                                  });
                              },
                            ),
                            Visibility(
                                visible: passwordError,
                                child: errorText('password must > 6 digit'))
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.sizes(16),
                        ),
                        CustomRoundedButtonEnable(
                            title: 'Registration',
                            onPressed: () async {
                              print('gender value : ${gender}');
                              print('gender value : ${dob}');
                              if(_loginFormKey.currentState.validate()){
                                loading = true;
                                dynamic result = await _auth.registerWithMainAndPass(email, password, username, gender, _selectedDate, mobileno);
                                if (result == null){
                                  loading = false;
                                  print("provide valide data");
                                } else {
                                  navigateLogin(context);
                                }
                              }
                            }),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.sizes(16),
                ),
                Divider(
                  height: 1,
                  color: Theme.of(context).dividerColor,
                ),
                SizedBox(
                  height: SizeConfig.sizes(22),
                ),
                Text(
                  "By creating an account you agree to our",
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: SizeConfig.sizes(8),
                ),
                Text(
                  "Terms and Conditions",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: MyColors.blueColor),
                ),
                SizedBox(
                  height: SizeConfig.sizes(22),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget errorText(String text) {
    return Positioned(
        right: SizeConfig.sizes(10),
        child: Container(
          padding: EdgeInsets.all(SizeConfig.sizes(4)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.sizes(6)),
              shape: BoxShape.rectangle,
              // BoxShape.circle or BoxShape.rectangle
              color: MyColors.redColor,
              boxShadow: [
                BoxShadow(
                  color: MyColors.grayOneColor,
                  blurRadius: 5.0,
                ),
              ]),
          child: Row(
            children: [
              Icon(
                Icons.report_gmailerrorred_sharp,
                color: MyColors.whiteColor,
                size: SizeConfig.sizes(14),
              ),
              Text(
                '$text',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: MyColors.whiteColor),
              )
            ],
          ),
        ));
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: Theme.of(context),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _dateFieldController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dateFieldController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

Future<void> navigateLogin(BuildContext context) async {
  Navigator.pushReplacementNamed(context, LoginUi.id);
}

