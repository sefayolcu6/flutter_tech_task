import 'package:flutter/material.dart';

class CustomPaddingConstant {
  static final CustomPaddingConstant _instance = CustomPaddingConstant._init();
  static CustomPaddingConstant get instance => _instance;

  CustomPaddingConstant._init();

  final EdgeInsets appPaddingAll2 = const EdgeInsets.all(2);
  final EdgeInsets appPaddingAll4 = const EdgeInsets.all(4);
  final EdgeInsets appPaddingAll8 = const EdgeInsets.all(8);
  final EdgeInsets appPaddingAll12 = const EdgeInsets.all(12);
  final EdgeInsets appPaddingAll16 = const EdgeInsets.all(16);
  final EdgeInsets appPaddingAll20 = const EdgeInsets.all(20);
  final EdgeInsets appPaddingAll24 = const EdgeInsets.all(24);
  final EdgeInsets appPaddingAll28 = const EdgeInsets.all(28);
  final EdgeInsets appPaddingAll32 = const EdgeInsets.all(32);
  final EdgeInsets appPaddingAll36 = const EdgeInsets.all(36);
  final EdgeInsets appPaddingAll40 = const EdgeInsets.all(40);

  final EdgeInsets appPaddingSymmetricVertical4 = const EdgeInsets.symmetric(vertical: 4);
  final EdgeInsets appPaddingSymmetricVertical8 = const EdgeInsets.symmetric(vertical: 8);
  final EdgeInsets appPaddingSymmetricVertical12 = const EdgeInsets.symmetric(vertical: 12);
  final EdgeInsets appPaddingSymmetricVertical16 = const EdgeInsets.symmetric(vertical: 16);
  final EdgeInsets appPaddingSymmetricVertical20 = const EdgeInsets.symmetric(vertical: 20);

  final EdgeInsets appPaddingSymmetricHorizontal4 = const EdgeInsets.symmetric(horizontal: 4);
  final EdgeInsets appPaddingSymmetricHorizontal8 = const EdgeInsets.symmetric(horizontal: 8);
  final EdgeInsets appPaddingSymmetricHorizontal12 = const EdgeInsets.symmetric(horizontal: 12);
  final EdgeInsets appPaddingSymmetricHorizontal16 = const EdgeInsets.symmetric(horizontal: 16);
  final EdgeInsets appPaddingSymmetricHorizontal20 = const EdgeInsets.symmetric(horizontal: 20);

  final EdgeInsets appPaddingOnlyLeft4 = const EdgeInsets.only(left: 4);
  final EdgeInsets appPaddingOnlyLeft8 = const EdgeInsets.only(left: 8);
  final EdgeInsets appPaddingOnlyLeft12 = const EdgeInsets.only(left: 12);
  final EdgeInsets appPaddingOnlyLeft16 = const EdgeInsets.only(left: 16);
  final EdgeInsets appPaddingOnlyLeft20 = const EdgeInsets.only(left: 20);

  final EdgeInsets appPaddingOnlyRight4 = const EdgeInsets.only(right: 4);
  final EdgeInsets appPaddingOnlyRight8 = const EdgeInsets.only(right: 8);
  final EdgeInsets appPaddingOnlyRight12 = const EdgeInsets.only(right: 12);
  final EdgeInsets appPaddingOnlyRight16 = const EdgeInsets.only(right: 16);
  final EdgeInsets appPaddingOnlyRight20 = const EdgeInsets.only(right: 20);

  final EdgeInsets appPaddingOnlyTop4 = const EdgeInsets.only(top: 4);
  final EdgeInsets appPaddingOnlyTop8 = const EdgeInsets.only(top: 8);
  final EdgeInsets appPaddingOnlyTop12 = const EdgeInsets.only(top: 12);
  final EdgeInsets appPaddingOnlyTop16 = const EdgeInsets.only(top: 16);
  final EdgeInsets appPaddingOnlyTop20 = const EdgeInsets.only(top: 20);

  final EdgeInsets appPaddingOnlyBottom4 = const EdgeInsets.only(bottom: 4);
  final EdgeInsets appPaddingOnlyBottom8 = const EdgeInsets.only(bottom: 8);
  final EdgeInsets appPaddingOnlyBottom12 = const EdgeInsets.only(bottom: 12);
  final EdgeInsets appPaddingOnlyBottom16 = const EdgeInsets.only(bottom: 16);
  final EdgeInsets appPaddingOnlyBottom20 = const EdgeInsets.only(bottom: 20);
}
