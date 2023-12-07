import 'package:flutter/material.dart';
import 'package:nyatet/app/app_colors.dart';
import 'package:nyatet/models/note.dart';
import 'package:nyatet/utils/card_utils.dart';
import 'package:nyatet/utils/date_time_utils.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.note, required this.index});

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CardUtils.getBgCard(index),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.title ?? "",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  color: AppColors.black,
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            DateTimeUtils.getDateFormat(note.updateAt ?? ""),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.black.withOpacity(0.6),
                ),
          ),
        ],
      ),
    );
  }
}
