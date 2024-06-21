import 'package:bw_home_bridge/ui/screens/report_desk/widgets/issue_card.dart';
import 'package:flutter/material.dart';

class IssueListBuilder extends StatelessWidget {
  final List<int> issues;
  const IssueListBuilder({
    super.key,
    required this.issues,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: issues.length,
      itemBuilder: (context, index) {
        var issue = issues[index];

        return IssueCard();
      },
    );
  }
}
