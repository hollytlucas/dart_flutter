import 'dart:math';


class Answer {
  var answers = [
    'Yes!',
    'No',
    'Maybe?'
  ];

  String _currentAnswer = 'Maybe?';

  final Random random = Random();

  String get currentAnswer => _currentAnswer;

  void getAnswer(){
    int index = random.nextInt(3);
    _currentAnswer = answers[index];
  }  
}