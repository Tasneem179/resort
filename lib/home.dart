import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:resort/rooms.dart';

import 'custom_app.dart';
import 'custom_text.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime date1=DateTime.now();
  DateTime date2=DateTime.now();
  int adults=0;
  int children=0;
  List<String> extra=[];
  String view="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
              child: CustomAppBar(), preferredSize: Size.fromHeight(50)
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Image.asset("images/resort.jpg"),
              Row(
                children: [
                  NewText(
                    string:"Check-in Date:"
                  ),
                  SizedBox(width: 40,),
                  IconButton(onPressed: (){selectCheckinDate(context);}, icon: Icon(Icons.date_range)),
                  NewText(string:("${date1.year}-${date1.month}-${date1.day}"))
                ],
              ),
              Row(
                children: [
                  NewText(
                      string:"Check-out Date:"
                  ),
                  SizedBox(width: 30,),
                  IconButton(onPressed: (){selectCheckoutDate(context);}, icon: Icon(Icons.date_range)),
                  NewText(string:("${date2.year}-${date2.month}-${date2.day}"))
                ],
              ),
              Row(
                children:[
                  NewText(string: "Number of Adults:"),
                  SizedBox(width: 10,),
                  Slider(
                      min:0,
                      max: 5,
                      value: adults.toDouble(), onChanged: (value){
                    setState(() {
                      adults=value.round();
                    });
                  }),
                  NewText(string: "$adults")
                ]
               
                
              ),
              Row(
                  children:[
                    NewText(string: "Number of Children:"),
                    Slider(
                        min:0,
                        max: 5,
                        value: children.toDouble(), onChanged: (value){
                      setState(() {
                        children=value.round();
                      });
                    }),
                    NewText(string: "$children")
                  ]


              ),
              NewText(string: "Extras:"),
              CheckboxGroup(labels: <String>["Breakfast(50EGP/day)","InternWifi(50EGP/day)","Parking(100EGP/day)"],
                onSelected: (List<String>checked)=>extra=checked,
              ),
              NewText(string: "View:"),
              RadioButtonGroup(labels: <String>["Garden View","Sea View"],
                onSelected: (String selected)=>view=selected,
              ),
              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Rooms(
                  Checkin: date1,
                  Checkout: date2,
                  adults: "$adults",
                  children: "$children",
                  extras: extra,
                  View: view,
                )));
              },
                  child: Text("Check Rooms and Rates"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan
                ),
              )


              
            ],
          ),
        ),
      ),
    );
  }
  Future<Null>selectCheckinDate(BuildContext context)async{
    final DateTime? picked=await showDatePicker(
        context:context,
        initialDate:date1,
        firstDate:DateTime.now(),
        lastDate:DateTime(2023)
    );
    if(picked!=null&&picked!=date1)
    {
      setState(() {
        date1=picked;
        print(date1.toString());
      });
    }

  }
  Future<Null>selectCheckoutDate(BuildContext context)async{
    final DateTime? picked=await showDatePicker(
        context:context,
        initialDate:date1,
        firstDate:date1,
        lastDate:DateTime(2023)
    );
    if(picked!=null&&picked!=date1)
    {
      setState(() {
        date2=picked;
        print(date2.toString());
      });
    }

  }
}
