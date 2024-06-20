import 'package:bm_mobile/core/style/style_extensions.dart';
import 'package:bm_mobile/features/bm/domain/entity/comments_and_grades.dart';
import 'package:bm_mobile/features/login/presentation/widget/grade_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';

class GradesScreen extends HookConsumerWidget {
  final CommentsAndGrades commentsAndGrades;
  const GradesScreen(this.commentsAndGrades, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grades',
          style: context.titleText,
        ),
        backgroundColor: context.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            MultiSliver(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
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
                  child: Column(
                    children: commentsAndGrades.grades
                        .map(
                          (grade) => Padding(
                            padding: const EdgeInsets.only(top: 7.5),
                            child: GradeItem(
                              grade: grade,
                              onTap: () {},
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
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
                  child: Column(
                    children: commentsAndGrades.comment.expand((comments) {
                      return comments.map((comment) {
                        return ListTile(
                          subtitle: Text(
                            comment,
                            style: TextStyle(
                              color: context.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList();
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
