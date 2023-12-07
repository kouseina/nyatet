import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nyatet/models/note.dart';
import 'package:nyatet/routes/app_router.dart';
import 'package:nyatet/app/app_colors.dart';
import 'package:nyatet/utils/date_time_utils.dart';
import 'package:nyatet/widgets/small_button_widget.dart';

@RoutePage()
class DetailPage extends StatefulWidget {
  const DetailPage({super.key, this.note});
  final Note? note;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallButtonWidget(
                      onTap: () {
                        context.router.pop();
                      },
                      iconData: Icons.arrow_back_ios,
                      iconSize: 22,
                    ),
                    SmallButtonWidget(
                      onTap: () {
                        context.router.navigate(const AddRoute());
                      },
                      iconData: Icons.edit,
                      iconSize: 22,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  widget.note?.title ?? "",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  DateTimeUtils.getDateFormat(widget.note?.updateAt ?? ""),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 20, color: AppColors.grey1),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.note?.desc ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
