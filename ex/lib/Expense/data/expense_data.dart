import '../model/expense_model.dart';

final List<Expense> dataExpenses = [
  Expense(
    title: 'Flutter Course',
    amount: 19.99,
    date: DateTime(2024, 11, 24),
    expenseType: ExpenseType.work
  ),
  Expense(
    title: 'Cinema',
    amount: 15.69,
    date: DateTime(2024, 11, 24),
    expenseType: ExpenseType.leisure
  ),
];