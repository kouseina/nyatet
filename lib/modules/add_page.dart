import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nyatet/data/notes_db.dart';
import 'package:nyatet/models/note.dart';
import 'package:nyatet/routes/app_router.dart';
import 'package:nyatet/app/app_colors.dart';
import 'package:nyatet/widgets/small_button_widget.dart';

@RoutePage()
class AddPage extends StatefulWidget {
  const AddPage({super.key, this.note});
  final Note? note;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;
  late final TextEditingController descController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.note?.title);
    descController = TextEditingController(text: widget.note?.desc);
  }

  @override
  void dispose() {
    super.dispose();

    titleController.dispose();
    descController.dispose();
  }

  Future addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) return;

    if (widget.note == null) {
      await addNote();
    } else {
      await editNote();
    }
  }

  Future addNote() async {
    final note = Note(
      title: titleController.text,
      desc: descController.text,
      createAt: DateTime.now().toIso8601String(),
      updateAt: DateTime.now().toIso8601String(),
    );

    await NotesDatabase.instance.create(note);

    if (!context.mounted) return;
    context.router.replace(const HomeRoute());
  }

  Future editNote() async {
    final note = widget.note?.copyWith(
      title: titleController.text,
      desc: descController.text,
      updateAt: DateTime.now().toIso8601String(),
    );

    if (note == null) return;

    await NotesDatabase.instance.update(note);

    if (!context.mounted) return;
    context.router.replace(const HomeRoute());
    context.router.navigate(DetailRoute(note: note));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        onTap: addOrUpdateNote,
                        text: "Save",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: titleController,
                    style: Theme.of(context).textTheme.headlineLarge,
                    decoration: InputDecoration(
                      hintText: "Title",
                      hintStyle:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: AppColors.grey1,
                              ),
                      border: InputBorder.none,
                    ),
                    validator: (value) => value != null && value.isEmpty
                        ? 'The title cannot be empty'
                        : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: descController,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 20),
                    minLines: 1,
                    maxLines: 20,
                    decoration: InputDecoration(
                      hintText: "Type something....",
                      hintStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 20,
                                color: AppColors.grey1,
                              ),
                      border: InputBorder.none,
                    ),
                    validator: (value) => value != null && value.isEmpty
                        ? 'The description cannot be empty'
                        : null,
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
