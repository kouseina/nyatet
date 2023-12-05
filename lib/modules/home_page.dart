import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nyatet/routes/app_router.dart';
import 'package:nyatet/utils/app_colors.dart';
import 'package:nyatet/widgets/small_button_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Color getBgCard(int index) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nyatet",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SmallButtonWidget(
                      onTap: () {},
                      iconData: Icons.search,
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                MasonryGridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.router.navigate(const DetailRoute());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: getBgCard(index),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "How to make your personal brand stand out online and i think we need somthing just like how to make friend",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: 18,
                                    color: AppColors.black,
                                  ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "21 May 2023",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: AppColors.black.withOpacity(0.6),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
