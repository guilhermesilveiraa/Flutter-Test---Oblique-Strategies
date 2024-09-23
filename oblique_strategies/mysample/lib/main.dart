import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'dart:math';

void main() => runApp(const ObliqueApp());

class ObliqueApp extends StatelessWidget {
  const ObliqueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Oblique(),
    );
  }
}

class Oblique extends StatefulWidget {
  const Oblique({super.key});

  @override
  _ObliqueState createState() => _ObliqueState();
}

class _ObliqueState extends State<Oblique> {
  final int _selectedIndex = 0;
  final List<String> _phrases = [
    'Abandon normal instruments',
    'Accept advice',
    'Accretion',
    'A line has two sides',
    'Allow an easement (an easement is the abandonment of a stricture)',
    'Are there sections? Consider transitions',
    'Ask people to work against their better judgement',
    'Ask your body',
    'Assemble some of the instruments in a group and treat the group',
    'Balance the consistency principle with the inconsistency principle',
    'Be dirty',
    'Breathe more deeply',
    'Bridges -build -burn',
    'Cascades',
    'Change instrument roles',
    'Change nothing and continue with immaculate consistency',
    'Children\'s voices -speaking -singing',
    'Cluster analysis',
    'Consider different fading systems',
    'Consult other sources -promising -unpromising',
    'Convert a melodic element into a rhythmic element',
    'Courage!',
    'Cut a vital connection',
    'Decorate, decorate',
    'Define an area as `safe\' and use it as an anchor',
    'Destroy -nothing -the most important thing',
    'Discard an axiom',
    'Disconnect from desire',
    'Discover the recipes you are using and abandon them',
    'Distorting time',
    'Do nothing for as long as possible',
    'Don\'t be afraid of things because they\'re easy to do',
    'Don\'t be frightened of cliches',
    'Don\'t be frightened to display your talents',
    'Don\'t break the silence',
    'Don\'t stress one thing more than another',
    'Do something boring',
    'Do the washing up',
    'Do the words need changing?',
    'Do we need holes?',
    'Emphasize differences',
    'Emphasize repetitions',
    'Emphasize the flaws',
    'Faced with a choice, do both (given by Dieter Rot)',
    'Feedback recordings into an acoustic situation',
    'Fill every beat with something',
    'Get your neck massaged',
    'Ghost echoes',
    'Give the game away',
    'Give way to your worst impulse',
    'Go slowly all the way round the outside',
    'Honor thy error as a hidden intention',
    'How would you have done it?',
    'Humanize something free of error',
    'Imagine the music as a moving chain or caterpillar',
    'Imagine the music as a set of disconnected events',
    'Infinitesimal gradations',
    'Intentions -credibility of -nobility of -humility of',
    'Into the impossible',
    'Is it finished?',
    'Is there something missing?',
    'Is the tuning appropriate?',
    'Just carry on',
    'Left channel, right channel, centre channel',
    'Listen in total darkness, or in a very large room, very quietly',
    'Listen to the quiet voice',
    'Look at a very small object, look at its centre',
    'Look at the order in which you do things',
    'Look closely at the most embarrassing details and amplify them',
    'Lowest common denominator check -single beat -single note -single riff',
    'Make a blank valuable by putting it in an exquisite frame',
    'Make an exhaustive list of everything you might do and do the last thing on the list',
    'Make a sudden, destructive unpredictable action; incorporate',
    'Mechanicalize something idiosyncratic',
    'Mute and continue',
    'Only one element of each kind',
    '(Organic) machinery',
    'Overtly resist change',
    'Put in earplugs',
    'Remember those quiet evenings',
    'Remove ambiguities and convert to specifics',
    'Remove specifics and convert to ambiguities',
    'Repetition is a form of change',
    'Reverse',
    'Short circuit (example: a man eating peas with the idea that they will improve his virility shovels them straight into his lap)',
    'Shut the door and listen from outside',
    'Simple subtraction',
    'Spectrum analysis',
    'Take a break',
    'Take away the elements in order of apparent non-importance',
    'Tape your mouth (given by Ritva Saarikko)',
    'The inconsistency principle',
    'The tape is now the music',
    'Think of the radio',
    'Tidy up',
    'Trust in the you of now',
    'Turn it upside down',
    'Twist the spine',
    'Use an old idea',
    'Use an unacceptable color',
    'Use fewer notes',
    'Use filters',
    'Use `unqualified\' people',
    'Water',
    'What are you really thinking about just now? Incorporate',
    'What is the reality of the situation?',
    'What mistakes did you make last time?',
    'What would your closest friend do?',
    'What wouldn\'t you do?',
    'Work at a different speed',
    'You are an engineer',
    'You can only make one dot at a time',
    'You don\'t have to be ashamed of using your own ideas',
    '[blank white card]'
  ];

  bool _isPhraseVisible = false;
  String _currentPhrase = '';

  @override
  void initState() {
    super.initState();
    _currentPhrase = _getRandomPhrase();
  }

  String _getRandomPhrase() {
    if (_phrases.isEmpty) {
      return ''; // Retorna uma string vazia se a lista estiver vazia
    }
    final random = Random();
    final index = random.nextInt(_phrases.length);
    return _phrases[index];
  }

  void _onDragStart() {
    setState(() {
      _isPhraseVisible = true;
      _currentPhrase = _getRandomPhrase();
    });
  }

  void _onDragEnd() {
    setState(() {
      _isPhraseVisible = false;
    });
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sobre'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'assets/images/eno.jpeg',
              width: 124,
              height: 124,
            ),
            const SizedBox(height: 16),
            const Text(
              'Oblique Strategies\nAugust 2024\n\u{a9} 2024 Guilherme Duarte',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    text: "Estratégias oblíquas (Oblique strategies, em inglês) é um conjunto de cartas criadas por Brian Eno e publicadas em 1975. Cada carta contém uma frase ou observação enigmática utilizada para sair de um beco sem saída ou de um dilema",
                  ),
                  TextSpan(style: Theme.of(context).textTheme.bodyMedium, text: '.'),
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          'Oblique Strategies',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontSize: 24,
            fontFamily: 'PlayfairDisplay',
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    body: Center(
      child: DraggableCard(
        onDragStart: _onDragStart,
        onDragEnd: _onDragEnd,
        child: SizedBox(
          width: 204,
          height: 327,
          child: _isPhraseVisible
              ? Center(
                  child: Text(
                    _currentPhrase,
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 18,
                      fontFamily: 'PlayfairDisplay',
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : Image.asset(
                  'assets/images/verse.jpeg',
                  fit: BoxFit.cover,
                ),
        ),
      ),
    ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color.fromARGB(255, 179, 147, 43),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Tutorial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Sobre',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      _showAboutDialog();
    } else if (index == 1) {
      print('Tutorial clicked');
    }
  }
}

class DraggableCard extends StatefulWidget {
  const DraggableCard({required this.child, this.onDragStart, this.onDragEnd, super.key});

  final Widget child;
  final VoidCallback? onDragStart;
  final VoidCallback? onDragEnd;

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Alignment _dragAlignment = Alignment.center;
  late Animation<Alignment> _animation;

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        widget.onDragStart?.call();
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          );
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
        widget.onDragEnd?.call();
      },
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}
