import 'package:flutter/material.dart';
import 'package:nyatet/app/app_colors.dart';

class DialogUtils {
  static void delete({
    required BuildContext context,
    required void Function()? onCancel,
    required void Function()? onDelete,
  }) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        backgroundColor: AppColors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Are you sure to delete this note?',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: onCancel,
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  TextButton(
                    onPressed: onDelete,
                    child: Text(
                      'Delete',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.red,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
