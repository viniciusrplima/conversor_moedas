import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final CurrencyModel currency;
  final List<CurrencyModel> options;
  final ValueChanged<CurrencyModel?> onChanged;
  final TextEditingController controller;

  const CurrencyBox({
    Key? key,
    required this.currency,
    required this.options,
    required this.onChanged, 
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 57,
            child: CustomDropdown(
              value: currency,
              options: options,
              onChanged: onChanged, 
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: CustomTextField(
              controller: controller,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.orangeAccent,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orangeAccent,
            width: 2,
          ),
        ),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final CurrencyModel value;
  final List<CurrencyModel> options;
  final ValueChanged<CurrencyModel?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.value,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  DropdownMenuItem<CurrencyModel> _dropdownItem(final CurrencyModel value) {
    return DropdownMenuItem(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(value.name),
      ),
      value: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CurrencyModel>(
      menuMaxHeight: 200,
      value: value,
      iconEnabledColor: Colors.orangeAccent,
      underline: Container(
        color: Colors.orangeAccent,
        height: 2,
      ),
      items: options.map((option) => _dropdownItem(option)).toList(),
      onChanged: onChanged,
    );
  }
}
