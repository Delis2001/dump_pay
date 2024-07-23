import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios,),
          style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              side: MaterialStatePropertyAll(BorderSide.lerp(
                  const BorderSide(color: Colors.black12),
                  const BorderSide(color: Colors.black12),
                  BorderSide.strokeAlignOutside)),
              shape: MaterialStatePropertyAll(OutlinedBorder.lerp(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  BorderSide.strokeAlignOutside)),
              alignment: Alignment.center,
              padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),),
        ),
      );
  }
}