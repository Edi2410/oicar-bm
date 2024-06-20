import 'package:bm_mobile/core/di.dart';
import 'package:bm_mobile/features/bm/domain/entity/user_data.dart';
import 'package:bm_mobile/features/login/presentation/screen/feedback_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'grades_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userStateProvider);
    final commentsAndGrades = ref.read(feedbackStateProvider);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color(0xFF861949),
        selectedIndex: currentPageIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.add_comment,
              color: Colors.white,
            ),
            icon: Icon(Icons.add_comment_outlined),
            label: 'Feedback',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.grade,
              color: Colors.white,
            ),
            icon: Icon(Icons.grade_outlined),
            label: 'Grades and Comments',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: <Widget>[
          userState.when(
            loading: () => const Center(child: CircularProgressIndicator.adaptive()),
            empty: () => const Center(child: Text("Empty")),
            success: (userData) => FeedbackScreen(userData),
            error: () => const Center(child: Text("Error")),
          ),
          commentsAndGrades.when(
            loading: () => const Center(child: CircularProgressIndicator.adaptive()),
            empty: () => const Center(child: Text("Empty")),
            success: (data) => GradesScreen(data),
            error: () => const Center(child: Text("Error")),
          ),
        ],
      ),
    );
  }
}
