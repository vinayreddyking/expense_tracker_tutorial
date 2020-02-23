import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function tx;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  NewTransaction(this.tx);
  @override
  Widget build(BuildContext context) {

    void submitData(){
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);
      if(enteredTitle == "" || enteredAmount <= 0 || enteredAmount.isNaN){
        return;
      }
       tx(enteredTitle,enteredAmount);
    }
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
                    onSubmitted:(_) => submitData(),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Amount"
                    ),
                     controller: amountController,
                     onSubmitted:(_) => submitData(),
                  ),
                  FlatButton(onPressed:submitData,
                  child: Text("Add Transaction"),textColor: Colors.purple,)
                ],
              ),
            ),
          );
  }
}