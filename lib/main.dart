import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cet Calculator',
      home: MyCalculator(),
    );
  }
}
class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  double result = 0.0;
  String strResult='0';
  String operator = '';
  double firstNum ;
  bool isFirstNumAfOpBut= true;
 void onDigitPress(String text){
   print('digit pressed $text');

   if(text=='+'){
     operator=text;
     firstNum=result;
     isFirstNumAfOpBut= true;
     strResult='';
     setState(() {
     });

   } if(text=='C'){
     operator=text;
     result=0;
     firstNum=result;
     isFirstNumAfOpBut= true;
     strResult='';
     setState(() {
     });

   }else if(text=='/'){
     operator=text;
     firstNum=result;
     isFirstNumAfOpBut= true;
     strResult='';
     setState(() {
     });

   }
   else if(text=='⌫'){
     operator=text;
     firstNum=result;
     isFirstNumAfOpBut= true;
     strResult='';
     setState(() {
     });

   }else if(text=='-'){
     operator=text;
     firstNum=result;
     isFirstNumAfOpBut= true;
     strResult='';
     setState(() {
     });

   }else if(text=='*'){  operator=text;
   firstNum=result;
   isFirstNumAfOpBut= true;
   strResult='';
   setState(() {
   });

   }else if(text=='='){
    switch (operator){
      case '+':
      setState(() {
        result=result+firstNum;
      });
      strResult='$result';
      break;
      case '*':
        setState(() {
          result=result*firstNum;
        });
        strResult='$result';
        break;
      case '-':
        setState(() {
          result=firstNum-result;
        });
        strResult='$result';
        break;
      case '/':
        setState(() {
          result=firstNum/result;
        });
        strResult='$result';
        break;
      case '⌫':
        setState(() {
          result=(result-(result%10))/10;
        });
        strResult='$result';
        break;
    }
   }else {
     var tempResult;
     if(isFirstNumAfOpBut){
       tempResult= text;
       isFirstNumAfOpBut=false;
     }else{
       tempResult=strResult+ text;
     }
       var temp= double.tryParse(tempResult);
       if(temp!=null){
         strResult=tempResult;
         setState(() {
           result=temp??result;
         });
       }
   }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Simple Calculator"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  '$result',
                  style: TextStyle(fontSize: 60),
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildCalcButton2('C', Colors.white),
                  buildCalcButton1('⌫', Colors.white),
                  buildCalcButton1('/', Colors.white),

                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  buildCalcButton('7', Colors.white),
                  buildCalcButton('8', Colors.white),
                  buildCalcButton('9', Colors.white),
                buildCalcButton1('*', Colors.white),
              ],
          ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    buildCalcButton('4', Colors.white),
                    buildCalcButton('5', Colors.white),
                    buildCalcButton('6', Colors.white),
                  buildCalcButton1('+', Colors.white),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildCalcButton('1', Colors.white),
                  buildCalcButton('2', Colors.white),
                  buildCalcButton('3', Colors.white),
                  buildCalcButton1('-', Colors.white),

        ],
        ),
      ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
                  buildCalcButton('.', Colors.white),
                   buildCalcButton('0', Colors.white),
                  buildCalcButton('00', Colors.white),
               buildCalcButton1('=', Colors.white),
        ],
      ),
          ),
        ],
      ),
    ),
    );
  }

  Expanded buildCalcButton(String text, Color color) {
    return Expanded(
                  child: FlatButton(
                    onPressed: () {
                      onDigitPress(text);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                      color: Colors.white,
                      style: BorderStyle.solid,
                    ),
                    ),
                    color: Colors.black38,
                    child: Text(
                      text,
                      style: TextStyle(fontSize:30,
                          color: color),
                    ),
                  ),
                );
  }
  Expanded buildCalcButton1(String text, Color color) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          onDigitPress(text);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: Colors.white,
            style: BorderStyle.solid,
          ),
        ),
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(fontSize:30,
              color: color),
        ),
      ),
    );
  }
  Widget buildCalcButton2(String text, Color color ) {
    return Container(
      width:187,
      child: FlatButton(
        onPressed: () {
          onDigitPress(text);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),

          side: BorderSide(

            color: Colors.white,
            style: BorderStyle.solid,
          ),
        ),
        color: Colors.red,

        child: Text(
          text,
          style: TextStyle(fontSize: 30,
              color: color),
        ),
      ),
    );
  }
}
