import 'package:flutter/material.dart';

import 'HomeScreen_food.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //bool isHover=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("asset/new_app/background.png"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              // color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign In to continue",
                    style: TextStyle(fontSize: 18),
                  ),
                  const Text(
                    "Kolkata Sweets",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.redAccent,
                          offset: Offset(5, 4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> HomeScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              "asset/new_app/img.png",
                              alignment: Alignment.topLeft,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Sign Up with Google",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(

                    // onHover: (val){
                    //   setState(() {
                    //     isHover = val;
                    //   });
                    // },
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> HomeScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              "asset/new_app/img_5.png",
                              alignment: Alignment.topLeft,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Sign Up with Facebook",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text(
                        " Live It Up !",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                     const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: const [
                          Text(
                            "Crafted with ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "in Kolkata , India",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
