import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class BankListScreen extends StatefulWidget {
  @override
  _BankListScreenState createState() => _BankListScreenState();



}

class BankListDataModel {
  String bank_name;
  String bank_logo;
  BankListDataModel(this.bank_name, this.bank_logo);
}

class _BankListScreenState extends State<BankListScreen> {
  late BankListDataModel _bankChoose;

  void initState() {
    super.initState();
    _bankChoose = bankDataList[0];
  }

  void _onDropDownItemSelected(BankListDataModel newSelectedBank) {
    setState(() {
      _bankChoose = newSelectedBank;
    });
  }


  List<BankListDataModel> bankDataList = [
    BankListDataModel("SBI",
        "https://www.kindpng.com/picc/m/83-837808_sbi-logo-state-bank-of-india-group-png.png"),
    BankListDataModel("HDFC",
        "https://www.pngix.com/pngfile/big/12-123534_download-hdfc-bank-hd-png-download.png"),
    BankListDataModel("ICICI",
        "https://www.searchpng.com/wp-content/uploads/2019/01/ICICI-Bank-PNG-Icon-715x715.png"),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, top: 10, right: 15),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(12, 10, 20, 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<BankListDataModel>(
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: "verdana_regular",
                          ),
                          hint: Text(
                            "Select Bank",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "verdana_regular",
                            ),
                          ),
                          items: bankDataList
                              .map<DropdownMenuItem<BankListDataModel>>(
                                  (BankListDataModel value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Row(
                                    children: [
                                      new CircleAvatar(
                                        backgroundImage:
                                        NetworkImage(value.bank_logo),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(value.bank_name),
                                    ],
                                  ),
                                );
                              }).toList(),
                          isExpanded: true,
                          isDense: true,
                          onChanged: (newSelectedBank) {
                            _onDropDownItemSelected(newSelectedBank!);
                          },
                          value: _bankChoose,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}