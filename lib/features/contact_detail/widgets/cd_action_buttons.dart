import 'package:flutter/material.dart';
import 'package:monex/core/widgets/app_button.dart';

class CDActionButtons extends StatelessWidget {
  const CDActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            onTap: () {},
            bacgroundColor: Colors.red.withValues(alpha: 0.5),
            children: [
              Icon(Icons.add),
              SizedBox(width: 5),
              Text("Записать в долг"),
            ],
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: AppButton(
            onTap: () {},
            bacgroundColor: Color(0xFFDEEAF7),
            children: [
              Icon(Icons.task_alt_rounded),
              SizedBox(width: 5),
              Text("Принять оплату"),
            ],
          ),
        ),
      ],
    );
  }
}
