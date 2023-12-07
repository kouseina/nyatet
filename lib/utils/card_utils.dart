import 'package:flutter/material.dart';
import 'package:nyatet/app/app_colors.dart';

class CardUtils {
  static Color getBgCard(int index) {
    final colors = [
      AppColors.red,
      AppColors.yellow,
      AppColors.blue,
      AppColors.lime,
      AppColors.green,
      AppColors.purple,
    ];

    final int getIndexColor =
        index < colors.length ? index : index % colors.length;

    return colors[getIndexColor];
  }
}