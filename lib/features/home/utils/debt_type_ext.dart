
import 'package:flutter/material.dart';
import 'package:monex/features/home/utils/debt_type.dart';

extension DebtTypeExt on DebtType{
  Color get color {
    switch(this){
      case DebtType.iOwe:
        return Colors.green;
      case DebtType.owedToMe:
        return Colors.red;
    }
  }

  String get label{
    switch(this) {
      case DebtType.iOwe:
        return 'Мне должны';
      case DebtType.owedToMe:
        return 'Я должен';
    }
  }

  String get actionButtonlabels{
    switch(this) {
      case DebtType.iOwe:
        return 'Дал в долг';
      case DebtType.owedToMe:
        return 'Взял в долг';
    }
  }

  String get iconPath {
    switch (this) {
      case DebtType.iOwe:
        return 'assets/arrow_up_right.svg';
      case DebtType.owedToMe:
        return 'assets/arrow_down_left.svg';
    }
  }
}