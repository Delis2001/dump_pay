// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:dump_pay/providers/auth_provider.dart';
import 'package:dump_pay/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigniNScreen extends StatefulWidget {
  const SigniNScreen({super.key});

  @override
  State<SigniNScreen> createState() => _SigniNScreenState();
}

class _SigniNScreenState extends State<SigniNScreen> {
   TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AppBarWidget(),),
      body: Center(child: Column(children: [
  Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text('Hi There! ',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          ),
          Image.asset(
            height: 25,
            'assets/images/wave.png')
  ],),
  Padding(
    padding: const EdgeInsets.only(right:70),
    child: Text('Welcome back, Sign in to your account',textAlign: TextAlign.center,),
  ),
      Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
                   height: 56,
                width: 327,
                  child: TextField(
                    controller: emailController ,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
      ), 
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: SizedBox(
                   height: 56,
                               width: 327,
                  child: TextField(
                    controller: passwordController ,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                               ),
               ), 
              
              Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 15,right: 150),
                child: Text('Forget password?',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
              ),
                ElevatedButton(
                onPressed: () {
                  if(emailController.text.trim().isNotEmpty && passwordController.text.trim().isNotEmpty){
                        context.read<AuthProvider>().signIn(context,emailController.text.trim(),passwordController.text.trim());
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fill all details')));
                  }
                
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xff111827),
                    ),
                    shape: MaterialStatePropertyAll(OutlinedBorder.lerp(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        BorderSide.strokeAlignOutside)),
                    fixedSize: MaterialStatePropertyAll(
                        Size(MediaQuery.of(context).size.width * 0.7, 50))),
              ),
              
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('OR'),
              ),
       
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(
                            MediaQuery.of(context).size.width * 0.3,
                            50,
                          )),
                          alignment: Alignment.center,
                          shape: MaterialStatePropertyAll(OutlinedBorder.lerp(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              BorderSide.strokeAlignOutside))),
                      onPressed: () {},
                      child: Image.asset(
                          height: 23.18,
                          width: 23.1,
                          'assets/images/google_icon.png')),
                  ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(
                            MediaQuery.of(context).size.width * 0.3,
                            50,
                          )),
                          alignment: Alignment.center,
                          shape: MaterialStatePropertyAll(OutlinedBorder.lerp(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              BorderSide.strokeAlignOutside))),
                      onPressed: () {},
                      child: Icon(Icons.apple,color: Colors.black,)),
              ],),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: RichText(text: TextSpan(text: 'Don’t have an account? ',style: TextStyle(color:Colors.black ,fontWeight: FontWeight.bold),children: [TextSpan(text: 'Sign Up',style: TextStyle(color: Colors.blueAccent ,fontWeight: FontWeight.bold),)])),
              )
           
      ],),),
    );
  }
}