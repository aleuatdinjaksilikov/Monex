import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monex/config/routing/route_paths.dart';
import 'package:monex/features/contacts/widgets/contact_tile.dart';
import 'package:monex/share/fake_data.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Контакты',
          style: TextStyle(fontSize: 26, fontWeight: .bold),
        ),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add_circle_outline_rounded),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: 'Поиск контакта...',
                prefixIcon: const Icon(Icons.search),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withValues(alpha: 0.7),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withValues(alpha: 0.3),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final contact = FakeData.contacts[index];
                    return ContactTile(
                      contact: contact,
                      transactions:
                          FakeData.transactionsByContact[contact.id] ?? [],
                      onTap: () {
                        context.push(RoutePaths.contactDetailPath);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0.3,
                      color: Color(0xffcccaca),
                      indent: 5,
                      endIndent: 5,
                    );
                  },
                  itemCount: FakeData.contacts.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
