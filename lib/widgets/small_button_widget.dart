import 'package:flutter/material.dart';
import 'package:nyatet/app/app_colors.dart';

class SmallButtonWidget extends StatelessWidget {
  const SmallButtonWidget({
    super.key,
    this.iconData,
    this.width = 50,
    this.iconSize = 30,
    this.onTap,
    this.text,
  });

  final IconData? iconData;
  final double width;
  final double iconSize;
  final void Function()? onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.grey2,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconData != null)
                Icon(
                  iconData,
                  color: AppColors.white,
                  size: iconSize,
                ),
              if (text != null)
                Text(
                  text ?? "",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
