import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nyatet/utils/app_colors.dart';
import 'package:nyatet/widgets/small_button_widget.dart';

@RoutePage()
class EditPage extends StatelessWidget {
  const EditPage({super.key});

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
                      width: 74,
                      onTap: () {},
                      text: "Save",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.headlineLarge,
                  decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle:
                        Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: AppColors.grey1,
                            ),
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 20),
                  minLines: 1,
                  maxLines: 20,
                  decoration: InputDecoration(
                    hintText: "Type something....",
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 20,
                          color: AppColors.grey1,
                        ),
                    border: InputBorder.none,
                  ),
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
