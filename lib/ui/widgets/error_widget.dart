
import 'package:flutter/material.dart';

class ErrorNewsWidget extends StatelessWidget {
  const ErrorNewsWidget({super.key, required this.errorMessage});
final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(child: Text(errorMessage,style:const TextStyle(fontSize: 20),),));
  }
}
