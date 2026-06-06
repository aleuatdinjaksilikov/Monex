import 'package:flutter/material.dart';

class OperationItem extends StatelessWidget {
  const OperationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 12,top: 0,bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              Icon(Icons.add_circle_rounded),
              SizedBox(width: 15,),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text('В долг',style: TextStyle(fontSize: 18,fontWeight: .bold),),
                  SizedBox(height: 3,),
                  Text('24 мая, 00:55'),
                  SizedBox(height: 3,),
                  Text('agagsagasgaasgasg \nfasagasgagasgs \nasgsagagasgasg')
                ],
              ),
              Spacer(),
              Text('+ 5555',style: TextStyle(fontSize: 20,fontWeight: .bold),),
              SizedBox(width: 10,),
              IconButton(onPressed: (){}, icon: Icon(Icons.close))
            ],
          ),
        ),
      ),
    );
  }
}