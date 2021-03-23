import 'package:crop_diseases/dashboard/dashboard.dart';
import 'package:crop_diseases/model/user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Signin APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff9C58D2),
      ),
      home: GoogleSignApp(),
    );
  }
}

class GoogleSignApp extends StatefulWidget {
  @override
  _GoogleSignAppState createState() => _GoogleSignAppState();
}

class _GoogleSignAppState extends State<GoogleSignApp> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: new Text('Sigining.....'),
      ),
    );

    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser userDetails =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    ProviderDetails providerInfo = ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData = List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = UserDetails(
      userDetails.providerId,
      userDetails.displayName,
      userDetails.photoUrl,
      userDetails.email,
      providerData,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DashBoard(detailsUser: details),
      ),
    );
    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0,
        shadowColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome',
              style: TextStyle(color: Colors.black),
            ),
            Image.asset(
              'assets/images/loginimage.png',
              height: 35,
              width: 45,
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (context) => Stack(
          fit: StackFit.expand,
          children: [           
            SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/loginimage.png',
                      height: 250,
                    ),
                    Text(
                      'CROP',
                      style: TextStyle(
                        letterSpacing: 5,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 250.0,
                      child: Align(
                        alignment: Alignment.center,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: Color(0xffffffff),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.google,
                                color: Color(0xffCE107C),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                'Sign in with Google',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.0),
                              ),
                            ],
                          ),
                          onPressed: () => _signIn(context)
                              .then((FirebaseUser user) => print(user))
                              .catchError((e) => print(e)),
                        ),
                      ),
                    ),
                    Row(children: [
                      Expanded(
                          child: Divider(
                        thickness: 1.5,
                        color: Colors.red,
                      )),
                      Text("OR"),
                      Expanded(
                          child: Divider(
                        thickness: 1.5,
                        color: Colors.red,
                      )),
                    ]),
                    Container(
                      width: 250.0,
                      child: Align(
                        alignment: Alignment.center,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Color(0xffffffff),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.solidEnvelope,
                                color: Color(0xff4caf50),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                'Sign in with Email',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.0),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
