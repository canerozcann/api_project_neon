import 'package:flutter/material.dart';
import 'package:uiwidgets/presentation/widgets/custom_app_bar.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({super.key});

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> with TickerProviderStateMixin {
  bool started = false;
  bool isResetting = false;
  List<String> userMoves = [];
  String resultMessage = '';
  String? activeDirection;

  final List<String> correctPath = [
    'up',
    'right',
    'right',
    'down',
    'left',
    'up',
    'left',
  ];

  late final AnimationController _slideController;
  late final AnimationController _zoomSlideController;
  late final AnimationController _pageController;
  late final AnimationController _coverController;

  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _zoomAnimation;
  late final Animation<Offset> _zoomSlideOffset;
  late final Animation<Offset> _pageAnimation;
  late final Animation<Offset> _coverAnimation;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(
            CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _zoomSlideController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _zoomAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: _zoomSlideController, curve: Curves.easeOut));
    _zoomSlideOffset =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _zoomSlideController, curve: Curves.easeOut));

    _pageController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _pageAnimation =
        Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(
            CurvedAnimation(parent: _pageController, curve: Curves.easeOut));

    _coverController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _coverAnimation =
        Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero).animate(
            CurvedAnimation(parent: _coverController, curve: Curves.easeOut));
  }

  void onDirectionPressed(String direction) {
    setState(() {
      activeDirection = direction;
      userMoves.add(direction);

      if (userMoves.length > correctPath.length ||
          userMoves[userMoves.length - 1] !=
              correctPath[userMoves.length - 1]) {
        resultMessage = "You're trapped, try again!";
        activeDirection = null;
        isResetting = true;

        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            userMoves.clear();
            resultMessage = '';
            isResetting = false;
          });
        });
        return;
      }

      if (userMoves.length == correctPath.length) {
        resultMessage = "Congratulations, you did it!";
        activeDirection = null;
      }

      switch (direction) {
        case 'up':
          _slideController.forward(from: 0);
          break;
        case 'right':
          _zoomSlideController.forward(from: 0);
          break;
        case 'left':
          _pageController.forward(from: 0);
          break;
        case 'down':
          _coverController.forward(from: 0);
          break;
      }
    });
  }

  Widget buildDirectionButton({
    required String direction,
    required IconData icon,
    required String label,
  }) {
    bool isActive = activeDirection == direction;

    Widget animatedContent = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 36),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );

    if (isActive) {
      switch (direction) {
        case 'up':
          animatedContent = SlideTransition(
              position: _slideAnimation, child: animatedContent);
          break;
        case 'right':
          animatedContent = SlideTransition(
              position: _zoomSlideOffset,
              child: ScaleTransition(
                  scale: _zoomAnimation, child: animatedContent));
          break;
        case 'left':
          animatedContent =
              SlideTransition(position: _pageAnimation, child: animatedContent);
          break;
        case 'down':
          animatedContent = SlideTransition(
              position: _coverAnimation, child: animatedContent);
          break;
      }
    }

    return GestureDetector(
      onTap: () {
        if (resultMessage.isEmpty) {
          onDirectionPressed(direction);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue.shade100 : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
          border:
              Border.all(color: isActive ? Colors.blue : Colors.grey, width: 2),
        ),
        child: animatedContent,
      ),
    );
  }

  @override
  void dispose() {
    _slideController.dispose();
    _zoomSlideController.dispose();
    _pageController.dispose();
    _coverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: started
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Use the directional keys to find the exit!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      buildDirectionButton(
                          direction: 'up',
                          icon: Icons.arrow_upward,
                          label: "Up"),
                      buildDirectionButton(
                          direction: 'right',
                          icon: Icons.arrow_forward,
                          label: "Right"),
                      buildDirectionButton(
                          direction: 'down',
                          icon: Icons.arrow_downward,
                          label: "Down"),
                      buildDirectionButton(
                          direction: 'left',
                          icon: Icons.arrow_back,
                          label: "Left"),
                    ],
                  ),
                  const SizedBox(height: 30),
                  if (resultMessage.isNotEmpty)
                    Column(
                      children: [
                        Text(
                          resultMessage,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: resultMessage.contains("Congratulations")
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        if (isResetting)
                          const Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: CircularProgressIndicator(),
                          ),
                      ],
                    ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Ready? Start the maze!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          started = true;
                          resultMessage = '';
                          userMoves.clear();
                        });
                      },
                      child: const Text("Start"),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
