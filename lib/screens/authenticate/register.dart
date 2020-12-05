import 'package:flutter/material.dart';
import 'package:movie_app/services/auth.dart';
import 'package:movie_app/animation/FadeAnimation.dart';
// import 'package:movie_app/screens/authenticate/login.dart';
// import 'package:movie_app/screens/home/welcome.dart';
// import 'package:movie_app/screens/home/dashboard_screen.dart';

class RegisterPage extends StatefulWidget {
  
  final Function toggleView;
  RegisterPage({ this.toggleView });

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => HomePage()));
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     size: 20,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FadeAnimation(
                            1,
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.2,
                            Text(
                              "Create an account, It's free",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[700]),
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: FadeAnimation(
                        1.2,
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                validator: (val) =>
                                    val.isEmpty ? 'Enter an email' : null,
                                // obscureText: obscureText,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[400])),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[400])),
                                ),
                                onChanged: (val) {
                                  val = val.trim();
                                  setState(() => email = val);
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                validator: (val) =>
                                    val.isEmpty ? 'Enter a password' : null,
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[400])),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[400])),
                                ),
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: Container(
                                  padding: EdgeInsets.only(top: 3, left: 3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border(
                                        bottom: BorderSide(color: Colors.black),
                                        top: BorderSide(color: Colors.black),
                                        left: BorderSide(color: Colors.black),
                                        right: BorderSide(color: Colors.black),
                                      )),
                                  child: MaterialButton(
                                    minWidth: double.infinity,
                                    height: 60,
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        dynamic result = await _auth
                                            .registerWithEmailAndPassword(
                                                email, password);
                                        if (result == null) {
                                          setState(() => error =
                                              'Please enter valid email or password');
                                        } 
                                        // else {
                                        //   Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //           builder: (context) =>
                                        //               DashboardScreen()));
                                        // }
                                      }
                                    },
                                    color: Colors.greenAccent,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              FadeAnimation(
                                1.5,
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Already have an account?"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          child: Text(
                                            "Log In",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                          ),
                                          onTap: () => {
                                            widget.toggleView(),
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             LoginPage()))
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      error,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                              FadeAnimation(
                                1.2,
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/background.png'),
                                          fit: BoxFit.cover)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
