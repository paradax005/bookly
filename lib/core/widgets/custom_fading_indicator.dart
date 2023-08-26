import 'package:flutter/material.dart';

class CustomFadingIndicator extends StatefulWidget {
  const CustomFadingIndicator({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<CustomFadingIndicator> createState() => _CustomFadingIndicatorState();
}

class _CustomFadingIndicatorState extends State<CustomFadingIndicator> with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animation = Tween<double>(begin: .2, end: .8).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

    animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }
}
