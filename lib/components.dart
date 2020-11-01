import 'package:covid19_dashboard/dataprovider.dart';
import 'package:covid19_dashboard/functions.dart';
import 'package:covid19_dashboard/stylings.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Row newcasesrow(dynamic go ) {
    return Row(
          children: [
            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.arrow_upward_rounded,size: 17.0,color: Colors.blueAccent[700],), label: Text(go.newconfirmed,style: TextStyle(
              color: Colors.blueAccent[700]
            ),)),

            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.arrow_upward_rounded,size: 17.0,color: Colors.greenAccent[700],), label: Text(go.newrecovered,style: TextStyle(
              color: Colors.greenAccent[700]
            ),)),

            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.arrow_upward_rounded,size: 17.0,color: Colors.redAccent[700],), label: Text(go.newdeaths,style: TextStyle(
              color: Colors.redAccent
            ),))
          ],
        );
  }

Container CasesContainer({String cases,String type,Color color,Color boxShadow}) {
    return Container(
                          height: 50.0,
                         
                          padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 4.0),
                          decoration: BoxDecoration(
                     color:  Colors.white54,
                     borderRadius: BorderRadius.circular(12.0),
                     boxShadow: [
                     getboxshadow(boxShadow)
                   ]
                     
                          ),
                        child:RichText(text: TextSpan(
                          children: [
                            TextSpan(text: '$type\n',style: TextStyle(color: Colors.black,fontSize: 12.0)),
                            TextSpan(text: '$cases',style: gettextstyle(color))
                          ]
                        )),
                      );
  }



  class Countrystatus extends StatelessWidget {
   Countrystatus({
     this.active,
     this.totalcases,this.recovered,this.deaths,this.showlegend,this.shownumbers,this.radius,this.title,this.country,
    Key key,
  }) : super(key: key);
  String totalcases;
  String active;
  String recovered ;
  String deaths;
  bool showlegend;
  bool shownumbers;
  String radius;
  String title;
  Country country;
  


  @override
  Widget build(BuildContext context) {
      List<Doughnotchart> countrydoughnots = [
      Doughnotchart('Total Cases', getmeink(totalcases),Colors.blueAccent),
                                    Doughnotchart('Active', getmeink(active),Colors.orangeAccent),
                                  
                                   Doughnotchart('Recovered', getmeink(recovered),Colors.greenAccent),
                                    Doughnotchart('Deaths', getmeink(deaths),Colors.redAccent)
  ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        children: [
          Container(
            height: 250.0,
            
            child: SfCircularChart(
              
              title: ChartTitle(
                text: title
              ),
              legend:Legend(
                isVisible: showlegend
              ) ,
             
                          series: <CircularSeries>[
                              DoughnutSeries<Doughnotchart, String>(
                                
                                legendIconType: LegendIconType.circle,
                                radius:radius,
                                
                                pointColorMapper: (Doughnotchart doughnots,_) => doughnots.color,
                                
                                enableSmartLabels: true,
                                dataLabelSettings: DataLabelSettings(
                                  isVisible: false,
                                  useSeriesColor: true,
                                  textStyle: TextStyle(
                                    color: Colors.white
                                  ),
                                  labelPosition: ChartDataLabelPosition.outside
                                ),
                                  dataSource:countrydoughnots,
                                  xValueMapper: (Doughnotchart data, _) => data.year,
                                  yValueMapper: (Doughnotchart data, _) => data.cases,
                                  // Explode the segments on tap
                                  explode: true,
                                  explodeIndex: 1
                              )
                          ]
                      ),
          ),
          SizedBox(height: 0.0),
         shownumbers? Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      
      SizedBox(width: 10.0),
      Expanded(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
             child: Column(
          children: [
              //1st row
              Row(
                children: [
                  Expanded(
                                              child:CasesContainer(
                                                    type: 'Total Cases',
                                                        cases: totalcases,
                                                        color:Colors.blueAccent,
                                                        boxShadow:Colors.blue[100]
                                                  ),
                  ),
                  SizedBox(width: 10.0),
                    
                   Expanded(
                                                  child:CasesContainer(
                                                    type: 'Active ',
                                                        cases: active,
                                                        color:Colors.orangeAccent[700],
                                                        boxShadow:Colors.orange[100]
                                                  ),
                    )
                ],
              ),
              SizedBox(height: 10.0,),

              //2nd row
              Row(
                children: [
                  Expanded(
                                              child: CasesContainer(
                                                    type: 'Recovered',
                                                        cases: recovered,
                                                        color:Colors.greenAccent[700],
                                                        boxShadow:Colors.green[100]
                                                  ),
                  ),
                  SizedBox(width: 10.0),
                    
                   Expanded(
                                                  child: CasesContainer(
                                                    type: 'Deaths',
                                                        cases: deaths,
                                                        color:Colors.redAccent,
                                                        boxShadow:Colors.red[100]
                                                  ),
                    )
                ],
              ),

             newcasesrow(country)
          ],
        ),
           ),
      )
    ],
          ):Text(''),
        ],
      ),
      );
  }
}