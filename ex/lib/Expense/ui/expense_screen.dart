import 'package:ex/Expense/model/expense_model.dart';
import 'package:flutter/material.dart';
import '../model/expense_model.dart';
import '../data/expense_data.dart';
import 'expense_form.dart';
import 'expenseItem.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  void onAddClicked(BuildContext context) async {
    final newExpense = await showModalBottomSheet<Expense>(
      isScrollControlled: false,
      context: context,
      builder: (c) {
        return Center(child: Scaffold(body: ExpenseForm()));
      },
    );

    // TODO YOUR CODE HERE
    if (newExpense != null) {
      setState(() {
        dataExpenses.add(newExpense);
      });
    }
  }

  void onDelete(Expense expense, int index) {
    setState(() {
      dataExpenses.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense deleted.'),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              dataExpenses.insert(index, expense);
            });
          },
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {onAddClicked(context)},
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: dataExpenses.isEmpty
          ? Center(
              child: Text(
                'No expenses found. Start adding some!',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            )
          : ListView.builder(
              itemCount: dataExpenses.length,
              // itemBuilder: (context, index) =>
              //     ExpenseItem(expense: dataExpenses[index]),
              itemBuilder: (context, index) {
                final expense = dataExpenses[index];
                return Dismissible(
                  key: Key(expense.id.toString()),
                  onDismissed: (direction) {
                    onDelete(expense, index);
                  },
                  child: ExpenseItem(expense: dataExpenses[index]),
                );
              },
            ),
    );
  }
}
