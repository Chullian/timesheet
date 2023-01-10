import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAlertDialog(
    {required BuildContext context,
    required String title,
    required String message,
    required String positiveButtonText,
    required String negativeButtonText,
    required Function() onClickedPositiveButton,
    required Function() onClickedNegativeButton}) {
  //Createbutton
  Widget positiveButton = GestureDetector(
    child: Text(
        positiveButtonText,
      style: TextStyle(color: Colors.green),
    ),
    onTap: () {
      onClickedPositiveButton();
    },
  );
  Widget negativeButton = GestureDetector(
    child: Text(negativeButtonText,style: TextStyle(color: Colors.red),),
    onTap: () {
      onClickedNegativeButton();
    },
  );

  //CreateAlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actionsPadding: EdgeInsets.only(bottom:20,left: 20,right:20),
    actions: [positiveButton, negativeButton],
  );

  //showthedialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
