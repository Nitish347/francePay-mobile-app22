part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const ACCOUNT = _Paths.ACCOUNT;
  static const PROFILE = _Paths.PROFILE;
  static const TRANSFER = _Paths.TRANSFER;
  static const MY_PAYMENT = _Paths.MY_PAYMENT;
  static const SIGNUP = _Paths.SIGNUP;
  static const TEST = _Paths.TEST;
  static const CARD = _Paths.CARD;
  static const BANK = _Paths.BANK;
  static const ADD_MONEY = _Paths.ADD_MONEY;
  static const QR_PAGE = _Paths.QR_PAGE;
  static const TRAN_MSG = _Paths.TRAN_MSG;
  static const PAYMENT_WAYS = _Paths.PAYMENT_WAYS;
  static const BOTTOMBAR = _Paths.BOTTOMBAR;
  static const ENTERAMOUNT = _Paths.ENTERAMOUNT;
  static const IDPAYMENT = _Paths.IDPAYMENT;
}

abstract class _Paths {
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const ACCOUNT = '/account';
  static const PROFILE = '/profile';
  static const TRANSFER = '/transfer';
  static const MY_PAYMENT = '/my_payment';
  static const SIGNUP = '/signup';
  static const CARD = '/card';
  static const BANK = '/bank';
  static const ADD_MONEY = '/add_money';
  static const QR_PAGE = '/qr_page';
  static const TRAN_MSG = '/tran_msg';
  static const TEST = '/test';
  static const PAYMENT_WAYS = '/payments';
  static const BOTTOMBAR = "/bottombar";
  static const ENTERAMOUNT = "/enter_amount";
  static const IDPAYMENT = "/fpay_id_payment";
}
