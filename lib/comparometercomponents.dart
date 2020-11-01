import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:covid19_dashboard/dataprovidernmodels.dart';

import 'package:covid19_dashboard/components.dart';



class Comparebargraph extends StatelessWidget {
  const Comparebargraph({
    Key key,
    @required this.firstcountrydata,
    @required this.secondcountrydata,
  }) : super(key: key);

  final List<Comparechart> firstcountrydata;
  final List<Comparechart> secondcountrydata;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    backgroundColor: Colors.blue[50],
                    primaryYAxis: NumericAxis(
                      // desiredIntervals: 5,
                      labelFormat: '{value}M',
                      
                      // minimum: 0,
                      // maximum: 10,
                      title: AxisTitle(
                        text: 'Cases in millions'
                      )
                    ),
                    
                    series: <CartesianSeries>[
                        ColumnSeries<Comparechart, String>(
                            dataSource: firstcountrydata,
                            color:Colors.blue,
                          
                            dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              
                              
                              labelPosition: ChartDataLabelPosition.outside
                            ),
                            xValueMapper: (Comparechart data, _) => data.type,
                            yValueMapper: (Comparechart data, _) => data.cases
                        ),
                        ColumnSeries<Comparechart, String>(
                            dataSource: secondcountrydata ,
                             color:Colors.red,
                             dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              labelPosition: ChartDataLabelPosition.outside
                            ),
                            xValueMapper: (Comparechart data, _) => data.type,
                            yValueMapper: (Comparechart data, _) => data.cases
                        ),
                       
                    ]
                );
  }
}




class Circularchartrow extends StatelessWidget {
  const Circularchartrow({
    Key key,
    @required this.firstcountry,
    @required this.secondcountry,
  }) : super(key: key);

  final Country firstcountry;
  final Country secondcountry;

  @override
  Widget build(BuildContext context) {
    return Row(
     
      children: [
        Expanded(
                                child: Countrystatus(
            
                  totalcases: firstcountry.totalcases,
                  active: firstcountry.active,
                  recovered: firstcountry.recovered,
                  deaths: firstcountry.deaths,
                  shownumbers: false,
                  showlegend: false,
                  radius: '80',
                  title: firstcountry.name,
                  ),
        ),
       

       Expanded(
                  child: Countrystatus(
            
                  totalcases: secondcountry.totalcases,
                  active: secondcountry.active,
                  recovered: secondcountry.recovered,
                  deaths: secondcountry.deaths,
                  shownumbers: false,
                  showlegend: false,
                  radius: '80',
                  title: secondcountry.name,
                  ),
       ),         
      ],
    );
  }
}





class Firstcountrydatacolumn extends StatelessWidget {
  const Firstcountrydatacolumn({
    Key key,
    @required this.firstcountry,
  }) : super(key: key);

  final Country firstcountry;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(
                        children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         SizedBox(width: 10.0,),
        Expanded(
                                        child: CasesContainer(
                            type: 'Total Cases',
                                cases: firstcountry.totalcases,
                                color:Colors.blueAccent,
                                boxShadow:Colors.blue[100]
                          ),
        ),
         SizedBox(width: 10.0,),

    Expanded(
                                child: CasesContainer(
                            type: 'Active ',
                                cases: firstcountry.active,
                                color:Colors.orangeAccent[700],
                                boxShadow:Colors.orange[100]
                          ),
    ), 
     SizedBox(width: 10.0,),
      ],
    ),
    SizedBox(height: 10.0,),

    Row(
      children: [
           SizedBox(width: 10.0,),
    Expanded(
                                child: CasesContainer(
                            type: 'Recovered',
                                cases: firstcountry.recovered,
                                color:Colors.greenAccent[700],
                                boxShadow:Colors.green[100]
                          ),
    ),  
     SizedBox(width: 10.0,), 

    Expanded(
                                  child: CasesContainer(
                            type: 'Deaths',
                                cases: firstcountry.deaths,
                                color:Colors.redAccent,
                                boxShadow:Colors.red[100]
                          ),
     ), 
      SizedBox(width: 10.0,),
      ],
    ),//2nd row

    Wrap(
          children: [
            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.arrow_upward_rounded,size: 17.0,color: Colors.blueAccent[700],), label: Text(firstcountry.newconfirmed,style: TextStyle(
              color: Colors.blueAccent[700]
            ),)),

            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.arrow_upward_rounded,size: 17.0,color: Colors.greenAccent[700],), label: Text(firstcountry.newrecovered,style: TextStyle(
              color: Colors.greenAccent[700]
            ),)),

            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.arrow_upward_rounded,size: 17.0,color: Colors.redAccent[700],), label: Text(firstcountry.newdeaths,style: TextStyle(
              color: Colors.redAccent
            ),))
          ],
        )


    
                                 
                        ],
                      ));
  }
}




class Secondcountrydatastatus extends StatelessWidget {
  const Secondcountrydatastatus({
    Key key,
    @required this.secondcountry,
  }) : super(key: key);

  final Country secondcountry;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             SizedBox(width: 10.0,),
             
            Expanded(
                                            child: CasesContainer(
                                type: 'Total Cases',
                                    cases: secondcountry.totalcases,
                                    color:Colors.blueAccent,
                                    boxShadow:Colors.blue[100]
                              ),
            ),
             SizedBox(width: 10.0,),

        Expanded(
                                    child: CasesContainer(
                                type: 'Active ',
                                    cases: secondcountry.active,
                                    color:Colors.orangeAccent[700],
                                    boxShadow:Colors.orange[100]
                              ),
        ), 
         SizedBox(width: 10.0,),
          ],
        ),
        SizedBox(height: 10.0,),

        Row(
          children: [
               SizedBox(width: 10.0,),
        Expanded(
                                    child: CasesContainer(
                                type: 'Recovered',
                                    cases: secondcountry.recovered,
                                    color:Colors.greenAccent[700],
                                    boxShadow:Colors.green[100]
                              ),
        ),  
         SizedBox(width: 10.0,), 

        Expanded(
                                      child: CasesContainer(
                                type: 'Deaths',
                                    cases: secondcountry.deaths,
                                    color:Colors.redAccent,
                                    boxShadow:Colors.red[100]
                              ),
         ), 
          SizedBox(width: 10.0,),
        
          
          ],
        ),
        
        //2nd row
        // newcasesrow(secondcountry)
        Wrap(
          children: [

            FlatButton.icon(
              
              onPressed: (){}, icon: Icon(Icons.arrow_upward_rounded,size: 17.0,color: Colors.blueAccent[700],), label: Text(secondcountry.newconfirmed,style: TextStyle(
              color: Colors.blueAccent[700]
            ),)),

            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.arrow_upward_rounded,size: 17.0,color: Colors.greenAccent[700],), label: Text(secondcountry.newrecovered,style: TextStyle(
              color: Colors.greenAccent[700]
            ),)),

            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.arrow_upward_rounded,size: 17.0,color: Colors.redAccent[700],), label: Text(secondcountry.newdeaths,style: TextStyle(
              color: Colors.redAccent
            ),))
          ],
        )
                                     
      ],
    ));
  }
}



