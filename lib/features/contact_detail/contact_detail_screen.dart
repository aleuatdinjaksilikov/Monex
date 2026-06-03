import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monex/core/utils/currency_format_ext.dart';
import 'package:monex/core/widgets/app_button.dart';
import 'package:monex/features/contact_detail/widgets/balance_section.dart';
import 'package:monex/features/contact_detail/widgets/cd_action_buttons.dart';
import 'package:monex/features/contact_detail/widgets/date_filter_widget.dart';



class ContactDetailScreen extends StatefulWidget {
  const ContactDetailScreen({super.key});

  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

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
              child: BalanceSection()
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
              child: CDActionButtons()
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: .center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "История операций",
                      style: TextStyle(fontSize: 18, fontWeight: .bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: DateFilterWidget()
                  ),
                ],
              ),
            ),
          ),

          SliverList(delegate: SliverChildBuilderDelegate(
            (context,index){
              // return OperationItem();
            },
            childCount: 10
          ))
        

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
