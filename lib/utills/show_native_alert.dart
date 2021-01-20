import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shopping_app/utills/strings.dart';

import 'colors.dart';
import 'imports.dart';

Future<T> showDialogOK<T>({
  @required BuildContext context,
  String title,
  String content,
  List<Widget> actions,
  bool cancelEnabled,
}) {
  Platform.isIOS
      ? showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text(title),
              content: Text(content),
              actions: actions,
            );
          })
      : showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: actions,
            );
          });
}

Future<T> showDialogLoading<T>({
  @required BuildContext context,
}) {
  Platform.isIOS
      ? showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              content: new Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: CupertinoActivityIndicator(),
                  ),
                  Container(
                      child: Text(
                    Strings.loading,
                    //style: TextStyle(fontSize: 18.0, fontFamily: 'FuturaBold'),
                  )),
                ],
              ),
            );
          },
        )
      : showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: new Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          MyColors.kPrimaryColor),
                    ),
                  ),
                  Container(
                      child: Text(
                        Strings.loading,
                    //style: TextStyle(fontSize: 18.0, fontFamily: 'FuturaBold'),
                  )),
                ],
              ),
            );
          },
        );
}

Future<T> showDialogPleaseWait<T>({
  @required BuildContext context,
  String title,
}) {
  Platform.isIOS
      ? showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              content: new Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: CupertinoActivityIndicator(),
                  ),
                  Container(
                      child: Text(
                    Strings.pleaseWait+title,
                    //style: TextStyle(fontSize: 18.0, fontFamily: 'FuturaBold'),
                  )),
                ],
              ),
            );
          },
        )
      : showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: new Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          MyColors.kPrimaryColor),
                    ),
                  ),
                  Container(
                      child: Text(
                        Strings.pleaseWait+title,
                    //style: TextStyle(fontSize: 18.0, fontFamily: 'FuturaBold'),
                  )),
                ],
              ),
            );
          },
        );
}
