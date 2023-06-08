import 'package:flutter/material.dart';

extension AnimationControllerExt on AnimationController {

   double convertToZeroOne(){
     final double percentage  = (value - lowerBound) / (upperBound-lowerBound) * 100;
     return (percentage / 100) * 1;
   }
}
