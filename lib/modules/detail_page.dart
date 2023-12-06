import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nyatet/routes/app_router.dart';
import 'package:nyatet/utils/app_colors.dart';
import 'package:nyatet/widgets/small_button_widget.dart';

@RoutePage()
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

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
                  "Beautiful weather app UI concept we wish existed",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "21 May, 2023",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 20, color: AppColors.grey1),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "ho would have thought there could be so many creative ways to tell the temperature? Today's daily dose of design inspiration is all about the weather. In this collection of UI designs, we're sharing a handful of beautiful mobile weather app concepts that we wish existed in real life.\n\n Weather apps are quite the popular interface theme for designers to explore. But don't let these effortlessly clean designs fool you. When it comes to the weather, there's a lot of data designers have to arrange which can be quite a challenge. Regardless, it's a great way to practice your UI skills. We",
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
