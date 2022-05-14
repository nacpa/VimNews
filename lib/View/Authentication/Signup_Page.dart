import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Helper/CustomSnackBar.dart';
import '../../Helper/Dimension.dart';
import '../../Helper/TextField.dart';
import 'Sign_in_Page.dart';



class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List img = ["t.png", "g.png", "f.png","tf.png"];
    final _auth=FirebaseAuth.instance;
    
    
    var PhoneController = TextEditingController();
    var PassWordcontroller = TextEditingController();
    var Emailcontroller = TextEditingController();
    var Namecontroller = TextEditingController();

    void _Registration() {
      String Email = Emailcontroller.text.trim();
      String Password = PassWordcontroller.text.trim();
      String Name = Namecontroller.text.trim();
      String MobileNo = PhoneController.text.trim();

      if (Email.isEmpty) {
        CustomSnackBar("Email can't be Empty", "please Fill valid mail",
            Colors.red, Colors.white);
      } else if (Password.isEmpty) {
        CustomSnackBar("Password can't be Empty", "please Fill valid Password",
            Colors.red, Colors.white);
      } else if (Name.isEmpty) {
        CustomSnackBar("Name can't be Empty", "please Fill your name",
            Colors.red, Colors.white);
      } else if (MobileNo.isEmpty) {
        CustomSnackBar("PhoneNo can't be Empty", "please Fill valid PhoneNo",
            Colors.red, Colors.white);
      } else if (!GetUtils.isEmail(Email)) {
        CustomSnackBar(
            "Wrong Email ", "please Fill valid mail", Colors.red, Colors.white);
      } else {
        _auth.createUserWithEmailAndPassword(email: Email, password: Password).then((value) => Get.to(SignInPage()));


        CustomSnackBar(
            "Welcome", "Signup Sucessfully", Colors.green, Colors.white);

      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: Dimension.hight10! * 20,
                width: Dimension.hight10 !* 20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/image/logo part 1.jpg"))),
              ),
              FillContainer(
                  textController: Emailcontroller,
                  TEXTColor: Colors.grey,
                  IconColor: Colors.blueGrey,
                  Info: "Email",
                  IconId: Icons.email),
              FillContainer(
                  textController: PassWordcontroller,
                  TEXTColor: Colors.grey,
                  IconColor: Colors.deepOrange,
                  Info: "PassWord",
                  IconId: Icons.password),
              FillContainer(
                  textController: Namecontroller,
                  TEXTColor: Colors.grey,
                  IconColor: Colors.green,
                  Info: "Name",
                  IconId: Icons.person),
              FillContainer(
                  textController: PhoneController,
                  TEXTColor: Colors.grey,
                  IconColor: Colors.deepPurple,
                  Info: "Mobile No",
                  IconId: Icons.phone),
              SizedBox(
                height: Dimension.hight10! * 3,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _Registration(),
                    child: Container(
                      height: Dimension.ScreenWidth! / 6,
                      width: Dimension.ScreenWidth !/ 3,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(Dimension.ScreenWidth !/ 6),
                      ),
                      child: Center(
                          child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimension.hight10! * 2.3,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: Dimension.hight10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Already have an Acoount? ",
                      style: TextStyle(fontSize: 20, color: Colors.grey)),
                    GestureDetector(onTap: (){Get.to(SignInPage());},
                      child: Text("Login ",
                        style: TextStyle(fontSize: 20, color: Colors.green)),
                    ),
                  ],),
                  SizedBox(
                    height: Dimension.hight10 !* 2,
                  ),
                  Text(
                    "Signup using one of them ",
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                  ),
                  Wrap(
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CircleAvatar(
                                radius: 25,
                                // backgroundImage:
                                    // AssetImage("assets/image/"+img[3]),
                              ),
                            )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
