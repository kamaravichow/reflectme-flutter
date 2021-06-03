import 'package:flutter/material.dart';

class VerificationDialog extends StatefulWidget {
  const VerificationDialog({Key? key}) : super(key: key);

  @override
  _VerificationDialogState createState() => _VerificationDialogState();
}

class _VerificationDialogState extends State<VerificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 200,
      ),
    );
  }
}
