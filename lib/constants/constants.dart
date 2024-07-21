import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

const String audiosAssetsRoot = "assets/audios/";
const maxGrayColor=Color(0xff737070);
const blueColor=Color(0xff261F50);
const cyanBlueColor=Color(0xff14304A);
const miniGrayColor=Color(0xffDEDBDB);
const whitColor=Color(0xffFFFFFF);
const roseColor=Color(0xffE11D48);
Color miniBlackColor=Colors.black.withOpacity(0.5); // 50% black
Color mainBlue=Colors.blue;
Color maximumBlackColor=Colors.black.withOpacity(0.7); // 70% black
Color blackColor=Colors.black;


String heymp31 = _getAssetsaudiosPath('1.mp3');
String heymp32 = _getAssetsaudiosPath('3.mp3');
String bravo1 = _getAssetsaudiosPath('bravo1.mp3');
String bravo2 = _getAssetsaudiosPath('bravo2.mp3');

//  خطأ
// String errormp31 = _getAssetsaudiosPath('1 X.mp3');
String errormp32 = _getAssetsaudiosPath('2X.mp3');

String _getAssetsaudiosPath(String fileName) {
  return audiosAssetsRoot + fileName;


}
var logger = Logger();