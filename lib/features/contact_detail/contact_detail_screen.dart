import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monex/core/utils/currency_format_ext.dart';
import 'package:monex/core/widgets/app_button.dart';

final List<String> valuesOfFilter = [
  "Все время",
  "Сегодня",
  "Неделя",
  "Месяц",
  "Год",
];

class ContactDetailScreen extends StatefulWidget {
  const ContactDetailScreen({super.key});

  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  String dropDownvalue = valuesOfFilter.first;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _screenAppBar(context),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: .center,
                    children: [
                      Text("ТЕКУЩИЙ ДОЛГ", style: TextStyle(fontSize: 14)),
                      SizedBox(height: 10),
                      Text(
                        153000.toCurrency(symbol: "UZS"),
                        style: TextStyle(fontSize: 24, fontWeight: .bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: .center,
                        children: [
                          Expanded(
                            child: AppButton(
                              onTap: () {},
                              bacgroundColor: Colors.green.withValues(
                                alpha: 0.4,
                              ),
                              height: 48,
                              children: [
                                Icon(Icons.call),
                                SizedBox(width: 5),
                                Text("Позвонить"),
                              ],
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: AppButton(
                              withBorder: true,
                              height: 48,
                              onTap: () {},
                              bacgroundColor: Colors.white12,
                              children: [
                                Icon(Icons.notifications),
                                SizedBox(width: 5),
                                Text("Напомнить"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
              child: Row(
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
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "История операций",
                      style: TextStyle(fontSize: 18, fontWeight: .bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: DropdownButton<String>(
                      value: valuesOfFilter.first,
                      onChanged: (String? value) {
                        setState(() {
                          dropDownvalue = value!;
                        });
                      },
                      items: valuesOfFilter.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: TextStyle(fontWeight: .bold),),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // SliverPersistentHeader(
          //   pinned: true,
          //   delegate: _TabBarSliverDelegate(
          //     child: Padding(
          //       padding: const EdgeInsets.all(12),
          //       child: CustomTabBar(
          //         controller: _tabController,
          //         tabs: const ["Активные", "Закрытые"],
          //       ),
          //     ),
          //   ),
          // ),

          // SliverFillRemaining(
          //   child: TabBarView(
          //     controller: _tabController,
          //     children: [ActiveDebtsScreen(), ClosedDebtsScreen()],
          //   ),
          // ),
        ],
      ),
    );
  }

  SliverAppBar _screenAppBar(BuildContext context) {
    return SliverAppBar(
      centerTitle: false,
      pinned: true,
      stretch: true,
      title: Text('Анна Смирнова'),
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}

class _TabBarSliverDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _TabBarSliverDelegate({required this.child});

  @override
  double get minExtent => 70;

  @override
  double get maxExtent => 70;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: child);
  }

  @override
  bool shouldRebuild(covariant _TabBarSliverDelegate oldDelegate) {
    return false;
  }
}
