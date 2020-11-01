import 'package:flutter/material.dart';

TextStyle gettextstyle(Color color){

  return TextStyle(
    fontSize: 20.0,fontWeight: FontWeight.w700,color: color
  );
}

BoxShadow getboxshadow(Color color){

  return BoxShadow(offset: Offset(0, 5.0),
  
  blurRadius: 5.0,
  color: color
  );
}



  // Container CasesContainer({String cases,String type,Color color,Color boxShadow}) {
  //   return Container(
  //                         height: 50.0,
                         
  //                         padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 4.0),
  //                         decoration: BoxDecoration(
  //                    color:  Colors.white54,
  //                    borderRadius: BorderRadius.circular(12.0),
  //                    boxShadow: [
  //                    getboxshadow(boxShadow)
  //                  ]
                     
  //                         ),
  //                       child:RichText(text: TextSpan(
  //                         children: [
  //                           TextSpan(text: '$type\n',style: TextStyle(color: Colors.black,fontSize: 12.0)),
  //                           TextSpan(text: '$cases',style: gettextstyle(color))
  //                         ]
  //                       )),
  //                     );
  // }

  class Doughnotchart{
  
  Doughnotchart(this.year, this.cases,this.color);
  final String year;
  final double cases; 
  final Color color;
  
  }



  
// double getmeink(String number){
    

//         try {
//           if(number != '0'){
            
//               if(number.length<=3){
           
//                 return double.tryParse((int.parse(number)/100000).toStringAsFixed(2));
//               } else{
//                 final cases = double.parse(number.substring(0,number.length-1));
          
//                 if(number.substring(number.length-1).toLowerCase()=='k'){

//                   return double.tryParse((cases/1000).toStringAsFixed(2));
//                 } else if(number.substring(number.length-1).toLowerCase()=='m'){
//                       return cases.toDouble(); 
//                 } else{
//                   return double.tryParse((cases.toDouble()/100000).toStringAsFixed(2));
//                 }
//               }
              
//         } else{
//           return 0.0;
//         }
//         } catch (e) {
         
//           return 0.0;
//         }
        
        
// }

