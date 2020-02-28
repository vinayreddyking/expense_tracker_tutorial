import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'models/transaction.dart';

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


class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<Transaction> _userTransactions = [
    Transaction(id: "t1", title: "New Shoes", amount: 69.99, date: DateTime.now()),
    Transaction(id: "t2", title: "Hot Cakes", amount: 9.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount){
    final newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder:(_){
      return NewTransaction(_addNewTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed:()=> _startAddNewTransaction(context)),
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
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
            TransactionList(_userTransactions),  
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(child:Icon(Icons.add),onPressed:()=> _startAddNewTransaction(context),),
    );
  }
}