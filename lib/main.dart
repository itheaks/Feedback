import 'package:flutter/material.dart';

void main() {
  runApp(FeedbackApp());
}

class FeedbackApp extends StatefulWidget {
  @override
  _FeedbackAppState createState() => _FeedbackAppState();
}

class _FeedbackAppState extends State<FeedbackApp> {
  final nameController = TextEditingController();
  final feedbackController = TextEditingController();
  String result = '';
  double percentage = 0.0;

  Color submitButtonColor = Colors.purpleAccent;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Feedback App'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.purpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: [
                Expanded( // Wrap SingleChildScrollView with Expanded
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 20.0),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Enter your name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          controller: feedbackController,
                          maxLines: null,
                          decoration: InputDecoration(
                            labelText: 'Enter your feedback',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () => calculateFeedback(),
                            child: Text(
                                'Submit',
                              style: TextStyle(
                                color: Colors.purple,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              primary: submitButtonColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Feedback Result:',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: _getFeedbackResultGradient(),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                result,
                                style: TextStyle(
                                  fontSize: 28.0,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Positivity Percentage: ${percentage.toStringAsFixed(2)}%',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    '#Designed by AKS',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Gradient _getFeedbackResultGradient() {
    if (percentage > 60) {
      return LinearGradient(
        colors: [Colors.green, Colors.white],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
    } else if (percentage < 40 && percentage != 0) {
      return LinearGradient(
        colors: [Colors.red, Colors.white],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
    } else {
      return RadialGradient(
        colors: [Colors.white, Colors.yellow],
        //begin: Alignment.centerLeft,
        //end: Alignment.centerRight,
      );
    }
  }

  void calculateFeedback() {
    final name = nameController.text;
    final feedback = feedbackController.text.toLowerCase();

    final positiveWords = [
      'excellent', 'outstanding', 'amazing', 'wonderful', 'fantastic',
      'impressive', 'superb', 'terrific', 'great', 'okay', 'brilliant',
      'remarkable', 'exceptional', 'good', 'nice', 'awesome',
      'admirable', 'incredible', 'skilled', 'knowledgeable', 'professional',
      'effective', 'efficient', 'high-quality', 'exceptionally well', 'top-notch',
      'pleasing', 'delightful', 'pleasurable', 'satisfying', 'fulfilling',
      'commendable', 'praiseworthy', 'stellar', 'phenomenal', 'mind-blowing',
      'extraordinary', 'awe-inspiring', 'stunning', 'splendid', 'exquisite',
      'marvelous', 'majestic', 'impeccable', 'flawless', 'perfect',
      'accomplished', 'talented', 'competent', 'skilful', 'gifted',
      'inspirational', 'motivational', 'encouraging', 'supportive', 'uplifting',
      'engaging', 'captivating', 'enchanting', 'fascinating', 'charming',
      'invigorating', 'refreshing', 'energizing', 'dynamic', 'vibrant',
      'positive', 'optimistic', 'upbeat', 'cheerful', 'joyful',
      'happy', 'satisfied', 'content', 'delighted', 'grateful',
      'pleased', 'thrilled', 'ecstatic', 'elated', 'overjoyed',
      'enthusiastic', 'passionate', 'eager', 'keen', 'excited',
      'radiant', 'breathtaking', 'heartwarming', 'lovely', 'beautiful',
      'excellent customer service', 'prompt response', 'timely delivery', 'well-organized', 'efficient process',
      'great attention to detail', 'exemplary performance', 'exceeding expectations', 'impeccable service', 'outstanding professionalism',
      'seamless experience', 'brilliant execution', 'exceptional teamwork', 'impressive problem-solving', 'commendable collaboration',
      'exceptionally friendly', 'knowledgeable staff', 'remarkable support', 'courteous manner', 'attentive listening',
      'clear communication', 'prompt and helpful', 'highly responsive', 'well-prepared', 'thorough understanding',
      'excellent presentation', 'well-crafted', 'thoughtful design', 'impressive visuals', 'creative approach',
      'superior quality', 'durable', 'long-lasting', 'reliable performance', 'improved efficiency',
      'innovative solution', 'cutting-edge technology', 'groundbreaking', 'revolutionary', 'leading-edge',
      'significant contribution', 'valuable insights', 'invaluable resource', 'noteworthy achievement', 'remarkable progress',
      'exemplary leadership', 'extraordinary dedication', 'stellar track record', 'outstanding commitment', 'impressive initiative',
      'highly recommended', 'top choice', 'first-rate', 'world-class', 'unparalleled',
      'simply the best', 'truly exceptional', 'a class act', 'setting the standard', 'a game-changer',
      'without a doubt', 'beyond compare', 'undoubtedly remarkable', 'worthy of admiration', 'truly remarkable',
      'exceptionally well done', 'a job well done', 'kudos to you', 'well-deserved praise', 'congratulations on a great job',
      'keep up the good work', 'you are doing amazing', 'outstanding performance', 'remarkable effort', 'great dedication',
      'highly skilled', 'impressive expertise', 'exceptional talent', 'truly gifted', 'unmatched capability',
      'stellar service', 'unbeatable quality', 'impressive results', 'remarkable achievement', 'exceptional craftsmanship',
      'excellent problem-solving', 'notable improvements', 'impressive attention to detail', 'incredible effort', 'exceeding all expectations',
      'exceptional customer experience', 'pleasure to work with', 'highly satisfied', 'exceptional value', 'excellent choice',
      'notably efficient', 'exceptional reliability', 'wonderfully creative', 'highly innovative', 'excellent understanding',
      'top-level performance', 'outstanding outcomes', 'impressive knowledge', 'consistently exceptional', 'exceptionally talented',
      'exemplary dedication', 'superior execution', 'highly effective', 'brilliant ideas', 'exceptionally well-organized',
      'stellar professionalism', 'impressive collaboration', 'remarkable attention to detail', 'exceptional customer support', 'truly reliable',
      'outstanding product', 'correct', 'unparalleled service', 'impressive teamwork', 'excellent cooperation', 'exemplary customer service',
      'fantastic experience', 'top-tier quality', 'exceptional reliability', 'remarkable responsiveness', 'unmatched expertise',
      'truly remarkable performance', 'highly recommendable', 'extraordinary commitment', 'impressive adaptability', 'exceptionally responsive',
      'top-notch service', 'outstanding results', 'exceptional guidance', 'excellent judgment', 'noteworthy dedication',
      'wonderful creativity', 'excellent craftsmanship', 'remarkable communication', 'exceptional talent', 'highly effective solution',
      'exemplary performance', 'excellent execution', 'impressive problem-solving skills', 'exceptionally thorough', 'outstanding customer care',
      'fantastic job', 'unbeatable customer service', 'superior craftsmanship', 'exceptional dedication', 'remarkable satisfaction'
    ];

    final negativeWords = [
      'poor', 'bad', 'terrible', 'disappointing', 'frustrating', 'not good',
      'annoying', 'unprofessional', 'slow', 'difficult', 'confusing',
      'inadequate', 'unhelpful', 'rude', 'disrespectful', 'negligent',
      'careless', 'lazy', 'unreliable', 'unresponsive', 'unreasonable',
      'inferior', 'subpar', 'unsatisfactory', 'lackluster', 'mediocre',
      'below average', 'substandard', 'faulty', 'defective', 'flawed',
      'misleading', 'deceptive', 'shoddy', 'horrible', 'awful',
      'grim', 'appalling', 'repulsive', 'disgusting', 'repugnant',
      'nasty', 'vile', 'abysmal', 'dreadful', 'atrocious',
      'abominable', 'disastrous', 'chaotic', 'troublesome', 'problematic',
      'inexcusable', 'pathetic', 'woeful', 'miserable', 'pitiful',
      'unacceptable', 'unpleasant', 'unfavorable', 'unfortunate', 'regrettable',
      'worse', 'worst', 'wretched', 'sloppy', 'unimpressive',
      'incompetent', 'unqualified', 'unskilled', 'irresponsible', 'inattentive',
      'inefficient', 'inconsistent', 'untrustworthy', 'unworthy', 'unethical',
      'undependable', 'unreliable', 'unreasonable', 'unresponsive', 'disorganized',
      'clumsy', 'awkward', 'underwhelming', 'insufficient', 'incomplete',
      'insincere', 'displeasing', 'uninspiring', 'insulting', 'offensive',
      'irritating', 'unpleasant', 'repellant', 'unappealing', 'disturbing',
      'unsatisfying', 'undesirable', 'horrendous', 'obnoxious', 'worrying',
      'negative', 'unhappy', 'unsatisfied', 'frustrated', 'disappointed',
      'miserable', 'upset', 'angry', 'irritated', 'enraged',
      'annoyed', 'distressed', 'disturbed', 'aggravated', 'offended',
      'stressed', 'displeased', 'disgruntled', 'fed up', 'appalled',
      'outraged', 'exasperated', 'bitter', 'resentful', 'disgusted',
      'sickened', 'despicable', 'shameful', 'horrifying', 'dismal',
      'troublesome', 'heartbreaking', 'disheartening', 'gloomy', 'morose',
      'depressing', 'regretful', 'futile', 'tedious', 'dreary',
      'humiliating', 'shameful', 'underhanded', 'corrupt', 'negligent',
      'insensitive', 'uncooperative', 'unprofessional', 'unresponsive', 'lazy',
      'inconsiderate', 'disrespectful', 'careless', 'untrustworthy', 'incompetent',
      'unreliable', 'unsympathetic', 'discourteous', 'arrogant', 'impolite',
      'hostile', 'aggressive', 'unfair', 'unjust', 'biased',
      'discriminatory', 'harmful', 'toxic', 'damaging', 'hurtful',
      'painful', 'exhausting', 'draining', 'demoralizing', 'devastating',
      'traumatic', 'disastrous', 'calamitous', 'catastrophic', 'cruel',
      'unsettling', 'tiresome', 'tedious', 'boring', 'dull',
      'undermining', 'invasive', 'inconvenient', 'intrusive', 'intruding',
      'upsetting', 'disruptive', 'inappropriate', 'objectionable', 'undesirable',
      'unsuitable', 'unacceptable', 'unfortunate', 'unwanted', 'unpleasant',
      'sour', 'gloomy', 'grievous', 'repugnant', 'loathsome',
      'sinister', 'grave', 'serious', 'desolate', 'tragic',
      'uninviting', 'undesirable', 'mournful', 'pessimistic', 'vicious',
      'regressive', 'brutal', 'injurious', 'destructive', 'scary',
      'dangerous', 'threatening', 'risky', 'menacing', 'hazardous',
      'detrimental', 'toxic', 'corrosive', 'vexing', 'wearying',
      'wearisome', 'troublesome', 'bothersome', 'exasperating', 'disconcerting',
      'embarrassing', 'humiliating', 'incongruous', 'inopportune', 'obnoxious',
      'revoltin',
    ];

    final negativePhrases = [
      'not', 'never', 'no', "don't", 'ain\'t', 'isn\'t', 'aren\'t',
      'wasn\'t', 'weren\'t', 'hasn\'t', 'haven\'t', 'hadn\'t', 'doesn\'t',
      'don\'t', 'didn\'t',
    ];

    // final feedbackWords = feedback.split(' ');
    // final positiveCount =
    //     feedbackWords.where((word) => positiveWords.contains(word)).length;
    // final negativeCount =
    //     feedbackWords.where((word) => negativeWords.contains(word)).length;
    // final totalCount = positiveCount + negativeCount;
    final feedbackWords = feedback.split(' ');
    final modifiedFeedbackWords = <String>[];

    // for (int i = 0; i < feedbackWords.length; i++) {
    //   final word = feedbackWords[i];
    //
    //   if (negativePhrases.contains(word)) {
    //     modifiedFeedbackWords.add(word);
    //     for (int j = i + 1; j < feedbackWords.length; j++) {
    //       final nextWord = feedbackWords[j];
    //       if (positiveWords.contains(nextWord)) {
    //         modifiedFeedbackWords.add('not ' + nextWord);
    //         break;
    //       } else if (negativeWords.contains(nextWord)) {
    //         modifiedFeedbackWords.add(nextWord);
    //         break;
    //       }
    //       modifiedFeedbackWords.add(nextWord);
    //     }
    //   } else {
    //     modifiedFeedbackWords.add(word);
    //   }
    // }
    // final positiveCount =
    //     feedbackWords.where((word) => positiveWords.contains(word)).length;
    final positiveCount =
        feedbackWords.where((word) => positiveWords.contains(word)).length;
    final negativeCount =
        feedbackWords.where((word) => negativeWords.contains(word)).length;
    final negativePhraseCount =
        feedbackWords.where((word) => negativePhrases.contains(word)).length;
    final totalCount = positiveCount + negativeCount + negativePhraseCount;

    if (totalCount > 0) {
      final score = positiveCount + negativeCount * -1 + negativePhraseCount * -2;
      final positivity = score / totalCount;
      percentage = ((positivity + 1) * 50).roundToDouble();
      if (percentage > 60) {
        setState(() {
          result = 'Positive';
          submitButtonColor = Colors.green;
        });
      } else if (percentage < 40 && percentage != 0) {
        setState(() {
          result = 'Negative';
          submitButtonColor = Colors.red;
        });
      } else {
        setState(() {
          result = 'Critical To Say';
          submitButtonColor = Colors.yellow;
        });
      }
    } else {
      setState(() {
        result = 'Critical To Say';
        percentage = 0.0;
      });
    }
  }
}
