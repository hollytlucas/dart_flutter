import 'package:call_me/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class BusinessCardContent extends StatelessWidget {
  
  final double padding; 

  const BusinessCardContent({Key? key, required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: column()
          ),
        );
  }

Widget column() {
  return SingleChildScrollView(
    child: Column(
    children: [
       getImage(),
       getName(),
       getTitle(),
       getPhoneNumber(),
       getEmailAndGit(),
    ],
  )
  );
}

//----------------------Image------------------------------------

Widget getImage() {
  return ClipRRect(
  borderRadius: 
    BorderRadius.circular(40),
  child: imageContainer(),
  );
}

Widget imageContainer() {
  return  Padding(
    padding: const EdgeInsets.all(13.0),
    child: Container(
      alignment: Alignment.topCenter,
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
                'assets/dog.jpg'),
            fit: BoxFit.fitWidth,
          ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 68, 68, 68).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        shape: BoxShape.circle,
        color: Colors.black
        ),
      ),
  );
  }

//-----------------------------------Name---------------------------------
Widget getName() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Text('Holly Lucas', 
      style: Styles.headerLarge),
  );
}

//-----------------------------------title---------------------------------
Widget getTitle() {
  return Container(
    alignment: Alignment.topCenter,
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(5),
    child: const Text('New CS Graduate', 
    style: Styles.standardFont),
  );
}

//-----------------------------------Phone Number---------------------------------
Widget getPhoneNumber() {
  return Container(
    alignment: Alignment.topCenter,
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(5),
    child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.message,
            color: Colors.black),
          hyperLinkSms(),
      ]
    )
  );
}

//-----------------------------Git and email--------------------------------
//function to return git and email
Widget getEmailAndGit() {
  return Container(
    alignment: Alignment.topCenter,
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(5),
    child: 
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      hyperLinkWebsite(),
      const Text('jsmith@yahoo.com',
        style: Styles.smallFont)
    ])
  ); 
}

Widget hyperLinkWebsite(){
 return GestureDetector(
          onTap: _launchUrlWebsite,
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("github.com/jsmith",
              style: Styles.smallFont),
          ),
        );
}

void _launchUrlWebsite() async {
  var url = Uri.parse('https://google.com');
  if (!await launchUrl(url)) throw 'Could not launch $url';
}

Widget hyperLinkSms(){
 return GestureDetector(
          onTap: _launchUrlSms,
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('(555) 555-5555',
              style: Styles.standardFont),
          ),
        );
}

void _launchUrlSms() async {
  var urlSms = Uri.parse('sms:555-555-5555?body=hello%20there');
  if (!await launchUrl(urlSms)) throw 'Could not launch $urlSms';
}

}