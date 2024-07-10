
import 'package:api_demo_task/utils/navigation_utils/navigation.dart';
import 'package:api_demo_task/utils/navigation_utils/routes.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  var formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var isObSecure = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              // minHeight: cons.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 280,
                    child: Image.asset('assets/images/shop_mart.jpg',fit: BoxFit.cover,),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              color: Colors.black,
                              offset: Offset(0 , -3)
                          )
                        ]

                    ),
                    child:
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 30, 30, 8),
                      child: Column(
                        children: [
                          Form(
                              key: formkey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller:emailController ,
                                    validator: (value) => value== null ? 'please enter email' : null,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email,color: Colors.black,),
                                        hintText: "Enter email",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Colors.white60
                                            )
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Colors.white60
                                            ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Colors.white60
                                            )
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Colors.white60
                                            )
                                        ),
                                        contentPadding: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                                        fillColor: Colors.white,
                                        filled: true
                                    ),
                                  ).paddingSymmetric(vertical: 7),
                                  TextFormField(
                                    controller:nameController ,
                                    validator: (value) => value== null ? 'please enter name' : null,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.person,color: Colors.black,),
                                        hintText: "Enter name",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Colors.white60
                                            )
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Colors.white60
                                            )
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Colors.white60
                                            )
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Colors.white60
                                            )
                                        ),
                                        contentPadding: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                                        fillColor: Colors.white,
                                        filled: true
                                    ),
                                  ).paddingSymmetric(vertical: 7),
                                  Obx(
                                        ()=>
                                            TextFormField(
                                      controller:passwordController ,
                                      obscureText: isObSecure.value,
                                      validator: (value) => value== null ? 'please enter password' : null,
                                      decoration: InputDecoration(
                                          suffixIcon: Obx(
                                                ()=> GestureDetector(
                                              onTap: () {
                                                isObSecure.value = !isObSecure.value;
                                              },
                                              child: Icon(
                                                isObSecure.value ? Icons.visibility_off : Icons.visibility,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          prefixIcon: Icon(Icons.vpn_key_sharp,color: Colors.black,),
                                          hintText: "Enter password",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          contentPadding: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                                          fillColor: Colors.white,
                                          filled: true
                                      ),
                                    ).paddingSymmetric(vertical: 8),
                                  ),
                                  Material(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30),
                                    child: InkWell(
                                      onTap: () {

                                      },
                                      borderRadius: BorderRadius.circular(30),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25,
                                            vertical: 13

                                        ),
                                        child: CommonText(text: "Login",color: Colors.white,fontSize: 16,),
                                      ),

                                    ),
                                  ).paddingOnly(top: 10)
                                ],
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(text: "Already have an Account?",color: Colors.black,),
                              TextButton(onPressed: () {
                                Navigation.pushNamed(Routes.loginScreen);
                              }, child: CommonText(text: "Login Here",color: Colors.black,fontWeight: FontWeight.w500,))
                            ],
                          ),

                        ],
                      ),
                    ),
                  ).paddingAll(15)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
