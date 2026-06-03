import 'package:flutter/material.dart';
import 'package:monex/core/widgets/rounded_rectangle_button.dart';

class ActiveDebtsItem extends StatelessWidget {
  const ActiveDebtsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.fromLTRB(12, 4, 12, 4),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          mainAxisSize: .max,
          children: [
            Row(
              crossAxisAlignment: .center,
              mainAxisAlignment: .spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(
                      0,
                      129,
                      233,
                      198,
                    ).withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.attach_money),
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(fontSize: 18, fontWeight: .bold),
                    ),
                    SizedBox(height: 3),
                    Row(
                      crossAxisAlignment: .center,
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(width: 3),
                        Text('10 апр 2026'),
                      ],
                    ),
                  ],
                ),

                Spacer(),

                Column(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      '+ 100 000',
                      style: TextStyle(fontSize: 18, fontWeight: .bold),
                    ),
                    SizedBox(height: 3),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                          0,
                          129,
                          233,
                          198,
                        ).withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text('Активно'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: RoundedRectangleButton(onClick: (){}, buttonText: "Закрыть долг")
            ),
          ],
        ),
      ),
    );
  }
}
