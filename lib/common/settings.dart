import 'package:flutter/cupertino.dart';

/// Where all app static settings should be set.
class Settings {
  static const double BORDER_RADIUS_SMALL = 5;
  static const double BORDER_RADIUS_MEDIUM = 10;
  static const double BORDER_RADIUS_LARGE = 20;

  static const String ASSET_ICON_MENU = "assets/icons/menu.svg";

  static const Map<int, String> HTTP_REQUEST_STATE_CODE = {
    200: "Ok",
    400: "BAD_REQUEST",
    401: "UNAUTHORIZED",
    403: "FORBIDDEN",
    404: "NOT_FOUND",
    408: "REQUEST_TIMEOUT",
  };

  static const Map<EndPoint, String> IMSB_ENDPOINTS = {
    EndPoint.addProduct: "/product/create",
    EndPoint.getAllProducts: "/product",
    EndPoint.getProduct: "/product",
    EndPoint.updateProduct: "/update/product",
    EndPoint.getProductInstance: "/productInstance/"
  };
}

class DefaultAppColorTHeme {
  static const Color COLOR_BG_PRIMARY = Color.fromRGBO(63, 162, 203, 1);
  static const Color COLOR_BG_SECONDARY = Color.fromRGBO(238, 238, 238, 1);
  static const Color COLOR_BG_MAIN = Color.fromRGBO(255, 255, 255, 1);
  static const Color COLOR_BG_DISCOUNT = Color.fromRGBO(2, 255, 134, 1);
  static const Color COLOR_FONT_LIGHT = Color.fromRGBO(255, 255, 255, 1);
  static const Color COLOR_FONT_DARK = Color.fromRGBO(0, 0, 0, 1);
  static const Color COLOR_FONT_GREY = Color.fromRGBO(98, 98, 98, 1);
}

class TextStyles {
  static const TEXT_LARGE_BOLD_LIGHT = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_LIGHT,
      fontSize: FontSizes.LARGE,
      fontWeight: FontWeights.BOLD);
  static const TEXT_LARGE_BOLD_DISCOUNT = TextStyle(
      color: DefaultAppColorTHeme.COLOR_BG_DISCOUNT,
      fontSize: FontSizes.LARGE,
      fontWeight: FontWeights.BOLD);
  static const TEXT_LARGE_BOLD_PRIMARY = TextStyle(
      color: DefaultAppColorTHeme.COLOR_BG_PRIMARY,
      fontSize: FontSizes.LARGE,
      fontWeight: FontWeights.BOLD);
  static const TEXT_LARGE_BOLD_DARK = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_DARK,
      fontSize: FontSizes.LARGE,
      fontWeight: FontWeights.BOLD);
  static const TEXT_MEDIUM_BOLD_DARK = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_DARK,
      fontSize: FontSizes.MEDIUM,
      fontWeight: FontWeights.BOLD);
  static const TEXT_MEDIUM_BOLD_LIGHT = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_LIGHT,
      fontSize: FontSizes.MEDIUM,
      fontWeight: FontWeights.BOLD);
  static const TEXT_MEDIUM_MEDIUM_DARK = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_DARK,
      fontSize: FontSizes.MEDIUM,
      fontWeight: FontWeights.MEDIUM);
  static const TEXT_SMALL_BOLD_LIGHT = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_LIGHT,
      fontSize: FontSizes.SMALL,
      fontWeight: FontWeights.BOLD);
  static const TEXT_SMALL_LIGHT_LIGHT = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_LIGHT,
      fontSize: FontSizes.SMALL,
      fontWeight: FontWeights.LIGHT);
  static const TEXT_SMALL_REGULAR_LIGHT = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_LIGHT,
      fontSize: FontSizes.SMALL,
      fontWeight: FontWeights.REGULAR);
  static const TEXT_SMALL_BOLD_DARK = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_DARK,
      fontSize: FontSizes.SMALL,
      fontWeight: FontWeights.BOLD);
  static const TEXT_EXTRA_SMALL_REGULAR_LIGHT = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_LIGHT,
      fontSize: FontSizes.EXTRA_SMALL,
      fontWeight: FontWeights.REGULAR);
  static const TEXT_EXTRA_SMALL_MEDIUM_LIGHT = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_LIGHT,
      fontSize: FontSizes.EXTRA_SMALL,
      fontWeight: FontWeights.MEDIUM);
  static const TEXT_EXTRA_SMALL_BOLD_LIGHT = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_LIGHT,
      fontSize: FontSizes.EXTRA_SMALL,
      fontWeight: FontWeights.BOLD);
  static const TEXT_EXTRA_SMALL_REGULAR_GREY = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_GREY,
      fontSize: FontSizes.EXTRA_SMALL,
      fontWeight: FontWeights.REGULAR);
  static const TEXT_EXTRA_SMALL_REGULAR_DARK = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_DARK,
      fontSize: FontSizes.EXTRA_SMALL,
      fontWeight: FontWeights.REGULAR);

  static const TEXT_EXTRA_SMALL_BOLD_DARK = TextStyle(
      color: DefaultAppColorTHeme.COLOR_FONT_DARK,
      fontSize: FontSizes.EXTRA_SMALL,
      fontWeight: FontWeights.BOLD);
}

class FontSizes {
  static const double LARGE = 24;
  static const double MEDIUM = 18;
  static const double SMALL = 14;
  static const double EXTRA_SMALL = 12;
}

class FontWeights {
  static const FontWeight BOLD = FontWeight.w600;
  static const FontWeight SEMI_BOLD = FontWeight.w500;
  static const FontWeight MEDIUM = FontWeight.w400;
  static const FontWeight REGULAR = FontWeight.w300;
  static const FontWeight LIGHT = FontWeight.w200;
  static const FontWeight THIN = FontWeight.w100;
}

enum EndPoint {
  getAllProducts,
  getProduct,
  getProductInstance,
  addProduct,
  updateProduct,
}

enum DataStatus { inProgress, succeed, faild, timeout, none }

enum NetworkState { connected, disconnected, none }
