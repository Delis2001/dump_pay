// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ElevatedButtonWidget extends StatefulWidget {
   String text;
   TextStyle color;
   ButtonStyle style;
   ElevatedButton onPressed ;
   ElevatedButtonWidget({super.key, required this.text, required this.color,required this.style, required this.onPressed});

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  
  @override
  Widget build(BuildContext context) {
     ElevatedButton elevatedButton = ElevatedButton(
                onPressed: () {},
                child: Text(
                  widget.text,
                  style:widget.color
                ),
                style: widget.style,
              );
    return elevatedButton;
  }
}