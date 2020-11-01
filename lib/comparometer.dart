import 'package:covid19_dashboard/components.dart';
import 'package:covid19_dashboard/functions.dart';
import 'package:covid19_dashboard/homedashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:covid19_dashboard/dataprovider.dart';
import 'dart:math' as math;
import 'package:covid19_dashboard/stylings.dart';
class Comparometer extends StatefulWidget {
  @override
  _ComparometerState createState() => _ComparometerState();
}

class _ComparometerState extends State<Comparometer> {

  String firstC = 'India';
  String secondC = 'India';

  @override
  Widget build(BuildContext context) {
    final firstcountryprovider = Provider.of<Firstcountry>(context);
    final firstcountry = firstcountryprovider.getfirstcountry;
     final secondcountryprovider = Provider.of<Secondcountry>(context);
    final secondcountry = secondcountryprovider.getsecondcountry;
    final countrylist = Provider.of<Countrylist>(context).getobjectlist;
    
   
                List<Comparechart>  firstcountrydata = [
                Comparechart(
                  type: 'Total Cases',
                  cases: getmeink(firstcountry.totalcases)
                ),
                Comparechart(
                  type: 'Active ',
                  cases: getmeink(firstcountry.active)
                ),
                Comparechart(
                  type: 'Recovered ',
                  cases: getmeink(firstcountry.recovered)
                ),
                Comparechart(
                  type: 'Deaths',
                  cases:getmeink(firstcountry.deaths)
                ),
              ];


                List<Comparechart>  secondcountrydata = [
                Comparechart(
                  type: 'Total Cases',
                  cases: getmeink(secondcountry.totalcases).toDouble()
                ),
                Comparechart(
                  type: 'Active ',
                  cases: getmeink(secondcountry.active).toDouble()
                ),
                Comparechart(
                  type: 'Recovered ',
                  cases: getmeink(secondcountry.recovered).toDouble()
                ),
                Comparechart(
                  type: 'Deaths',
                  cases: getmeink(secondcountry.deaths).toDouble()
                ),
              ];


    return SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: Text('Compare Between Countries',style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Colors.blue[800],
              
            ),
            textAlign: TextAlign.center,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                            child: FittedBox(
                                                        child: RaisedButton.icon(
                                color: Colors.blue[200],
                                onPressed: ()async{
                                List<dynamic> countryname =  await showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context)=>AlertDialog(
                                      content: Container(
                                        child: ListView.builder(
                                          itemCount: countrylist.length,
                                          itemBuilder:(context,index){
                                            return ListTile(
                                              title: Text('${countrylist[index].name}'),
                                              onTap: (){
                                                Navigator.pop(context,[countrylist[index].name,index]);
                                              },
                                            );
                                        })
                                      ),
                                    ));

                                    setState(() {
                                      firstC = countryname[0];
                                      int index = countryname[1];
                                      firstcountryprovider.setnewcountry(countrylist[index]);
                                    });

                                    print(countryname);
                                }, icon: Icon(Icons.arrow_drop_down_rounded,color: Colors.blue[800],), label: Text(firstC,style: TextStyle(
                                  color: Colors.white
                                ),)),
                            )
              ),

                //SELECT SECOND COUNTRY
                Flexible(
                            child: FittedBox(
                                                        child: RaisedButton.icon(
                                color: Colors.red[200],
                                onPressed: ()async{
                                List<dynamic> countryname =  await showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context)=>AlertDialog(
                                      content: Container(
                                        child: ListView.builder(
                                          itemCount: countrylist.length,
                                          itemBuilder:(context,index){
                                            return ListTile(
                                              title: Text('${countrylist[index].name}'),
                                              onTap: (){
                                                Navigator.pop(context,[countrylist[index].name,index]);
                                              },
                                            );
                                        })
                                      ),
                                    ));

                                    setState(() {
                                      secondC = countryname[0];
                                      int index = countryname[1];
                                      secondcountryprovider.setnewcountry(countrylist[index]);
                                    });

                                    
                                }, icon: Icon(Icons.arrow_drop_down_rounded,color: Colors.red[800],), label: Text(secondcountry.name,style: TextStyle(
                                  color: Colors.white
                                ))),
                            )
              ),
            ],

          ),

          Container(
            height: 530.0,
            // padding: EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width,
            child: DefaultTabController(
              initialIndex: 0,
              length: 2,
              child:Scaffold(
                backgroundColor: Colors.blue[800],
                
                appBar: TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Colors.lightBlueAccent,
                  
                  
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Vertical Bar'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Circular chart'),
                    ),
                   
                  ]),

                  body: TabBarView(children: [
                   

          SfCartesianChart(
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
                      ),
  ///doughnots graph
                Container(
                  color: Colors.blue[50],
                  child: Column(
                    children: [
                      Row(
                       
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
                      ),
                      
                      Row(
                        children: [
                          Expanded(child: Column(
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
                      )),


                      //2nd column 
                      Expanded(child: Column(
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
                      ))
                        ],
                      ),//digram row

                      
                    ],
                  ),
                ),
                //3rd tab
               
             
              ]), 
              )
              
              ),
          ),
            

                      SizedBox(height:0.0),

                     

        ],
        
      ),
    );
  }
}



class Comparechart{

  String type;
  double cases;

  Comparechart({this.type,this.cases});

}
