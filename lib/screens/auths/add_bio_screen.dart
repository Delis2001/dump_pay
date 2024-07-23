// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names, prefer_final_fields, unused_field

import 'package:dump_pay/providers/auth_provider.dart';
import 'package:dump_pay/widgets/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';


class AddBioScreen extends StatefulWidget {
  const AddBioScreen({super.key});

  @override
  State<AddBioScreen> createState() => _AddBioScreenState();
}

class _AddBioScreenState extends State<AddBioScreen> {
   TextEditingController fullNameController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
     TextEditingController countryController = TextEditingController();
      TextEditingController passwordController = TextEditingController();
      //bool? obscureText;
     //  Widget _obscureText = TextField(obscureText: true,);
       String countryCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AppBarWidget(),),
      body: Center(child: Column(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Hey there! tell us a bit  ', style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),),
                RichText(
                text: TextSpan(
                    text: 'about  ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    children: [
                      TextSpan(
                          text: '''account''',  style: TextStyle(
                           color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                         fontSize: 24),)
                    ]),
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: SizedBox(
                   height: 56,
                               width: 327,
                  child: TextField(
                    controller: fullNameController ,
                    decoration: InputDecoration(
                      fillColor: Color(0xffF9FAFB),
                        hintText: 'Full Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                               ),
               ), Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: SizedBox(
                   height: 56,
                               width: 327,
                  child: TextField(
                    controller: userNameController ,
                    decoration: InputDecoration(
                      fillColor: Color(0xffF9FAFB),
                        hintText: 'User Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                               ),
               ), Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: SizedBox(
                   height: 56,
                               width: 327,
                  child: TextField(
                    controller: countryController,
                    readOnly: true,
                    decoration: InputDecoration(
                      fillColor: Color(0xffF9FAFB),
                        hintText: 'Select Country',
                        suffixIcon: IconButton(onPressed: (){
                       showCountryPicker(
                        searchAutofocus: true,
                        showSearch: true,
                        useSafeArea: true,
                        context: context, onSelect: (country){
                             setState(() {
                              countryCode =country.countryCode;
                            countryController.text = country.name;
                             });
                       });
                         
                        }, icon: Icon(Icons.keyboard_arrow_down_outlined)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                               ),
               ), Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: SizedBox(
                   height: 56,
                               width: 327,
                  child: TextField(
                    onTap: () {
                   /*   if(passwordController.text.isEmpty){
                            setState(() {
                             _obscureText = TextField(obscureText: false,);
                            });
                          }else{
                            setState(() {
                               _obscureText = TextField(obscureText: true,);
                            });
                          }*/
                    },
                    controller: passwordController ,
                    decoration: InputDecoration(
                      fillColor: Color(0xffF9FAFB),
                        hintText: 'Password',
                        suffixIcon: IconButton(onPressed: (){}, icon: Image.asset('assets/images/password_hide_eye_icon.png')),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                               ),
               ),
        ],),
         Padding(
           padding: const EdgeInsets.all(12),
           child: ElevatedButton(
                  onPressed: () {
                    if(fullNameController.text.isNotEmpty && userNameController.text.isNotEmpty && countryController.text.isNotEmpty && passwordController.text.isNotEmpty){
                     context.read<AuthProvider>().register(context, fullName: fullNameController.text.trim(), userName: userNameController.text.trim(),countryCode:countryController.text.trim(), password: passwordController.text.trim());
                  }else{
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Input all details')));
                  }
                  },
                  child: Text(
                    'Continue',
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
      ],),),
    );
  }
}