import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/colors.dart';
import 'package:bookly/core/utils/constant.dart';
import 'package:bookly/core/widgets/app_style.dart';
import 'package:bookly/core/widgets/height_spacer.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    goToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero).animate(animationController);

    animationController.forward();
    slidingAnimation.addListener(() {
      setState(() {});
    });
  }

  goToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(
        () => const HomeView(),
        transition: Transition.fadeIn,
        duration: kTransitionDuration,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(ImageAssets.logo),
        const HeightSpacer(size: 5),
        _buildSlidingText(),
      ],
    );
  }

  Widget _buildSlidingText() {
    return AnimatedBuilder(
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Text(
            "Read Free Books",
            textAlign: TextAlign.center,
            style: appStyle(color: kLight, size: 12, fw: FontWeight.w600),
          ),
        );
      },
      animation: slidingAnimation,
    );
  }
}
