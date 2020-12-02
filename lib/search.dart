import 'package:covid19_dashboard/components.dart';
import 'package:covid19_dashboard/dataprovidernmodels.dart';
import 'package:covid19_dashboard/functions.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {

  TextEditingController _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final countrylist = Provider.of<Countrylist>(context);

    List<Country> countryobjectlist = countrylist.getquerylist;
    // List<Country>  searchlist = countryobjectlist;
    
    

    
    return Container(
     
      child: Column(
        children: [
          Container(
           margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
           padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0), 
             
             height: 80.0,
             
             decoration: BoxDecoration(
               color: Colors.blue[800],
         
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
       Flexible(child: Container(
         width: 300.0,
         child: TextField(
           controller: _textEditingController,
           style: TextStyle(
             color: Colors.white
           ),
           decoration: InputDecoration(
             labelText: 'Country',
             labelStyle: TextStyle(
               color: Colors.white
             ),
             suffixIcon:Padding(
               padding: const EdgeInsets.only(right: 20.0),
               child: Icon(Icons.search,color: Colors.white,),
             ),
             disabledBorder: OutlineInputBorder(
               
             ),
             enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
               borderSide: BorderSide(
                 color: Colors.white
               )
             ),
              focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
               borderSide: BorderSide(
                 color: Colors.white
               )
             ),
             
              border:OutlineInputBorder(
                borderSide: BorderSide(
                 color: Colors.white
               ),
                
                borderRadius: BorderRadius.all(Radius.circular(40.0))
              )
           ),
           onChanged: (String query){

                // countrylist.setquerylist(query);
            //  print(_textEditingController.text);
              
              
            //   countrylist.setobjectlist(countryobjectlist);
              List<Country> querylist = countrylist.getobjectlist.where((element) => element.name.toLowerCase().startsWith(query.toLowerCase())).toList();
                 
              countrylist.setquerylist(querylist);
           
              // countrylist.setsearchquery(query);

              
           },
         ))),
      //  IconButton(
       
      //    icon: Icon(Icons.search), onPressed: (){
       
      //  })
               ],
             ),
           ),

           Expanded(
             
             child:ListView.builder(
               itemCount: countryobjectlist.length,
               itemBuilder:(context,index){

                 return Column(
                   children: [
                     ListTile(
                      //  leading: CircleAvatar(backgroundColor: Colors.amber),
                       title: Text(countryobjectlist[index].name,style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.w600,
                         
                         
                       ),),
                       trailing: Text(countryobjectlist[index].totalcases,style: TextStyle(
                         fontSize: 18.0,
                         fontWeight: FontWeight.w600,
                         color: Colors.blue[700]
                       )),
                       enabled: true,
                       tileColor: Colors.white54,
                       onTap: (){
                         print('wawadawdaw dwadawd');

                         Navigator.push(context, MaterialPageRoute(builder: (context){
                            return  Showcountrydata(
                              countryobject: countryobjectlist[index],
                            );
                         }));
                       },
                       ),
                     
                   ],
                 );
               })),
        ]
      ),
    );
  }
}





class Showcountrydata extends StatelessWidget {

  final Country countryobject;
  Showcountrydata({this.countryobject});
  @override
  Widget build(BuildContext context) {

    List<Doughnotchart> countrydoughnots = [
      Doughnotchart('Total Cases', getmeink(countryobject.totalcases),Colors.blueAccent),
                                    Doughnotchart('Active', getmeink(countryobject.active),Colors.orangeAccent),
                                  
                                   Doughnotchart('Recovered', getmeink(countryobject.recovered),Colors.greenAccent),
                                    Doughnotchart('Deaths', getmeink(countryobject.deaths),Colors.redAccent)
  ];
    return Scaffold(
      appBar: AppBar(
        title: Text( countryobject.name),
      ),
        body:  Container(
                            
                            
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                            
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                    /////
                                    SfCircularChart(
           
            legend:Legend(
              isVisible: true
            ) ,
           
                        series: <CircularSeries>[
                            DoughnutSeries<Doughnotchart, String>(
                              
                              legendIconType: LegendIconType.circle,
                              radius:'100',
                              
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
          SizedBox(height: 0.0),
         Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      
      SizedBox(width: 10.0),
      Expanded(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
             child: Column(
          children: [
            
              Row(
                children: [
                  Expanded(
                                              child:CasesContainer(
                                                    type: 'Total Cases',
                                                        cases: countryobject.totalcases,
                                                        color:Colors.blueAccent,
                                                        boxShadow:Colors.blue[100]
                                                  ),
                  ),
                  SizedBox(width: 10.0),
                    
                   Expanded(
                                                  child:CasesContainer(
                                                    type: 'Active ',
                                                        cases: countryobject.active,
                                                        color:Colors.orangeAccent[700],
                                                        boxShadow:Colors.orange[100]
                                                  ),
                    )
                ],
              ),
              SizedBox(height: 10.0,),

              
              Row(
                children: [
                  Expanded(
                                              child: CasesContainer(
                                                    type: 'Recovered',
                                                        cases: countryobject.recovered,
                                                        color:Colors.greenAccent[700],
                                                        boxShadow:Colors.green[100]
                                                  ),
                  ),
                  SizedBox(width: 10.0),
                    
                   Expanded(
                                                  child: CasesContainer(
                                                    type: 'Deaths',
                                                        cases: countryobject.deaths,
                                                        color:Colors.redAccent,
                                                        boxShadow:Colors.red[100]
                                                  ),
                    )
                ],
              ),
                                  ////
                                   newcasesrow(countryobject)
                                ],
                              ),
                            

    ),
    )]
    )
    ]
    )
    )
    ));
  }
}