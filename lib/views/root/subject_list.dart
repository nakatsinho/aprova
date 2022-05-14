import 'package:aprova/views/assignment/answer.dart';
import 'package:aprova/widgets/buttons/defaultbutton.dart';
import 'package:flutter/material.dart';

class SubjectList extends StatefulWidget {
  const SubjectList({Key? key}) : super(key: key);
  static String routeNamed = "/SubjectList";

  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      // adding to the score tracker on top
      _scoreTracker.add(
        answerScore
            ? Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : Icon(
                Icons.clear,
                color: Colors.red,
              ),
      );
      //when the quiz ends
      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    // what happens at the end of the quiz
    if (_questionIndex >= _questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/background.jpg", fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.white,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.person,
                                        color: Theme.of(context).primaryColor,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                          Text(
                            "Cadeira ou Disciplina",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 34.0,
                              letterSpacing: 2.5,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 40.0)),
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 170.0,
                                margin: EdgeInsets.only(
                                    bottom: 10.0, left: 5.0, right: 5.0),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50.0, vertical: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Center(
                                  child: Text(
                                    _questions[_questionIndex]['question']
                                        as String,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              ...(_questions[_questionIndex]['answers']
                                      as List<Map<String, dynamic>>)
                                  .map(
                                (answer) => Answer(
                                  answerText: answer['answerText'] as String,
                                  answerColor: answerWasSelected
                                      ? true
                                          ? Colors.green
                                          : Colors.red
                                      : null,
                                  answerTap: () {
                                    // if answer was already selected then nothing happens onTap
                                    if (answerWasSelected) {
                                      return;
                                    }
                                    //answer is being selected
                                    _questionAnswered(answer['score']);
                                  },
                                ),
                              ),
                              SizedBox(height: 20.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 40.0),
                                ),
                                onPressed: () {
                                  if (!answerWasSelected) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        'Selecione uma resposta antes de ir para a próxima pergunta',
                                        textAlign: TextAlign.center,
                                      ),
                                      backgroundColor: Colors.redAccent,
                                    ));
                                    return;
                                  }
                                  _nextQuestion();
                                },
                                child: Text(endOfQuiz
                                    ? 'Restart Quiz'
                                    : 'Next Question'),
                              ),
                              Container(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  '${_totalScore.toString()}/${_questions.length}',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              if (answerWasSelected && !endOfQuiz)
                                Container(
                                  height: 100,
                                  width: double.infinity,
                                  color: correctAnswerSelected
                                      ? Colors.green
                                      : Colors.red,
                                  child: Center(
                                    child: Text(
                                      correctAnswerSelected
                                          ? 'Well done, you got it right!'
                                          : 'Wrong :/',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              if (endOfQuiz)
                                Container(
                                  height: 100,
                                  width: double.infinity,
                                  color: Colors.black,
                                  child: Center(
                                    child: Text(
                                      _totalScore > 4
                                          ? 'Congratulations! Your final score is: $_totalScore'
                                          : 'Your final score is: $_totalScore. Better luck next time!',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: _totalScore > 4
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final _questions = const [
  {
    'question': 'How long is New Zealand’s Ninety Mile Beach?',
    'answers': [
      {'answerText': '190km, so 56 miles long.', 'score': false},
      {'answerText': '88km, so 55 miles long.', 'score': true},
      {'answerText': '55km, so 34 miles long.', 'score': false},
      {'answerText': '90km, so 56 miles long.', 'score': false},
    ],
  },
  {
    'question':
        'In which month does the German festival of Oktoberfest mostly take place?',
    'answers': [
      {'answerText': 'January', 'score': false},
      {'answerText': 'October', 'score': false},
      {'answerText': 'September', 'score': true},
      {'answerText': 'March', 'score': false},
    ],
  },
  {
    'question': 'Who composed the music for Sonic the Hedgehog 3?',
    'answers': [
      {'answerText': 'Britney Spears', 'score': false},
      {'answerText': 'Timbaland', 'score': false},
      {'answerText': 'Michael Jackson', 'score': true},
      {'answerText': 'Maphorisa', 'score': false},
    ],
  },
];
