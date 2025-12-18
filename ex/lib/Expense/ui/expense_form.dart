import 'package:ex/Expense/model/expense_model.dart';
import 'package:flutter/material.dart';
import '../data/expense_data.dart';
import '../model/expense_model.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  ExpenseType expenseType = ExpenseType.leisure;
  DateTime? selectedDate;

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();
    _amountController.dispose();
  }

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    setState(() {
      selectedDate = pickedDate;
    });
  }

  void onCreate() {
    //  1 Build an expense
    String title = _titleController.text;
    double? amount =
        double.tryParse(_amountController.text) ?? 0.0; // for now..
    DateTime date = DateTime.now();

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a title')),
      );
      return;
    }

    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount')),
      );
      return;
    }

    if (selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date')),
      );
      return;
    }
    // ignore: unused_local_variable
    Expense newExpense = Expense(
      title: title,
      amount: amount,
      date: date,
      expenseType: expenseType,
    );

    Navigator.pop(context, newExpense);
  }

  void onCancel() {
    // Close the modal
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(label: Text("Amount")),
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      selectedDate != null
                          ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                          : 'No date selected',
                    ),
                    IconButton(
                      onPressed: selectDate,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: DropdownButtonFormField(
                  initialValue: expenseType,
                  items: ExpenseType.values.map((t) {
                    return DropdownMenuItem(
                      value: t,
                
                      child: Text(t.name.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        expenseType = value;
                      });
                    }
                  },
                ),
              ),
              SizedBox(width: 100,),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: onCancel,
                  style: ElevatedButton.styleFrom(
                    elevation: 0
                  ), 
                  child: Text("Cancel"),
                )
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: 
                  // (
                  //   _titleController.text.isNotEmpty &&
                  //   double.tryParse(_amountController.text) != null &&
                  //   selectedDate != null) ? onCreate : null, 
                    onCreate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[50],
                    shadowColor: Colors.purple[400]
                  ),
                  child: Text("Save Expense")
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
