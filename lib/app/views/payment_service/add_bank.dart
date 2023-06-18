import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:francepay/app/controllers/transfer_controller.dart';
import 'package:francepay/widgets/nextButton.dart';
import 'package:francepay/widgets/flagAppBar.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class BankForm extends StatefulWidget {
  const BankForm({Key? key}) : super(key: key);

  @override
  _BankFormState createState() => _BankFormState();
}

class _BankFormState extends State<BankForm> {
  @override
  final transferController = Get.put(TransferController());

  TextEditingController OwnerName = TextEditingController(text : null);
  TextEditingController AddressLine1 = TextEditingController(text : null);
  TextEditingController AddressLine2 = TextEditingController(text : null);
  TextEditingController City = TextEditingController(text : null);
  TextEditingController Region = TextEditingController(text : null);
  TextEditingController PostalCode = TextEditingController(text : null);
  TextEditingController Country = TextEditingController(text : null);
  TextEditingController IBAN = TextEditingController(text : null);
  TextEditingController BIC = TextEditingController(text : null);

  bool isLoading = false;

  Widget build(BuildContext context) {

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

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FlagAppBar(),
            Container(
              margin: EdgeInsets.only(left: width/4, right: width/4, top: height/20, bottom: height/40),
              child: Image.asset("assets/images/logo-main.png"),),
            Form(
              child: Column(
                children: [
                  Container(
                    child: Text("VEUILLEZ ENTRER VOS DONNEES", style: TextStyle(fontSize: 20, fontFamily: "sarabun", fontWeight: FontWeight.w500),),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: width/15, right: width/15, top: height/60),
                      child: Image.asset("assets/images/banksLogo.gif")
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width/14, top: height/50),
                    child: Row(
                      children: [
                        Image.asset("assets/images/nameOffice.png", scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width/100),
                            child: Text("Owner Name",
                              style: TextStyle(color: Color(0XFF757F8C),
                                  fontWeight: FontWeight.w500, fontSize: 12),))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                    child: TextFormField(
                      controller: OwnerName,
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true, //<-- SEE HERE
                        fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                      ),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                    child: TextFormField(
                      // Only numbers can be entered
                      controller: AddressLine1,
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'Adress Line 1',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true, //<-- SEE HERE
                        fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                      ),
                    ),
                  ),



                  Container(
                    margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                    child: TextFormField(
                      // Only numbers can be entered
                      controller: AddressLine2,
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'Address Line 2',

                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true, //<-- SEE HERE
                        fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                      ),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                    child: TextFormField(
                      // Only numbers can be entered
                      controller: City,
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'City',

                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true, //<-- SEE HERE
                        fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                      ),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                    child: TextFormField(
                      // Only numbers can be entered
                      controller: Region,
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'Region',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true, //<-- SEE HERE
                        fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                      ),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                    child: TextFormField(
                      // Only numbers can be entered
                      controller: PostalCode,
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'PostalCode',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true, //<-- SEE HERE
                        fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                      ),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                    child: TextFormField(
                      // Only numbers can be entered
                      controller: Country,
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'Country',

                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true, //<-- SEE HERE
                        fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: width/14, top: height/50),
                    child: Row(
                      children: [
                        Image.asset("assets/images/contractIcon.png", scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width/100),
                            child: const Text("IBAN",
                              style: TextStyle(color: Color(0XFF757F8C),
                                  fontWeight: FontWeight.w500, fontSize: 12),))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                    child: TextFormField(
                      // Only numbers can be entered
                      controller: IBAN,
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'IBAN',

                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true, //<-- SEE HERE
                        fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width/14, top: height/50),
                    child: Row(
                      children: [
                        Image.asset("assets/images/passwordIcon.png", scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width/100),
                            child: const Text("BIC",
                              style: TextStyle(color: Color(0XFF757F8C),
                              fontWeight: FontWeight.w500, fontSize: 12),))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                    child: TextFormField(
                      // Only numbers can be entered
                      controller: BIC,
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'BIC',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true, //<-- SEE HERE
                        fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: height/20),
                    child: SizedBox(
                      width: width/4,
                      height: height/20,
                      child: ElevatedButton(   onPressed: () async {

                       if(OwnerName.text.isEmpty || AddressLine1.text.isEmpty || AddressLine2.text.isEmpty || City.text.isEmpty || Region.text.isEmpty || PostalCode.text.isEmpty || Country.text.isEmpty || IBAN.text.isEmpty){
                        paymentFaield("All field is required");
                        }

                        else {
                         setState(() {
                           isLoading = true;
                         });

                          var Owner = OwnerName.text;
                          var ALine1 = AddressLine1.text;
                          var ALine2 = AddressLine2.text;
                          var DCity = City.text;
                          var DRegion = Region.text;
                          var DPostalCode = PostalCode.text;
                          var DCountry = Country.text;
                          var DIBAN = IBAN.text;
                          var DBIC = BIC.text;


                         var data = await transferController.Bank_Reg(Owner, ALine1, ALine2, DCity, DRegion, DPostalCode, DCountry, DIBAN, DBIC);

                         if (data['status'] == true) {
                               paymentSuccess(data['msg']);
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
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),

                              )
                          ),
                          backgroundColor:  MaterialStateProperty.all(Color(0XFFED2939)),
                        ),
                        child: Text("Add Bank"),
                      ),
                    ),
                    //child: NextButton(buttonColor: Color(0XFF1d3364), text: "Suivant", nextPage: MainMenu())
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height/20, bottom: height/20),
                    // child: NextButton(buttonColor: Color(0XFF1d3364), text: "Suivant", nextPage: CongratulationPage(token: "",))
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
