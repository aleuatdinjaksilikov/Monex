import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:monex/config/routing/route_paths.dart';
import 'package:monex/core/constants/app_decorations.dart';
import 'package:monex/features/home/utils/debt_type.dart';
import 'package:monex/features/home/utils/debt_type_ext.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration(context),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
            children: [
              Expanded(child: _ActionButton(type: DebtType.owedToMe,)),
              SizedBox(width: 12,),
              Expanded(child: _ActionButton(type: DebtType.iOwe,)),
            ]
        ),
      ),
    );
  }
}


class _ActionButton extends StatefulWidget {
  final DebtType type;
  const _ActionButton({required this.type});

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: (){
          context.push(RoutePaths.createTracnsactionPath,extra: widget.type);
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.type.color.withValues(alpha: 0.3),
            borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: .center,
              children: [
                SvgPicture.asset(widget.type.iconPath,colorFilter: ColorFilter.mode(widget.type.color, .srcIn),),
                SizedBox(width: 12,),
                Text(widget.type.actionButtonlabels,style: TextStyle(color: widget.type.color,fontSize: 18),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


