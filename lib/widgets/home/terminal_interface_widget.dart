import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/colors.dart';
import 'package:flutter_portfolio/utils/terminal_command_formatting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TerminalInterfaceWidget extends StatefulWidget {
  const TerminalInterfaceWidget({super.key});

  @override
  TerminalInterfaceWidgetState createState() => TerminalInterfaceWidgetState();
}

class TerminalInterfaceWidgetState extends State<TerminalInterfaceWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _output = [];
  final List<String> _commands = [
    'origin',
    'experience',
    'education',
    'youtube',
    'interests',
    'hobbies',
    'dream',
    'funfact',
    'artemis',
    'cmdline',
  ];
  final FocusNode _focusNode = FocusNode();

  void _handleCommand(String input) {
    if (_commands.contains(input)) {
      _output.add('> $input');
      _output.add(input);
    } else {
      _output.add('> $input');
      _output.add('Hold your horses! There’s no AI here (yet) :/ Please enter one of the 9 commands above for a response :)');
    }
    _controller.clear();
    setState(() {});
    _focusNode.requestFocus(); // Return focus to the text field
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SiteColors.terminalBackgroundDark,
        borderRadius: BorderRadius.circular(30),
      ),
      height: 50.h,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: SiteColors.terminalPillBackgroundDark,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                              child: Text(
                                'artemis@notaterminal:~\$',
                                style: GoogleFonts.lato(
                                  color: SiteColors.focusDark,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'To get to know me better, run one of the following commands:',
                              style: GoogleFonts.lato(color: SiteColors.primaryDark),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0, top: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Replace these with Command widgets
                            Command(serial: 1, command: 'origin', description: 'Origin story'),
                            Command(serial: 2, command: 'experience', description: 'My professional work experiences'),
                            Command(serial: 3, command: 'education', description: 'My Bachelor’s and Master’s degrees'),
                            Command(serial: 4, command: 'youtube', description: 'Favourite YouTube channels'),
                            Command(serial: 5, command: 'interests', description: 'What keeps me hooked'),
                            Command(serial: 6, command: 'hobbies', description: 'You might find me doing one of these things in the wild'),
                            Command(serial: 7, command: 'dream', description: 'What do I see myself doing in a few years?'),
                            Command(serial: 8, command: 'funfact', description: 'A fun fact. Demonstrating my ability to use API calls'),
                            Command(serial: 9, command: 'artemis', description: 'Artemis?'),
                            Command(serial: 10, command: 'cmdline', description: 'Command-line? Really? Not the most user friendly user interface, mate'),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _output
                            .map((line) => Text(
                          line,
                          style: TextStyle(
                            color: line.startsWith('Hold your horses!')
                                ? Colors.red
                                : Colors.white,
                            fontFamily: 'Courier',
                          ),
                        ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  const Text(
                    '>',
                    style: TextStyle(color: Colors.white, fontFamily: 'Courier'),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          style: const TextStyle(color: Colors.white, fontFamily: 'Courier'),
                          cursorColor: Colors.transparent, // Hide the default cursor
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          onSubmitted: _handleCommand,
                        ),
                        Positioned(
                          left: 8.0 + _calculateCursorOffset(),
                          child: const BlinkingCursor(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: SiteColors.terminalBackgroundDark,
      ),
    );
  }

  double _calculateCursorOffset() {
    final text = _controller.text;
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(color: Colors.white, fontFamily: 'Courier'),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.width;
  }
}

class BlinkingCursor extends StatefulWidget {
  const BlinkingCursor({super.key});

  @override
  BlinkingCursorState createState() => BlinkingCursorState();
}

class BlinkingCursorState extends State<BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _opacity = Tween<double>(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity.value,
      child: Container(
        width: 2,
        height: 20,
        color: Colors.white,
      ),
    );
  }
}
