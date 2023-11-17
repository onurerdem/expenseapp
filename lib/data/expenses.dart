import 'package:expenseapp/models/expense.dart';

// dummy data
final List<Expense> expenses = [
    Expense(
        name: "Yiyecek",
        price: 200.524,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        name: "Flutter Udemy Course",
        price: 200,
        date: DateTime.now(),
        category: Category.education),
  ]; // firebase,veritabanı