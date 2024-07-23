// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, void_checks

import 'package:dump_pay/providers/auth_provider.dart';
import 'package:dump_pay/widgets/appbar_widget.dart';
import 'package:dump_pay/widgets/elevated_button_widegt.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpPinCodeSreen extends StatefulWidget {
  const OtpPinCodeSreen({super.key});

  @override
  State<OtpPinCodeSreen> createState() => _OtpPinCodeSreenState();
}

class _OtpPinCodeSreenState extends State<OtpPinCodeSreen> {
  TextEditingController  OtpPinCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarWidget(),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Verify it\'s you',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                '''We send a code to ( ${context.read<AuthProvider>().email}). Enter it here to verify your identity''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 12),
              ),
            ),
            Pinput(
              length: 5,
              controller: OtpPinCodeController,
              keyboardType: TextInputType.number,
              defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                      color: Color(0xffF9FAFB),
                      borderRadius: BorderRadius.circular(12))),
            ),
           // Text('Resend Code 30 secs'),
            Spacer(),
          ElevatedButton(
                onPressed: () {
                    if( OtpPinCodeController.text.trim().isNotEmpty){
                    return  context.read<AuthProvider>().verifyEmailToken(context, OtpPinCodeController.text.trim());
                    }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('otp field is empty',style: TextStyle(fontWeight: FontWeight.bold),))); 
                    }
                },
                child: Text(
                  'Confirm',
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
              Spacer()
          ],
        ),
      ),
    );
  }
}
