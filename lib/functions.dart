
  
import 'package:intl/intl.dart';

double getmeink(String number){
    

        try {
          if(number != '0'){
            
              if(number.length<=3){
           
                return double.tryParse((int.parse(number)/100000).toStringAsFixed(2));
              } else{
                final cases = double.parse(number.substring(0,number.length-1));
          
                if(number.substring(number.length-1).toLowerCase()=='k'){

                  return double.tryParse((cases/1000).toStringAsFixed(2));
                } else if(number.substring(number.length-1).toLowerCase()=='m'){
                      return cases.toDouble(); 
                } else{
                  return double.tryParse((cases.toDouble()/100000).toStringAsFixed(2));
                }
              }
              
        } else{
          return 0.0;
        }
        } catch (e) {
         
          return 0.0;
        }
        
        
}

String formatnumber(int number){

  return NumberFormat.compact().format(number);
}
