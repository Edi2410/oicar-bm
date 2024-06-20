import 'package:bm_mobile/core/di.dart';
import 'package:bm_mobile/core/style/style_extensions.dart';
import 'package:bm_mobile/features/bm/domain/entity/feedback.dart';
import 'package:bm_mobile/features/bm/domain/entity/question.dart';
import 'package:bm_mobile/features/bm/domain/entity/question_form.dart';
import 'package:bm_mobile/features/bm/domain/entity/user_data.dart';
import 'package:bm_mobile/features/bm/presentation/widget/custom_primary_button.dart';
import 'package:bm_mobile/features/bm/presentation/widget/input_form/custom_autosuggest_field.dart';
import 'package:bm_mobile/features/bm/presentation/widget/input_form/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FeedbackForm extends HookConsumerWidget {
  final List<UserData> usersData;
  final UserData userData;
  const FeedbackForm(this.userData, this.usersData, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackQuestion = ref.watch(feedbackQuestionProvider);
    final formKey = GlobalKey<FormState>();
    final commentController = useTextEditingController();
    final selectedUser = useState<UserData?>(null);
    final questionScore = useState<List<Question>>([]);

    return CustomScrollView(
      slivers: [
        MultiSliver(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: context.cardBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: context.shadowColor,
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomAutosuggestField(
                      labelText: "Select user",
                      optionsList: usersData,
                      selectedUser: selectedUser,
                      validator: (value) => _validateIsEmpty(context, value),
                    ),
                    const SizedBox(height: 20),
                    feedbackQuestion.when(
                      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
                      error: (error, stackTrace) => Center(child: Text(error.toString())),
                      data: (questions) {
                        questionScore.value = questions;
                        return Column(
                          children: questions
                              .map(
                                (question) => Column(
                                  children: [
                                    Text(question.question,
                                        style: TextStyle(color: context.primaryColor, fontSize: 16)),
                                    SegmentedButton(
                                      style: SegmentedButton.styleFrom(
                                        side: BorderSide(color: context.primaryColor),
                                      ),
                                      segments: const [
                                        ButtonSegment<int>(value: 1, label: Text('1')),
                                        ButtonSegment<int>(value: 2, label: Text('2')),
                                        ButtonSegment<int>(value: 3, label: Text('3')),
                                        ButtonSegment<int>(value: 4, label: Text('4')),
                                        ButtonSegment<int>(value: 5, label: Text('5')),
                                      ],
                                      selected: <int>{
                                        questionScore.value[questionScore.value.indexOf(question)].score ?? 3
                                      },
                                      onSelectionChanged: (value) {
                                        var newList = questionScore.value.map((Question e) {
                                          if (e.id == question.id) {
                                            e.score = value.first;
                                            return e;
                                          } else {
                                            return e;
                                          }
                                        }).toList();
                                        questionScore.value = [...newList];
                                      },
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: commentController,
                      labelText: "Comment",
                    ),
                    const SizedBox(height: 20),
                    CustomPrimaryButton(
                      labelText: "Submit feedback",
                      onPressed: () => _submitFeedback(
                        context,
                        ref,
                        formKey,
                        commentController,
                        selectedUser,
                        questionScore.value,
                        userData,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _submitFeedback(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    TextEditingController commentController,
    ValueNotifier<UserData?> selectedUser,
    List<Question> questionScore,
    UserData user,
  ) async {
    if (formKey.currentState!.validate()) {
      List<QuestionForm> scores = questionScore.map((e) => QuestionForm(question: e.id, grade: e.score!)).toList();
      FeedbackSaveData sendValue = FeedbackSaveData(
        feedbackTo: selectedUser.value!.user.id!,
        feedbackFrom: user.user.id!,
        comment: commentController.text,
        questions: scores,
        isFromCompany: user.isCompany,
      );
      ref.read(saveFeedbackProvider.notifier).saveFeedback(
            context,
            sendValue,
          );
      formKey.currentState!.reset();
      commentController.clear();
      selectedUser.value = null;
      questionScore = [];
    }
  }

  String? _validateIsEmpty(BuildContext context, final String? value) {
    if (value == null || value.isEmpty) {
      return "Field is empty";
    }
    return null;
  }
}
