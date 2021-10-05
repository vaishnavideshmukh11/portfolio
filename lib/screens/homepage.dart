import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vaishnavi116/provider/dark_theme_provider.dart';
import 'package:vaishnavi116/utils/responsive.dart';
import 'package:vaishnavi116/utils/styles.dart';
import 'package:vaishnavi116/widgets/switcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';


const String githubUrl = 'https://github.com/vaishnavideshmukh11';
const String linkedinUrl = 'https://linkedin.com/in/vaishnavi-deshmukh-516111202';
const String twitterUrl = 'https://twitter.com/vai_deshmukh';
const String email = 'mailto:vaishnavi@quikieapps.com';
const String phone = 'tel:+919372088067';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: themeChange.darkTheme
                  ? AssetImage("dark.jpg")
                  : AssetImage("lght.jpg"),


              repeat: ImageRepeat.repeat),
        ),
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Container(
          margin: isMobile(context)
              ? EdgeInsets.only(left: 20.0, right: 20.0, top: 60.0)
              : EdgeInsets.only(left: 200.0, right: 200.0, top: 200.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello !!!",
                    style: GoogleFonts.lato(
                      fontSize: isMobile(context) ? 32.0 : 64.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Center(
                    child: CustomSwitch(
                      value: themeChange.darkTheme,
                      onChanged: (bool newValue) {
                        themeChange.darkTheme = newValue;
                      },
                    ),
                  ),
                ],
              ),
              isMobile(context)
                  ? SizedBox(
                      height: 15.0,
                    )
                  : SizedBox(
                      height: 30.0,
                    ),
              Text(
                "I am Vaishnavi.Software Developer Engineer (Flutter Developer) at Quikieapps Pvt Ltd.",
                style: GoogleFonts.openSans(
                  fontSize: isMobile(context) ? 25.0 : 41.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 32.0,
              ),
              isMobile(context)
                  ? Column(
                      children: [
                        ResumeButton(themeChange: themeChange),
                        SizedBox(height: 24.0),
                        buildIconRow(context),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ResumeButton(themeChange: themeChange),
                        SizedBox(height: 24.0),
                        buildIconRow(context),
                      ],
                    ),
              SizedBox(
                height: 32.0,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Want to get in touch? Write me at ',
                      style: GoogleFonts.lato(
                        fontSize: 20.0,
                        color: Theme.of(context).textSelectionColor,
                      ),
                    ),
                    TextSpan(
                      text: 'vaishnavi@quikieapps.com',
                      style: GoogleFonts.lato(
                        fontSize: 20.0,
                        color: Theme.of(context).textSelectionColor,
                        textStyle: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch(email);
                        },
                    ),
                    TextSpan(
                      text: ' or give a call @ ',
                      style: GoogleFonts.lato(
                        fontSize: 20.0,
                        color: Theme.of(context).textSelectionColor,
                      ),
                    ),
                    TextSpan(
                      text: '+91 9372088067',
                      style: GoogleFonts.lato(
                        fontSize: 20.0,
                        color: Theme.of(context).textSelectionColor,
                        textStyle: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch(phone);
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildIconRow(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMobile(context) ? MainAxisAlignment.center : MainAxisAlignment.end,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _launchURL(githubUrl);
          },
          child: Icon(
            FontAwesomeIcons.github,
            size: isMobile(context) ? 24.0 : 32.0,
          ),
        ),
        isMobile(context)
            ? SizedBox(
                width: 12.0,
              )
            : SizedBox(
                width: 18.0,
              ),
        GestureDetector(
          onTap: () {
            _launchURL(linkedinUrl);
          },
          child: Icon(
            FontAwesomeIcons.linkedin,
            size: isMobile(context) ? 24.0 : 32.0,
          ),
        ),
        isMobile(context)
            ? SizedBox(
                width: 12.0,
              )
            : SizedBox(
                width: 18.0,
              ),
        GestureDetector(
          onTap: () {
            _launchURL(twitterUrl);
          },
          child: Icon(
            FontAwesomeIcons.twitter,
            size: isMobile(context) ? 24.0 : 32.0,
          ),
        ),
        isMobile(context)
            ? SizedBox(
                width: 12.0,
              )
            : SizedBox(
                width: 18.0,
              ),
        GestureDetector(
          onTap: () {
            _launchURL(email);
          },
          child: Icon(
            FontAwesomeIcons.envelopeOpen,
            size: isMobile(context) ? 24.0 : 32.0,
          ),
        ),
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ResumeButton extends StatelessWidget {
  const ResumeButton({
    Key key,
    @required this.themeChange,
  }) : super(key: key);

  final DarkThemeProvider themeChange;



  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        launch('https://docs.google.com/document/d/13QHrXGr1FW-xbmZ3EDwrm3BoGjYWZQzg/edit#');
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: themeChange.darkTheme ? Colors.teal : kDarkColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Resume',
          style: GoogleFonts.lato(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
