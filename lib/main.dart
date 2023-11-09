import 'package:expenseapp/pages/expense_list.dart';
import 'package:flutter/material.dart';

// Single Responsibility
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ExpenseApp'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                
              },
            ),
          ],
        ),
        body: const ExpenseList(),
      ),
    ),
  );
}

// modelleme => üzerinde çalışılacak yapıların uygulamada nesne haline getirilmesi