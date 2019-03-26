import 'package:flutter/material.dart';
import 'dart:math';
class OnePlayer extends StatefulWidget {
  

  OnePlayer({Key key}) : super(key: key);

  _OnePlayerState createState() => _OnePlayerState();
}

class _OnePlayerState extends State<OnePlayer> {
  List<String> xo = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  String status = "X";
  void setInit(){
    setState(() {
     status = "X";
     for (var i = 0; i < xo.length; i++) {
       xo[i]="";
     } 
    });
  }
  
 
  

  @override
  Widget build(BuildContext context) {
    void showResult(String titleText){
    showDialog(context: context,
    builder: (BuildContext context)=>
    AlertDialog(
      title: Text("ผลการแข่งขัน"),
      content: Text(titleText),
      actions: <Widget>[
        FlatButton(
          child:Text("OK"),
          onPressed: (){Navigator.pop(context);
          setInit();},
          
        )
      ],


    ) );
  }
   void checkWinBot(){
   if( (xo[0]=="X"&&xo[1]=="X"&&xo[2]=="X")||(xo[3]=="X"&&xo[4]=="X"&&xo[5]=="X")||(xo[6]=="X"&&xo[7]=="X"&&xo[8]=="X")||(xo[0]=="X"&&xo[3]=="X"&&xo[6]=="X")||(xo[1]=="X"&&xo[4]=="X"&&xo[7]=="X")||(xo[2]=="X"&&xo[5]=="X"&&xo[8]=="X")||(xo[0]=="X"&&xo[4]=="X"&&xo[8]=="X")||(xo[2]=="X"&&xo[4]=="X"&&xo[6]=="X")){
    showResult("X Win");
    
    }
    else if((xo[0]=="O"&&xo[1]=="O"&&xo[2]=="O")||(xo[3]=="O"&&xo[4]=="O"&&xo[5]=="O")||(xo[6]=="O"&&xo[7]=="O"&&xo[8]=="O")||(xo[0]=="O"&&xo[3]=="O"&&xo[6]=="O")||(xo[1]=="O"&&xo[4]=="O"&&xo[7]=="O")||(xo[2]=="O"&&xo[5]=="O"&&xo[8]=="O")||(xo[0]=="O"&&xo[4]=="O"&&xo[8]=="O")||(xo[2]=="O"&&xo[4]=="O"&&xo[6]=="O")){
    showResult("O Win");
    
    }
    else if(xo[0]!=""&&xo[1]!=""&&xo[2]!=""&&xo[3]!=""&&xo[4]!=""&&xo[5]!=""&&xo[6]!=""&&xo[7]!=""&&xo[8]!=""){
      showResult("Deuce");
      
    }
   
  }
  void botPlay() async{
    var ran = await Random();
    int index = await ran.nextInt(8);
    if(xo[index]!=""){
      botPlay();
    }
    else{
      setState(() {
                       xo[index] =status;
                       status == "X"? status ="O" :status = "X" ;
                       checkWinBot();
                      });
    }
    
  }
   void checkWin(){
   if( (xo[0]=="X"&&xo[1]=="X"&&xo[2]=="X")||(xo[3]=="X"&&xo[4]=="X"&&xo[5]=="X")||(xo[6]=="X"&&xo[7]=="X"&&xo[8]=="X")||(xo[0]=="X"&&xo[3]=="X"&&xo[6]=="X")||(xo[1]=="X"&&xo[4]=="X"&&xo[7]=="X")||(xo[2]=="X"&&xo[5]=="X"&&xo[8]=="X")||(xo[0]=="X"&&xo[4]=="X"&&xo[8]=="X")||(xo[2]=="X"&&xo[4]=="X"&&xo[6]=="X")){
    showResult("X Win");
    
    }
    else if((xo[0]=="O"&&xo[1]=="O"&&xo[2]=="O")||(xo[3]=="O"&&xo[4]=="O"&&xo[5]=="O")||(xo[6]=="O"&&xo[7]=="O"&&xo[8]=="O")||(xo[0]=="O"&&xo[3]=="O"&&xo[6]=="O")||(xo[1]=="O"&&xo[4]=="O"&&xo[7]=="O")||(xo[2]=="O"&&xo[5]=="O"&&xo[8]=="O")||(xo[0]=="O"&&xo[4]=="O"&&xo[8]=="O")||(xo[2]=="O"&&xo[4]=="O"&&xo[6]=="O")){
    showResult("O Win");
    
    }
    else if(xo[0]!=""&&xo[1]!=""&&xo[2]!=""&&xo[3]!=""&&xo[4]!=""&&xo[5]!=""&&xo[6]!=""&&xo[7]!=""&&xo[8]!=""){
      showResult("Deuce");
      
    }
    else{
      botPlay();
    }
  }
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("XO"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child:InkWell(child:Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(color: Color(0xFF000000),
                          border: Border.all(color: Color(0xFF589878))),
                      child:Center(child: Text(xo[0],textAlign: TextAlign.center,style: TextStyle(fontSize: 150,color: xo[0]=="X"?Colors.red:Colors.green),),) ,
                    ) ,onTap:xo[0]==""? (){
                      setState(() {
                       xo[0] =status;
                       status == "X"? status ="O" :status = "X" ;
                       checkWin();
                      });
                    }:null,) ,
                  ),
                   Expanded(
                    flex: 1,
                    child:InkWell(child:Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(color: Color(0xFF000000),
                          border: Border.all(color: Color(0xFF589878))),
                      child:Center(child: Text(xo[1],textAlign: TextAlign.center,style: TextStyle(fontSize: 150,color: xo[1]=="X"?Colors.red:Colors.green),),) ,
                    ) ,onTap:xo[1]==""? (){
                      setState(() {
                       xo[1] =status;
                       status == "X"? status ="O" :status = "X" ;
                       checkWin();
                      });
                    }:null,) ,
                  ),
                   Expanded(
                    flex: 1,
                    child:InkWell(child:Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(color: Color(0xFF000000),
                          border: Border.all(color: Color(0xFF589878))),
                      child:Center(child: Text(xo[2],textAlign: TextAlign.center,style: TextStyle(fontSize: 150,color: xo[2]=="X"?Colors.red:Colors.green),),) ,
                    ) ,onTap:xo[2]==""? (){
                      setState(() {
                       xo[2] =status;
                       status == "X"? status ="O" :status = "X" ;
                       checkWin();
                      });
                    }:null,) ,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                   Expanded(
                    flex: 1,
                    child:InkWell(child:Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(color: Color(0xFF000000),
                          border: Border.all(color: Color(0xFF589878))),
                      child:Center(child: Text(xo[3],textAlign: TextAlign.center,style: TextStyle(fontSize: 150,color: xo[3]=="X"?Colors.red:Colors.green),),) ,
                    ) ,onTap:xo[3]==""? (){
                      setState(() {
                       xo[3] =status;
                       status == "X"? status ="O" :status = "X" ;
                       checkWin();
                      });
                    }:null,) ,
                  ),
                   Expanded(
                    flex: 1,
                    child:InkWell(child:Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(color: Color(0xFF000000),
                          border: Border.all(color: Color(0xFF589878))),
                      child:Center(child: Text(xo[4],textAlign: TextAlign.center,style: TextStyle(fontSize: 150,color: xo[4]=="X"?Colors.red:Colors.green),),) ,
                    ) ,onTap:xo[4]==""? (){
                      setState(() {
                       xo[4] =status;
                       status == "X"? status ="O" :status = "X" ;
                       checkWin();
                      });
                    }:null,) ,
                  ),
                   Expanded(
                    flex: 1,
                    child:InkWell(child:Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(color: Color(0xFF000000),
                          border: Border.all(color: Color(0xFF589878))),
                      child:Center(child: Text(xo[5],textAlign: TextAlign.center,style: TextStyle(fontSize: 150,color: xo[5]=="X"?Colors.red:Colors.green),),) ,
                    ) ,onTap:xo[5]==""? (){
                      setState(() {
                       xo[5] =status;
                       status == "X"? status ="O" :status = "X" ;
                       checkWin();
                      });
                    }:null,) ,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child:InkWell(child:Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(color: Color(0xFF000000),
                          border: Border.all(color: Color(0xFF589878))),
                      child:Center(child: Text(xo[6],textAlign: TextAlign.center,style: TextStyle(fontSize: 150,color: xo[6]=="X"?Colors.red:Colors.green),),) ,
                    ) ,onTap:xo[6]==""? (){
                      setState(() {
                       xo[6] =status;
                       status == "X"? status ="O" :status = "X" ;
                       checkWin();
                      });
                    }:null,) ,
                  ),
                   Expanded(
                    flex: 1,
                    child:InkWell(child:Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(color: Color(0xFF000000),
                          border: Border.all(color: Color(0xFF589878))),
                      child:Center(child: Text(xo[7],textAlign: TextAlign.center,style: TextStyle(fontSize: 150,color: xo[7]=="X"?Colors.red:Colors.green),),) ,
                    ) ,onTap:xo[7]==""? (){
                      setState(() {
                       xo[7] =status;
                       status == "X"? status ="O" :status = "X" ;
                       checkWin();
                      });
                    }:null,) ,
                  ),
                   Expanded(
                    flex: 1,
                    child:InkWell(child:Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(color: Color(0xFF000000),
                          border: Border.all(color: Color(0xFF589878))),
                      child:Center(child: Text(xo[8],textAlign: TextAlign.center,style: TextStyle(fontSize: 150,color: xo[8]=="X"?Colors.red:Colors.green),),) ,
                    ) ,onTap:xo[8]==""? (){
                      setState(() {
                       xo[8] =status;
                       status == "X"? status ="O" :status = "X" ;
                       checkWin();
                      });
                    }:null,) ,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}