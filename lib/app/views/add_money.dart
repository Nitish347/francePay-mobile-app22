import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/app/views/common/bottomnavbar.dart';
import 'package:get/get.dart';
import 'package:francepay/widgets/flagAppBar.dart';
import 'package:francepay/app/controllers/transfer_controller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';





class AddMoneyPage extends StatefulWidget {
  const AddMoneyPage({Key? key}) : super(key: key);

  @override
  State<AddMoneyPage> createState() => _AddMoneyPageState();
}

class _AddMoneyPageState extends State<AddMoneyPage> {
  final transferController = Get.put(TransferController());
 bool isLoading = false;


  paymentSuccess(data){
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: data,
    );
  }

  paymentFaield(data){ QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Oops...',
    text: data,
  );

  }




  @override
  Widget build(BuildContext context) {

    TextEditingController amountController = TextEditingController(text : null);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FlagAppBar(),
            Container(
              margin: EdgeInsets.only(left: width/4, right: width/4, top: height/20, bottom: height/20),
              child: Image.asset("assets/images/logo-main.png"),),
            Container(
              margin: EdgeInsets.only(right: 3*width/4),
              child: Text(
                "Balance",
                style: TextStyle(fontFamily: "sarabun", color: Color(0XFF757F8C), fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                height: height/10,
                width: width/1.1,
                //color: Colors.red,
                child: Card(
                  child: Center(
                    child: FutureBuilder(
                      future: transferController.GetWalletBalance(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text('${snapshot.data}', textAlign: TextAlign.center, style: TextStyle(color: Color(0XFF118C4F), fontWeight: FontWeight.w600, fontFamily: "sarabun", fontSize: 20),);
                        } else {
                          print("This works...");
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                    //  child: Text("€ "+transferController.balance.value.toString(), textAlign: TextAlign.center, style: TextStyle(color: Color(0XFF118C4F), fontWeight: FontWeight.w600, fontFamily: "sarabun", fontSize: 20),),
                  ),
                )
            ),

            Container(
              margin: EdgeInsets.only(right: 3*width/4,top: height/30),
              child: Text(
                "Amount",
                style: TextStyle(fontFamily: "sarabun", color: Color(0XFF757F8C), fontWeight: FontWeight.w500),
              ),
            ),

            Container(
                margin: EdgeInsets.only(top: height/30),
                width: 3*width/4,
                child: TextField(
                  controller: amountController,
                  scrollPadding:  EdgeInsets.only(bottom:40),
                  decoration: InputDecoration(
                    hintText: 'Montant de transfert',

                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                  ),
                )

            ),

        Container(
          margin: EdgeInsets.only(top: height/30),
          width: 3*width/4,
          child:

        FutureBuilder<List<Country>>(
            future: CountryService.getCountries(),
            builder: (BuildContext context, AsyncSnapshot<List<Country>> snapshot) {
            if (snapshot.hasData) {
            final List<Country>? countries = snapshot.data;

            return DropdownButton<String>(
            items: countries!.map((Country country) {
            return DropdownMenuItem<String>(

            value: country.IBAN,
              child: Row(
                children: [
                  new CircleAvatar(
                   // backgroundImage: NetworkImage(value.bank_logo),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(country.IBAN),
                ],
              ),
            );
            }).toList(),
            onChanged: (value) {
              print(value);
              setState(() {
               var bankChoose = value;
              });
            },
            hint: Text('Select a bank account'),
            );
            } else if (snapshot.hasError) {
            return Text('No data ');
            } else {
            return CircularProgressIndicator();
            }
            },
            ),
        ),

            Container(
                margin: EdgeInsets.only(top: height/20, bottom: height/20),
                width: width/1.5,
                child: ElevatedButton(onPressed:  () async {

               if (amountController.text == null || amountController.text.isEmpty){
                    paymentFaield("Amount is empty");
                  }

                  else {
                    setState(() {
                      isLoading = true;
                    });
                    // await Future.delayed(Duration(seconds: 4));
                    var data = await transferController.DeposideFund(amountController.text);

                    if (data['status'] == true) {



                      //getx send data to next page

                      //   Get.toNamed("/transfer", arguments: scanData.code);

                    //  Get.toNamed("/tran_msg", arguments: data["data"]);


                      /* Get.to(TransactionDetails(), arguments: {
                                  'amount': amountController.text,
                                  'walletid': data["transaction"]["accountNumber"],
                                  'transactionid': data["transaction"]["id"],
                                  'status': "success",
                                  'message': "Transaction successful",
                                  'date': data["transaction"]["createdAt"],
                                });*/


                      paymentSuccess(data['msg']);
                      // walletidController.clear();
                      //amountController.clear();

                    }

                    else if (data['status'] == false) {
                      paymentFaield(data['msg']);
                    }
                    else {
                      paymentFaield(data['msg']);
                    }

                    setState(() {
                      isLoading = false;
                    });
                  }

                },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0XFF1d3364)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),

                          )
                      )
                  ),
                  child: Text("Ajouter de l'argent"),

                )
            )
          ],
        ),
      ),
      bottomNavigationBar: NavBar(index: 1),
    );
  }
}
