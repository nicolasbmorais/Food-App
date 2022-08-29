import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
         TextButton(
          onPressed: (){},
          child: const Text(
            'Vender tudo',
            style: TextStyle(color: AppColors.kActiveColor),
          ),
        ),
      ],
    );
  }
}
