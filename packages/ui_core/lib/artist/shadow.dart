import 'package:flutter/material.dart';
import 'package:ui_core/src.dart';


class $MyShadow {
  const $MyShadow();

  BoxShadow cardShadow(
      {double blurRadius = 40, double spreadRadius = 0, Color? color ,}) =>
      BoxShadow(
        offset: const Offset(0, 10),
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        color: color ?? MyArtist.cardShadow7,
      );

  BoxShadow blueShadow(
      {double blurRadius = 22, double spreadRadius = 0,}) =>
      BoxShadow(
        offset: const Offset(0, 10),
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        color: MyArtist.blueShadow,
      );

  BoxShadow purpleShadow(
      {double blurRadius = 22, double spreadRadius = 0,}) =>
      BoxShadow(
        offset: const Offset(0, 10),
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        color: MyArtist.purpleShadow,
      );

  BoxShadow dropShadow(
      { double blurRadius = 4,}) =>
      BoxShadow(
        offset: const Offset(0, 4),
        blurRadius: blurRadius,
        color: MyArtist.dropShadow,
      );
}
