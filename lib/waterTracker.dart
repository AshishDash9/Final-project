import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/loginscreen.dart';
import 'package:todo/widget/addWater.dart';

class Watertracker extends StatefulWidget{
  @override
  State<Watertracker > createState() => _WatertrackerState();
  

}
  
  
class _WatertrackerState extends State<Watertracker>{
  @override
  int _currentIntake = 0;
  final int _finalIntake = 2000; // Target intake in ml
  void _addWater(int ammount){
    if(_currentIntake <_finalIntake) {
      setState(() {
        _currentIntake =(_currentIntake+ammount).clamp(0, _finalIntake);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("You have reached your daily intake limit!"))
      );
    }
  }
  void _resetIntake() {
    setState(() {
      _currentIntake = 0;
    });
  }

  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.grey.shade200,

  appBar: AppBar(
    title: Text("Water Tracker" ,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
    backgroundColor: Colors.lightBlue,

  ),
     drawer: Drawer(
       child: ListView(
         padding: EdgeInsets.zero,
         children: [
           DrawerHeader(
             decoration: BoxDecoration(
               color: Colors.lightBlue,
             ),
             child: Text(
               'Water Tracker',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 24,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
           ListTile(
             leading: Icon(Icons.home),
             title: Text('Home'),
             onTap: () {
               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
             },
           ),
           ListTile(
             leading: Icon(Icons.settings),
             title: Text('Settings'),
             onTap: () {

             },
           ),
           ListTile(
             leading: Icon(Icons.info),
             title: Text('About'),
             onTap: () {
               // Add functionality if needed
             },
           ),
         ],
       ),
     ),
     bottomNavigationBar: BottomAppBar(
       color: Colors.lightBlue,
       child: Container(
         height: 50,
         child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              IconButton(
                icon: Icon(Icons.logout, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.contact_mail, color: Colors.white),
                onPressed: () {
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.message, color: Colors.white),
                onPressed: () {
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ],
         ),
       ),
     ),
     body: SingleChildScrollView(
       child: Center(
         child: Column(
           children: [
              SizedBox(height: 50,),
             Container(
               alignment: Alignment.center,
               height: 200,
               width: 200,
               margin: EdgeInsets.all(20),
               decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 7), // changes position of shadow
                    ),
                  ]
               ),
                 child:Center(
                   child: Column(
       
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       SizedBox(height: 20,),
                       Text("Todays Intake",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                       SizedBox(height: 20,),
                       Text("${_currentIntake}ml",style: TextStyle(fontSize: 20,color: Colors.blueAccent,fontWeight: FontWeight.bold),),
       
                     ],
                   ),
                 )
             ),
             Stack(
               alignment: Alignment.center,
               children: [
                 Container(
                   height: 150,
                   width: 150,
                   child: CircularProgressIndicator(
                     value: (_currentIntake / _finalIntake).clamp(0.0, 1.0),
                     strokeWidth: 10,
                     backgroundColor: _currentIntake == _finalIntake ? Colors.red : Colors.white,
                     color: _currentIntake == _finalIntake ? Colors.green : Colors.blueAccent,
                   ),
       
                 ),
                 Text("${(_currentIntake/_finalIntake)*100}%",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
       
                 SizedBox(height: 15),
       
       
               ],
             ),
             SizedBox(height: 15),
             Wrap(
                spacing: 10,
               children: [
                 addWater(amount: 200, onClick: () => _addWater(200), icon: Icons.water_drop_outlined),
                 SizedBox(height: 15),
                 addWater(amount: 300,onClick: () => _addWater(300), icon: Icons.water_drop_outlined),
                 SizedBox(height: 15),
                 addWater(amount: 100,onClick: () => _addWater(100), icon: Icons.water_drop_outlined),
       
                 SizedBox(height: 20),
       
                 SizedBox(
                   width: double.infinity,
                   child: ElevatedButton(onPressed: ()=>_resetIntake(),child: Text("Reset Intake" ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.blueAccent, width: 1.5),
                      ),
                   ),
                   ),
                 ),
       
       
               ],
             )
       
       
           ],
         ),
       ),
     ),
);
  }


}

