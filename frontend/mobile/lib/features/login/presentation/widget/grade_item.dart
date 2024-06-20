import 'package:bm_mobile/core/style/style_extensions.dart';
import 'package:bm_mobile/features/bm/domain/entity/grades.dart';
import 'package:flutter/material.dart';

class GradeItem extends StatelessWidget {
  final Grades grade;
  final VoidCallback onTap;

  const GradeItem({super.key, required this.grade, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: context.primaryColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 3),
                  blurRadius: 5,
                  color: Theme.of(context).shadowColor,
                ),
              ],
            ),
            child: Center(
              child: Text(grade.grade.toString(),
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  grade.question,
                  style: TextStyle(
                    color: context.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
