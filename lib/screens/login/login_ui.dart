import 'package:shopping_app/screens/dashboard/dashboard.dart';
import 'package:shopping_app/screens/register/register_ui.dart';
import 'package:shopping_app/utills/colors.dart';
import 'package:shopping_app/utills/imports.dart';
import 'package:shopping_app/utills/size_config.dart';
import 'package:shopping_app/widget/custome_round_button_enable.dart';
import 'package:shopping_app/widget/custome_round_text_form_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:shopping_app/services/auth.dart';
import 'package:shopping_app/widget/loading.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginUi extends StatefulWidget {
  static const id = '/LoginUi';


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginUi> {
  @override
  void initState() {
    super.initState();
    _introScreenCounter();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  static final FacebookLogin facebookSignIn = new FacebookLogin();
  String _message = 'Log in/out by pressing the buttons below.';

  final facebookLogin = FacebookLogin();
  final _firebaseAuth = FirebaseAuth.instance;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool passwordToggle = false;
  bool passwordError = false;
  bool emailError = false;

  String email = '';
  String password = '';

  bool loading = false;

  final _loginFormKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();
  final _passFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.sizes(14),
                ),
                CircleAvatar(
                  radius: SizeConfig.sizes(60),
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/140x100'),
                ),
                Form(
                  key: _loginFormKey,
                  child: Container(
                    width: SizeConfig.width,
                    padding: EdgeInsets.all(SizeConfig.sizes(26)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("User Name",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: SizeConfig.sizes(2),
                        ),
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            CustomRoundedTextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailFieldController,
                              hintText: 'User Name',
                              prefixIcon: Icon(
                                Icons.person,
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
                        Text("Your Password",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: SizeConfig.sizes(2),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomRoundedTextFormField(
                              controller: _passFieldController,
                              hintText: 'Password',
                              obscureText: passwordToggle,
                              onChanged: (val){
                                setState(() => password = val);
                              },
                              prefixIcon: Icon(
                                Icons.lock,
                                color: MyColors.grayOneColor,
                              ),
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
                                  color: MyColors.grayOneColor,
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
                          title: 'Login',
                          onPressed: () async {
                            if(_loginFormKey.currentState.validate())  {
                              loading = true;
                            dynamic result = await _auth.signInWithEmailAndPassword(email: email, password: password);
                              if (result == null){
                                print("provide valide data");
                                loading = false;
                              } else {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Dashboard();
                                    },
                                  ),
                                );
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: SizeConfig.sizes(16),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Forgot password ?",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Divider(
                        height: 1,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: SizeConfig.sizes(8)),
                      child: Text(
                        "OR",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        height: 1,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.sizes(8),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    SizeConfig.sizes(12),
                  ),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            signInWithFaceBook().then((result) {
                              if (result != null) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Dashboard();
                                    },
                                  ),
                                );
                              }
                            });
                          },
                          child: CircleAvatar(
                            radius: SizeConfig.sizes(20),
                            backgroundColor: MyColors.whiteColor,
                            backgroundImage: AssetImage(
                              'assets/facebook.png',
                            ),
                          ),
                        ),
                        SizedBox(width: SizeConfig.sizes(24)),
                        GestureDetector(
                          onTap: () {
                            GoogleSingIn().then((result) {
                              if (result != null) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Dashboard();
                                    },
                                  ),
                                );
                              }
                            });
                          },
                          child: CircleAvatar(
                            radius: SizeConfig.sizes(20),
                            backgroundColor: MyColors.whiteColor,
                            backgroundImage: AssetImage(
                              'assets/google.png',
                            ),
                          ),
                        ),
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
                GestureDetector(
                  onTap: () {
                    navigateRegister(context);
                  },
                  child: RichText(
                    text: new TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      children: <TextSpan>[
                        new TextSpan(
                          text: 'Are you new user? ',
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: MyColors.blackTransparentColor,
                          ),
                        ),
                        new TextSpan(
                            text: 'Sign Up',
                            style: new TextStyle(
                              fontSize: 16.0,
                              color: MyColors.blueColor,
                            )),
                      ],
                    ),
                  ),
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

  _introScreenCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('counter', true);
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

  Future<String> GoogleSingIn() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');

      return '$user';
    }
    return null;
  }

  Future<User> signInWithFaceBook() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User user;
    facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;

    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final AuthCredential credential =
            FacebookAuthProvider.credential(token);
        UserCredential authResult =
            await _firebaseAuth.signInWithCredential(credential);
        user = authResult.user;

        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);

        final User currentUser = _firebaseAuth.currentUser;
        assert(user.uid == currentUser.uid);
        print("user name : ${user.displayName}");
        print("user name1 : ${user.email}");
        print("user name2 : ${user.phoneNumber}");
        print("user name3 : ${user.uid}");
        print("user name4 : ${user.photoURL}");
//        //todo Add User Data into Firestore Collection
//        addUser(UserReference(user.uid, user.email));
//        // Update user data
//        prefs.setString(UID, user.uid);
//        prefs.setString(EMAIL, user.email);
//        print('########## SignIn With FB Succeeded: $user ##########');
        break;

      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        //todo ShowError Dialog
        print("FB SignIn Error : " + result.errorMessage.toString());
        _showMessage(result.errorMessage.toString());
        break;
    }
    return user;
  }

  void _showMessage(String message) {
    setState(() {
      print("message${message}");
      _message = message;
    });
  }
}

Future<void> navigateRegister(BuildContext context) async {
//  Navigator.pushReplacementNamed(context, RegisterUi.id);
  Navigator.pushNamed(context, RegisterUi.id);
}
