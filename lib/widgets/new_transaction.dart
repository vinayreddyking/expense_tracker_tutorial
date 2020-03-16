import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function tx;

  NewTransaction(this.tx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void submitData(){
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);
      if(enteredTitle == "" || enteredAmount <= 0 || enteredAmount.isNaN){
        return;
      }
       widget.tx(enteredTitle,enteredAmount);
       titleController.text = "";
       amountController.text = "";
       Navigator.of(context).pop();
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
                    keyboardType: TextInputType.number,
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