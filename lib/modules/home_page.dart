import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nyatet/data/notes_db.dart';
import 'package:nyatet/models/note.dart';
import 'package:nyatet/routes/app_router.dart';
import 'package:nyatet/app/app_colors.dart';
import 'package:nyatet/utils/card_utils.dart';
import 'package:nyatet/utils/date_time_utils.dart';
import 'package:nyatet/utils/dialog_utils.dart';
import 'package:nyatet/widgets/card_widget.dart';
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
  final GlobalKey _draggableKey = GlobalKey();
  bool isDragging = false;

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

  Future deleteNote(int id) async {
    await NotesDatabase.instance.delete(id);

    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    Widget dragCard({
      GlobalKey? dragKey,
      required Note note,
      required int index,
    }) {
      final double width = MediaQuery.of(context).size.width / 2 - 30;

      return SizedBox(
        key: dragKey,
        width: width,
        child: CardWidget(
          note: note,
          index: index,
        ),
      );
    }

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              width: 60,
            ),
            if (isDragging)
              DragTarget<Note>(
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: FloatingActionButton(
                      backgroundColor: AppColors.red,
                      child: Icon(
                        Icons.delete,
                        color: AppColors.white,
                      ),
                      onPressed: () {},
                    ),
                  );
                },
                onAccept: (data) {
                  DialogUtils.delete(
                    context: context,
                    onCancel: () {
                      context.router.pop();
                    },
                    onDelete: () {
                      if (data.id == null) return;

                      deleteNote(data.id!);
                      context.router.pop();
                    },
                  );
                },
              ),
            FloatingActionButton(
              backgroundColor: AppColors.white,
              child: Icon(
                Icons.add,
                color: AppColors.black,
              ),
              onPressed: () {
                context.navigateTo(AddRoute());
              },
            ),
          ],
        ),
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
                        onTap: () {
                          context.router.navigate(const SearchRoute());
                        },
                        iconData: Icons.search,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Builder(builder: (context) {
                    if (isLoading) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        ),
                      );
                    }

                    return MasonryGridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final note = notes[index];

                        return LongPressDraggable<Note>(
                          feedback: dragCard(
                            dragKey: _draggableKey,
                            note: note,
                            index: index,
                          ),
                          data: note,
                          dragAnchorStrategy: pointerDragAnchorStrategy,
                          childWhenDragging: Opacity(
                            opacity: 0.5,
                            child: CardWidget(note: note, index: index),
                          ),
                          onDragStarted: () {
                            setState(() => isDragging = true);
                          },
                          onDragEnd: (details) {
                            setState(() => isDragging = false);
                          },
                          child: GestureDetector(
                            onTap: () {
                              context.router.navigate(DetailRoute(note: note));
                            },
                            child: CardWidget(note: note, index: index),
                          ),
                        );
                      },
                    );
                  }),
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
