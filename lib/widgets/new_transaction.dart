import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function tx;

  NewTransaction(this.tx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime _pickedDate;

  @override
  Widget build(BuildContext context) {

    void submitData(){
      final enteredTitle = _titleController.text;
      final enteredAmount =_amountController.text.isEmpty ? -1.0 : double.parse(_amountController.text);
      if(enteredTitle == "" || enteredAmount <= 0 || enteredAmount.isNaN || _pickedDate == null){
        return;
      }
       widget.tx(enteredTitle,enteredAmount,_pickedDate);
       _titleController.text = "";
       _amountController.text = "";
       Navigator.of(context).pop();
    }
    void _presentDatePicker(){
      showDatePicker(
        context: context,
        initialDate: DateTime.now(), 
        firstDate: DateTime(2019), 
        lastDate: DateTime.now()).then((selectedDate){
          if(selectedDate == null){
            return;
          }
          setState(() {
            _pickedDate = selectedDate;
          }); 
        });
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
                    controller: _titleController,
                    onSubmitted:(_) => submitData(),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Amount"
                    ),
                     controller: _amountController,
                     onSubmitted:(_) => submitData(),
                  ),
                  Container(
                    height: 70,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text(_pickedDate==null?"No Date Choosen": 'Chosen Date : ${DateFormat.yMMMEd().format(_pickedDate)}')),
                        FlatButton(
                         textColor: Theme.of(context).primaryColor,
                         child: Text("Choose Date",style: TextStyle(
                           fontWeight: FontWeight.bold,
                         ),),
                         onPressed: _presentDatePicker,
                      ),

                      ],
                    ),
                  ),
                  RaisedButton(onPressed:submitData,
                  child: Text("Add Transaction"),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  ),
                ],
              ),
            ),
          );
  }
}