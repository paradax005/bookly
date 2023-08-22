import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailHeader extends StatelessWidget {
  const BookDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const Icon(
            Icons.close,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.shopping_cart_outlined,
          ),
        )
      ],
    );
  }
}
