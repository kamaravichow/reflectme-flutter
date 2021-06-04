
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle =
        TextStyle(color: Colors.white30, fontSize: 14, fontFamily: "Nunito");
    TextStyle linkStyle = TextStyle(color: Colors.white, fontFamily: "Nunito");
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(text: 'By signing in, you are agreeing to our\n'),
          TextSpan(
              text: 'Terms of Service',
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _launchURL();
                }),
          TextSpan(text: ' and '),
          TextSpan(
              text: 'Privacy Policy',
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _launchURL();
                }),
        ],
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://developer.aravi.me/gratitude';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class DateUtils {
  DateTime getDateTimeFrom(String inputString) {
    DateFormat format = DateFormat.yMMMMd();
    return format.parse(inputString);
  }

  String getStringFrom(DateTime date) {
    return new DateFormat.yMMMMd().format(date);
  }

  
}
