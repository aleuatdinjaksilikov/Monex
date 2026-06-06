import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monex/core/utils/currency_input_formatter.dart';
import 'package:monex/core/widgets/rounded_rectangle_button.dart';
import 'package:monex/features/home/utils/debt_type.dart';
import 'package:monex/features/home/utils/debt_type_ext.dart';

class CreateTransactionScreen extends StatelessWidget {
  final DebtType type;
  const CreateTransactionScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type.actionButtonlabels),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 52,
            width: double.infinity,
            child: RoundedRectangleButton(
              onClick: () {},
              buttonText: "Сохранить",
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "s'om",
                          textAlign: .center,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22,
                            fontWeight: .bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        flex: 7,
                        child: TextField(
                          keyboardType: .number,
                          style: TextStyle(
                            fontSize: 24
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            CurrencyInputFormatter()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: .centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: .min,
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 5),
                        Text("Выберите контакт"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    maxLines: 5,
                    style: TextStyle(
                            fontSize: 18
                          ),
                    decoration: InputDecoration(
                      hint: Text('Описание(необязательно)'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
