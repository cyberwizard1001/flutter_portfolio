import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TerminalInterfaceWidget extends StatefulWidget {
  const TerminalInterfaceWidget({super.key});

  @override
  TerminalInterfaceWidgetState createState() => TerminalInterfaceWidgetState();
}

class TerminalInterfaceWidgetState extends State<TerminalInterfaceWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<Widget> _output = [];
  final List<String> _commands = [
    'menu',
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _printMenu();
    _controller.addListener(() {
      setState(() {}); // Trigger rebuild when text changes
    });
  }

  void _printMenu() {
    _output.clear(); // Clear existing output
    _output.add(const Text(
      'Available commands:',
      style: TextStyle(color: Colors.white, fontFamily: 'Courier'),
    ));
    _output.addAll([
      _buildCommandText('menu', 'Show this menu again (clears screen)'),
      _buildCommandText('origin', 'Origin story'),
      _buildCommandText('experience', 'My professional work experiences'),
      _buildCommandText('education', "My Bachelor's and Master's degrees"),
      _buildCommandText('youtube', 'Favourite YouTube channels'),
      _buildCommandText('interests', 'What keeps me hooked'),
      _buildCommandText('hobbies', 'You might find me doing one of these things in the wild'),
      _buildCommandText('dream', 'What do I see myself doing in a few years?'),
      _buildCommandText('funfact', 'A fun fact. Demonstrating my ability to use API calls'),
      _buildCommandText('artemis', 'Artemis?'),
      _buildCommandText('cmdline', 'Command-line? Really? Not the most user friendly user interface, mate'),
    ]);
  }

  Widget _buildCommandText(String command, String description) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontFamily: 'Courier'),
        children: [
          TextSpan(
            text: command.padRight(12),
            style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: '- $description',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  void _handleCommand(String input) {
    _output.add(const SizedBox(height: 10)); // Add vertical spacing
    _output.add(RichText(
      text: TextSpan(
        style: const TextStyle(fontFamily: 'Courier'),
        children: [
          const TextSpan(text: '> ', style: TextStyle(color: Colors.white)),
          TextSpan(
            text: input,
            style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ));

    if (input.toLowerCase() == 'menu') {
      _output.add(const Text(
        'Clearing screen and showing menu...',
        style: TextStyle(color: Colors.yellow, fontFamily: 'Courier'),
      ));
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _printMenu();
        });
      });
    } else if (_commands.contains(input.toLowerCase())) {
      _output.add(const Text(
        'Command recognized. Response will be implemented soon.',
        style: TextStyle(color: Colors.white, fontFamily: 'Courier'),
      ));
    } else {
      _output.add(const Text(
          "Hold your horses! There's no AI here (yet) :/ Please enter one of the commands above for a response :)",
      style: TextStyle(color: Colors.red, fontFamily: 'Courier'),
    ));
    }

    _controller.clear();
    setState(() {});
    _focusNode.requestFocus(); // Return focus to the text field

    // Scroll to the bottom after the state has been updated
    WidgetsBinding.instance.addPostFrameCallback((_) {
    _scrollController.animateTo(
    _scrollController.position.maxScrollExtent,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
    );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
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
                  controller: _scrollController,
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
                      const SizedBox(height: 10), // Add some space after the header
                      ..._output,
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
                          top: 2.0, // Adjust this value to align the cursor vertically
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
        height: 18, // Adjust this value to match the text height
        color: Colors.white,
      ),
    );
  }
}