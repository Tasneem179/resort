import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:resort/custom_text.dart';

import 'custom_app.dart';
class Rooms extends StatefulWidget {
   Rooms({Key? key,required this.Checkin,required this.Checkout,this.adults,this.children,this.extras,this.View}) : super(key: key);
  DateTime Checkin=DateTime.now();
  DateTime Checkout=DateTime.now();
  String? adults="";
  String? children="";
  List<String>? extras=[];
  String ?View="";
  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  bool _SingleExpanded=false;
  bool _doubleExpanded=false;
  bool _SuiteExpanded=false;
  bool single=false;
  bool double=false;
  bool suite=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          child: CustomAppBar(), preferredSize: Size.fromHeight(50),
      ),
      body: ListView(
        children:[
          ExpansionPanelList(children: [ExpansionPanel(headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset("images/single.jpg",width: 100,height: 100,),
                  SizedBox(width: 20,),
                  NewText(string: "Single Room"),
                  Switch(activeColor: Colors.blue,value: single, onChanged: (bool val){
                    setState(() {
                      single=val;
                      double=false;
                      suite=false;

                    });
                  }),
                ],
              ),
            );
          }, body:Padding(
            padding: const EdgeInsets.all(8.0),
            child: (Row(
              children: [Expanded(
                flex: 1,
                child: RatingBar.builder(
                  itemSize: 15,
                  initialRating: 4,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 0.0005),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
                SizedBox(width: 10,),
                Expanded(flex:2,child: NewText(string: "single room for one person"))],
            )),
          ),
            isExpanded: _SingleExpanded,
            canTapOnHeader: true,),],dividerColor: Colors.grey,
            expansionCallback: (panelIndex, isExpanded) {
              _SingleExpanded = !_SingleExpanded;
              setState(() {

              });},),
          ExpansionPanelList(children: [ExpansionPanel(headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset("images/double.jpg",width: 100,height: 100,),
                  SizedBox(width: 20,),
                  NewText(string: "Double Room"),
                  Switch(activeColor: Colors.blue,value: double, onChanged: (bool val){
                    setState(() {
                      single=false;
                      double=val;
                      suite=false;

                    });
                  }),
                ],
              ),
            );
          }, body:Padding(
            padding: const EdgeInsets.all(8.0),
            child: (Row(
              children: [Expanded(
                flex: 1,
                child: RatingBar.builder(
                  itemSize: 15,
                  initialRating: 4,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 0.0005),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {

                  },
                ),
              ),
                SizedBox(width: 10,),
                Expanded(flex:2,child: NewText(string: "Double room for one or two  persons"))],
            )),
          ),
            isExpanded: _doubleExpanded,
            canTapOnHeader: true,),],dividerColor: Colors.grey,
            expansionCallback: (panelIndex, isExpanded) {
              _doubleExpanded = !_doubleExpanded;
              setState(() {

              });},),
          ExpansionPanelList(children: [ExpansionPanel(headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset("images/suite.jpg",width: 100,height: 100,),
                  SizedBox(width: 20,),
                  NewText(string: "Suite Room"),
                  Switch(activeColor: Colors.blue,value: suite, onChanged: (bool val){
                    setState(() {
                      single=false;
                      double=false;
                      suite=val;
                    });
                  }),
                ],
              ),
            );
          }, body:Padding(
            padding: const EdgeInsets.all(8.0),
            child: (Row(
              children: [Expanded(
                flex: 1,
                child: RatingBar.builder(
                  itemSize: 15,
                  initialRating: 4,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 0.0005),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                  },
                ),
              ),
                SizedBox(width: 10,),
                Expanded(flex:2,child: NewText(string: "Suite room for one or two  persons"))],
            )),
          ),
            isExpanded: _SuiteExpanded,
            canTapOnHeader: true,),],dividerColor: Colors.grey,
            expansionCallback: (panelIndex, isExpanded) {
              _SuiteExpanded = !_SuiteExpanded;
              setState(() {

              });},),

          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  showDialogMessage(context);
                },
                child: Text(
                  "Book Now!",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(50, 25),
                  primary: Colors.cyan
                ),
              ),
            ),
          )
        ]

      ),
    );
  }
  void showDialogMessage(BuildContext context)
  {
    var alertDialog=AlertDialog(
      title: Text("Are you sure you want to proceed in checking out?",style: TextStyle(fontWeight: FontWeight.bold),),
      content:Text(
          """This is a confirmation message that you agree on all data you entered:
        
         Check-in Date:${widget.Checkin.year}-${widget.Checkin.month}-${widget.Checkin.day} 
         Check-out Date:${widget.Checkout.year}-${widget.Checkout.month}-${widget.Checkout.day}
         Number of Adults:${widget.adults}
         Number of Children:${widget.children}
         Extras:${widget.extras}
         View:${widget.View}
         Chosen Room:${ChosenRoom().toString()}
          """
      ),
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
          print('Thanks');
        }, child: Text('Confirm',style: TextStyle(color: Colors.white),)),

        ElevatedButton(onPressed: (){
          Navigator.pop(context);
          print('Thanks');
        }, child: Text('Discard',style: TextStyle(color: Colors.white),)),
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }

  String ChosenRoom()
  {
    if(single)
      return"Single";
    else if (double)
      return "Double";
    else
      return"Suite";
  }
}
