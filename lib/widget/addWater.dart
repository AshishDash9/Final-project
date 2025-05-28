import 'package:flutter/material.dart';
class addWater extends StatelessWidget {
  final VoidCallback onClick;
  final int amount ;
  IconData ? icon;
  addWater({
    super.key, required this.amount,
    this.icon,
    required this.onClick,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon( onPressed: onClick,label:Text("+${amount}ml",style: TextStyle(fontWeight:FontWeight.w500,fontSize: 16 ,color: Colors.white),
      ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.blueAccent, width: 1.5),
          ),
        ),
        icon: Icon(icon??Icons.water_drop_outlined,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
