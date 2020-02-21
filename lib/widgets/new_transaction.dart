import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function tx;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  NewTransaction(this.tx);
  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Title",
                    ),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Amount"
                    ),
                     controller: amountController,
                  ),
                  FlatButton(onPressed:(){
                    tx(titleController.text,double.parse(amountController.text));
                  }, 
                  child: Text("Add Transaction"),textColor: Colors.purple,)
                ],
              ),
            ),
          );
  }
}