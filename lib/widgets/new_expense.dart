import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // Controller
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  late DateTime selectedDate = DateTime.now();
  var formatter = DateFormat.yMd();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Expense Name")),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(label: Text("Amount"), prefixText: "₺"),
          ),
          IconButton(
              onPressed: () {
                // DatePicker açmak..
                // DatePicker'dan gelen değeri Text olarak yazdırmak
                _selectDate(context);
              },
              icon: const Icon(Icons.calendar_month)),
          const Text(
              "Tarih Seçiniz.."), // seçilen tarihi formatlayarak yazdırmak..
          Text(
            'Seçilen Tarih: ${formatter.format(selectedDate).toString()}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                if (kDebugMode) {
                  print("Kayıt başarılı: ${_nameController.text}");
                }
              },
              child: const Text("Kaydet"))
        ],
      ),
    );
  }
}
