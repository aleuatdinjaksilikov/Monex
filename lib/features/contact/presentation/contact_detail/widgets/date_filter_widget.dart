import 'package:flutter/material.dart';

final List<String> valuesOfFilter = [
  "Все время",
  "Сегодня",
  "Неделя",
  "Месяц",
  "Год",
];

class DateFilterWidget extends StatefulWidget {
  const DateFilterWidget({super.key});

  @override
  State<DateFilterWidget> createState() => _DateFilterWidgetState();
}

class _DateFilterWidgetState extends State<DateFilterWidget> {
  String dropDownValue = valuesOfFilter.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: .center,
        children: [
          Icon(Icons.calendar_month_rounded),
          SizedBox(width: 2),
          DropdownButton<String>(
            dropdownColor: Colors.white,
            padding: EdgeInsets.only(left: 5, right: 5),
            borderRadius: BorderRadius.circular(12),
            underline: SizedBox(height: 0),
            value: dropDownValue,
            onChanged: (String? value) {
              setState(() {
                dropDownValue = value!;
              });
            },
            items: valuesOfFilter.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(fontWeight: .bold)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
