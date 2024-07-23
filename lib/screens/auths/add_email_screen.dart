// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_import, void_checks

import 'package:dump_pay/providers/auth_provider.dart';
import 'package:dump_pay/screens/auths/otp_pincode_screen.dart';
import 'package:dump_pay/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEmailScreen extends StatefulWidget {
  const AddEmailScreen({super.key});

  @override
  State<AddEmailScreen> createState() => _AddEmailScreenState();
}

TextStyle textStyle = TextStyle(color: Colors.black);

class _AddEmailScreenState extends State<AddEmailScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AppBarWidget(),),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: RichText(
                text: TextSpan(
                    text: 'Create a ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    children: [
                      TextSpan(
                          text: 'Dumbpay',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                          children: [
                            TextSpan(
                                text: '''
                                 account''',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold))
                          ])
                    ]),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(7.0),
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
              padding: const EdgeInsets.only(bottom: 20,top: 10),
              child: ElevatedButton(
                onPressed: () {
                  if(emailController.text.trim().isNotEmpty){
                    return  context.read<AuthProvider>().getEmailToken(context, emailController.text.trim());
                    }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email field is empty',style: TextStyle(fontWeight: FontWeight.bold),))); 
                    }
                  },
                 
                child: Text(
                  'Sign Up',
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
            ),
        
            Text('OR',textAlign: TextAlign.center,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
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
                ],
              ),
            ),
            Spacer(),
            RichText(
                text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.black),children: [
                      TextSpan(text: 'Sign Up',style: TextStyle(color: Colors.blueAccent))
                    ]),),
              Spacer()
          ],
        ),
      ),
    );
  }
}
