import 'package:expenseapp/data/expenses.dart';
import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/pages/expense_list.dart';
import 'package:expenseapp/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _addExpense(Expense newExpense) {
    setState(() {
      expenses.add(newExpense);
    });
  }

   void removeExpense(Expense expense) {
    setState(() {
      expenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense App"),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) => NewExpense(
                          addExpense: _addExpense,
                        ));
              },
              icon: const Icon(Icons.add)),
        ],
      ),
       body: expenses.length > 0
          ? ExpenseList(expenses, removeExpense)
          : const Text("Henüz hiç bir veri girmediniz..."),
    );
  }
}
