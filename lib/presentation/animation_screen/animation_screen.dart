import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  bool _isVisible = true;
  double _rotationTurns = 0.0;
  bool _isTextUp = false;
  bool _isBig = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _rotateLeft() {
    setState(() {
      _rotationTurns -= 0.25;
    });
  }

  void _rotateRight() {
    setState(() {
      _rotationTurns += 0.25;
    });
  }

  void _toggleTextPosition() {
    setState(() {
      _isTextUp = !_isTextUp;
    });
  }

  void _toggleSize() {
    setState(() {
      _isBig = !_isBig;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              opacity: _isVisible ? 1.0 : 0.0,
              child: AnimatedRotation(
                turns: _rotationTurns,
                duration: const Duration(milliseconds: 500),
                child: AnimatedContainer(
                  width: _isBig ? 220 : 150,
                  height: _isBig ? 220 : 150,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: const Text(
                    'View',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _toggleVisibility,
                    child: Text(_isVisible ? 'Hide' : 'Show'),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: _rotateLeft,
                        icon: const Icon(Icons.rotate_left),
                        label: const Text('Rotate Left'),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: _rotateRight,
                        icon: const Icon(Icons.rotate_right),
                        label: const Text('Rotate Right'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _toggleSize,
                    child: Text(_isBig ? 'Shrink Size' : 'Enlarge Size'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSlide(
                    duration: const Duration(milliseconds: 500),
                    offset: _isTextUp
                        ? const Offset(0, -0.3)
                        : const Offset(0, 0.2),
                    child: const Text(
                      'Click the button for magic!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _toggleTextPosition,
                    child: Text(_isTextUp ? 'Move Text Down' : 'Move Text Up'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
