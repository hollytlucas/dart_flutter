import 'package:call_me/styles.dart';
import 'package:flutter/material.dart';
import 'package:call_me/models/predictor_model.dart';


class PredictorContent extends StatefulWidget {
  const PredictorContent({Key? key}) : super(key: key);

  //const _PredictorContent({Key? key}) : super(key: key);


  @override
  PredictorContentState createState() => PredictorContentState();
}

class PredictorContentState extends State< PredictorContent> {
  

  final answer = Answer();

  @override
  Widget build(BuildContext context){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(children: [
          callMeMaybe(),
          GestureDetector(
            onTap:() => setState(() {
              answer.getAnswer();
              }),
              child: Text(answer.currentAnswer, style: Styles.headerLarge),
          ),
          yesDefinitely(),
          ],
        )
      ),
    );
  }

//----------------------------call maybe statement------------------
  Widget callMeMaybe(){
    return const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text('Call Me....Maybe', textAlign: TextAlign.center, style: Styles.headerLarge,
        ),
      );
    }

//------------------------------yes definitely statement -------------
  Widget yesDefinitely(){
    return const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text('Yes, Definitely', textAlign: TextAlign.center, style: Styles.headerLarge,
        ),
      );
    }
}

