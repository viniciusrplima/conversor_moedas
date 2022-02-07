import 'package:conversor_moedas/app/components/currency_box.dart';
import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  late HomeController homeController;

  @override
  void initState() {
    homeController = HomeController(toText: toText, fromText: fromText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20, right: 20, top: 100, bottom: 20),
            child: Column(
              children: [
                Image.asset('assets/images/money.png'),
                SizedBox(height: 50),
                CurrencyBox(
                  controller: toText,
                  currency: homeController.toCurrency,
                  options: CurrencyModel.getCurrencies(),
                  onChanged: (value) {
                    setState(() {
                      homeController.toCurrency = value!;
                    });
                  },
                ),
                SizedBox(height: 20),
                CurrencyBox(
                    controller: fromText,
                    currency: homeController.fromCurrency,
                    options: CurrencyModel.getCurrencies(),
                    onChanged: (value) {
                      setState(
                        () {
                          homeController.fromCurrency = value!;
                        },
                      );
                    }),
                SizedBox(height: 50),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.orangeAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                    onPressed: () {
                      homeController.convert();
                    },
                    child: Text(
                      'CONVERTER',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
