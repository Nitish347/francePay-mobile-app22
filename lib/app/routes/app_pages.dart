import 'package:francepay/app/bindings/home_binding.dart';
import 'package:francepay/app/bindings/sigin_binding.dart';
import 'package:francepay/app/bindings/transfer_binding.dart';

import 'package:francepay/app/middleware/auth_middleware.dart';
import 'package:francepay/app/middleware/first_middleware.dart';
import 'package:francepay/app/views/contact.dart';
import 'package:francepay/app/views/pages/tran_msg.dart';
import 'package:francepay/app/views/profile.dart';

import 'package:francepay/app/views/signIn.dart';
import 'package:francepay/pages/confirmationMail.dart';
import 'package:francepay/pages/newPayment.dart';
import 'package:francepay/app/views/signup/phoneNumber.dart';
import 'package:francepay/app/views/payment_by_fpay.dart';
import 'package:francepay/pages/payments.dart';
import 'package:francepay/pages/test.dart';
import 'package:francepay/app/views/transactionDetails.dart';
import 'package:get/get.dart';
import 'package:francepay/app/views/account_home.dart';
import 'package:francepay/app/views/transfer.dart';

import 'package:francepay/pages/welcome.dart';
import 'package:francepay/app/views/payment_service/payment_setup_page.dart';
import 'package:francepay/pages/gerer.dart';

//import 'package:francepay/pages/cardForm.dart';
import 'package:francepay/app/views/payment_service/add_card.dart';
import 'package:francepay/app/views/payment_service/add_bank.dart';

import 'package:francepay/app/views/qrpage.dart';
import 'package:francepay/app/views/add_money.dart';

import 'package:francepay/app/views/payment_service/add_money_page.dart';

import '../../widgets/bottomBar.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names, non_constant_identifier_names
  static get INITIAL => Routes.BOTTOMBAR;

  static final routes = [
    GetPage(
        name: _Paths.BOTTOMBAR,
        page: () => AnimatedBarExample(),
        binding: HomeBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.HOME,
        page: () => WelcomePage(),
        binding: HomeBinding(),
        middlewares: [FirstMiddleware()]),
    GetPage(
        name: _Paths.LOGIN,
        page: () => SignIn(),
        binding: SigInBinding(),
        middlewares: [FirstMiddleware()]),
    GetPage(
        name: _Paths.PROFILE,
        page: () => Profil(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.ACCOUNT,
        page: () => MainMenu(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.TRANSFER,
        page: () => CreateTransaction(),
        binding: TransferBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.MY_PAYMENT,
        page: () => MainMenu(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.SIGNUP,
        page: () => PhoneNumber(),
        middlewares: [FirstMiddleware()]),
    GetPage(
      name: _Paths.TEST,
      page: () => CardForm(), //Gerer(),  //CongratulationPage(token: "token"),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
        name: _Paths.CARD,
        page: () =>
            CardForm(), //Gerer(),  //CongratulationPage(token: "token"),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.BANK,
        page: () =>
            BankForm(), //Gerer(),  //CongratulationPage(token: "token"),
        middlewares: [AuthMiddleware()]),
    // GetPage(
    //     name: _Paths.QR_PAGE,
    //     page: () =>
    //         QRScanPage(), //Gerer(),  //CongratulationPage(token: "token"),
    //     middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.ADD_MONEY,
        page: () =>
            AddMoneyPage(), //Gerer(),  //CongratulationPage(token: "token"),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.TRAN_MSG,
        page: () =>
            TransactionMsgDetails(), //Gerer(),  //CongratulationPage(token: "token"),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.TRAN_MSG,
        page: () =>
            TransactionMsgDetails(), //Gerer(),  //CongratulationPage(token: "token"),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: _Paths.PAYMENT_WAYS,
        page: () => WaysOfPayments(),
        middlewares: [AuthMiddleware()]),
    GetPage(
      name: _Paths.IDPAYMENT,
      page: () => FpayIdPaymentScreen(),
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => ContactsPage(),
    ),
  ];
}
