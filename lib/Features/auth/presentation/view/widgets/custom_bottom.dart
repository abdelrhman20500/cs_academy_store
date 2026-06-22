import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, this.onPressed, required this.text,});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.07,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
              )
          ),
          onPressed: onPressed, child: Text(text,style: const TextStyle(
          fontSize: 20, color: Colors.white),)),
    );
  }
}
