import 'package:bw_home_bridge/backend/serivces/bhc_faq_scraper.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class FaqWidget extends StatefulWidget {
  const FaqWidget({
    super.key,
    required this.faqs,
  });

  final List<BhcFaq> faqs;

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  List<BhcFaq> filteredFaqs = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredFaqs = widget.faqs;
  }

  void _filterFaqs(String query) {
    setState(() {
      searchQuery = query;
      filteredFaqs = widget.faqs
          .where((faq) =>
              faq.question.toLowerCase().contains(query.toLowerCase()) ||
              faq.answer.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
            onChanged: _filterFaqs,
          ),
        ),
        if (filteredFaqs.isEmpty)
          Column(
            children: [
              McText.h3M('Sorry, No similar question found'),
            ],
          ),
        if (filteredFaqs.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: filteredFaqs.length,
            itemBuilder: (context, index) {
              final faq = filteredFaqs[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: kSpacing),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    backgroundColor: McColors.white,
                    initiallyExpanded: false,
                    title: McText.h3M(
                      faq.question,
                      textAlign: TextAlign.left,
                    ),
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kSpacing),
                        child: McText.body(faq.answer),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
