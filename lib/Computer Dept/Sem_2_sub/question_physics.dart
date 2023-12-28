class Question{
  final int id;
  final String num;
  final String questions;
  final List<String>options;
  final String answer;

  Question(this.questions, this.options, this.answer, this.id, this.num,);
}

 List<Question> question_data = [
   Question('Maximum displacement from equilibrium position is _____', ['Frequency','Amplitude','Wavelength','Period']
       , 'B',0,'1'),
   Question('Over-damping results in____', ['slower return to equilibrium','faster return to equilibrium',
     'equilibrium is never achieved','arrhythmic return to equilibrium']
     , 'A',1,'2'),
   Question('If time period of an oscillation is 0.40 s, then it\'s frequency is____', ['2 Hz','2.5 Hz',
     '3 Hz','3.5 Hz']
     , 'B',2,'3'),
   Question('As amplitude of resonant vibrations decreases, degree of damping', ['Increases','Remains Same',
     'Decreases','Varies']
     , 'C',3,'4'),
   Question('Oscillations become damped due to____', ['Normal Forces','Friction',
     'Tangential Forces','Parallel Forces']
     , 'B',4,'5'),
   Question('Number of oscillations per unit time is____', ['Amplitude','Wavelength',
     'Frequency','Period']
     , 'C',5,'6'),
];