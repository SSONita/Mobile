import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum ExpenseType { food, travel, leisure, work }

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType expenseType;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.expenseType,
  }) : id = Uuid().v4();
}

IconData expenseTypeIcon(ExpenseType expenseType) {
  switch (expenseType) {
    case ExpenseType.food:
      return Icons.restaurant;
    case ExpenseType.travel:
      return Icons.travel_explore;
    case ExpenseType.leisure:
      return Icons.movie;
    case ExpenseType.work:
      return Icons.work;
  }
}
