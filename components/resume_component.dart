
//import 'dart:js';

import 'package:call_me/styles.dart';
import 'package:flutter/material.dart';

class ResumeContent extends StatelessWidget {
  
  final double padding; 

  const ResumeContent({Key? key, required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: customScroll(context)
          ),
        );
  }

//------------------------------custom scroll layout code---------------------------------------
  Widget customScroll(BuildContext context){
    const job1Desc =  {'location':'Salem, OR', 'company_name': 'Toys R Us', 'job_title': 'clerk', 'date': '03/03/2019-Present',
    'job_desc': 'Worked on the floor helping customers, reshelfing, cleaning, cashier work, customer service.'};

    const job2Desc = {'location':'Dallas, TX', 'company_name': 'Childrens Health', 'job_title': 'CDI', 'date': '03/03/2019-Present',
    'job_desc': 'Worked all shifts. Janitorial work as needed.  Worked on the floor helping customers, reshelfing, cleaning, cashier work, customer service.'};


    return CustomScrollView(
        slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 150,
          collapsedHeight: 150,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.all(10.0),
            background: Image.asset(
              'assets/oregon.jpg',
              fit: BoxFit.fill),
            title: Container(
              alignment: Alignment.center,
              child: getAppBarContent()
                ),         
              ),
            ),
          SliverList(
            delegate: SliverChildListDelegate([
              getJobContent(job1Desc),
              getJobContent(job2Desc),
              getJobContent(job1Desc),
              getJobContent(job2Desc),
            ]),
          ),
        ],
      );
  }

//------------------------------------------job card layout---------------------------
  Widget getJobContent(jobObject){
    return Padding(
      padding: const EdgeInsets.all(8.0),
        child:  Container(
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
              ),
            color: Colors.transparent,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 58, 58, 58),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),            
              ),
              child: Column(
              
              children: [
                getJobTitle(jobObject),
                getRowContent(jobObject),
                getJobDesc(jobObject),
                  ],
                ),
              )
            ),
          
        );
      }


//------------------------------------------contact info-------------------------------------
  Widget getAppBarContent(){
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: 
              Text('Holly Lucas',
              textAlign: TextAlign.center,
              style: Styles.headerLargeWhite),
            ),
    
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Text('555-555-5555',
              textAlign: TextAlign.center,
              style: Styles.smallFontWhite),
          ),
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Text('htlucas@yahoo.com',
              textAlign: TextAlign.center,
              style: Styles.smallFontWhite),
          ),
        ]
    
    );
  }

//------------------------------------------- job title-----------------------------------
  Widget getJobTitle(jobObject){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(jobObject['job_title'], style: Styles.smallFontWhiteBold),
    );
  }


//-------------------------------------company name, date and location ---------------------
  Widget getRowContent(jobObject){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Text(jobObject['company_name'], style: Styles.smallFontWhite),
        Text(jobObject['date'], style: Styles.smallFontWhite),
        Text(jobObject['location'], style: Styles.smallFontWhite),
          ],
        ),
      );
    }

//------------------------------------------job description-------------------------------
  Widget getJobDesc(jobObject){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(jobObject['job_desc'], style: Styles.smallFontWhite),
    );

  }

}