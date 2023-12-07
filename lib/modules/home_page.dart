import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nyatet/data/notes_db.dart';
import 'package:nyatet/models/note.dart';
import 'package:nyatet/routes/app_router.dart';
import 'package:nyatet/app/app_colors.dart';
import 'package:nyatet/utils/card_utils.dart';
import 'package:nyatet/utils/date_time_utils.dart';
import 'package:nyatet/widgets/small_button_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    getNotes();
  }

  void getNotes() async {
    setState(() => isLoading = true);

    notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.white,
        child: Icon(
          Icons.add,
          color: AppColors.black,
        ),
        onPressed: () {
          context.navigateTo(AddRoute());
        },
      ),
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => getNotes(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
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
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final item = notes[index];

                      return InkWell(
                        onTap: () {
                          context.router.navigate(DetailRoute(note: item));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: CardUtils.getBgCard(index),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title ?? "",
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
                                DateTimeUtils.getDateFormat(
                                    item.updateAt ?? ""),
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
      ),
    );
  }
}
