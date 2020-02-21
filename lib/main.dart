import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}


class MyHome extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("Expense Chart"),
              elevation: 5,
            ),
          ),
          UserTransactions(),  
        ],
      ),
    );
  }
}