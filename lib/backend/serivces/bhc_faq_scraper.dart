import 'package:dio/dio.dart';
import 'package:html/parser.dart' show parse;

class BhcFaq {
  final String question;
  final String answer;

  BhcFaq({required this.question, required this.answer});

  @override
  String toString() {
    return 'Question: $question\nAnswer: $answer\n';
  }
}

class BhcFaqSraper {
  Future<List<BhcFaq>> fetchFaqs() async {
    final response = await Dio().get('https://bhc.bw/faqs');

    if (response.statusCode == 200) {
      var document = parse(response.data);
      var faqElements = document.querySelectorAll(
          '.view-content .views-field-title .field-content, .view-content .views-field-body .field-content p');

      List<BhcFaq> faqs = [];
      for (int i = 0; i < faqElements.length; i += 2) {
        try {
          var question = faqElements[i].text.trim();
          var answer = faqElements[i + 1].text.trim();
          faqs.add(BhcFaq(question: question, answer: answer));
        } catch (e) {
          // logger.w(e);
        }
      }
      return faqs;
    } else {
      throw Exception('Failed to load FAQs');
    }
  }
}
