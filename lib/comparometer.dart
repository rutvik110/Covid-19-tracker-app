import 'package:covid19_dashboard/components.dart';
import 'package:covid19_dashboard/functions.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:covid19_dashboard/comparometercomponents.dart';
import 'package:covid19_dashboard/dataprovidernmodels.dart';

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
  //Countries selection row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //select first country
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
//Tabs section
          Container(
            height: 530.0,
           
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
                      child: Text('Bar graph'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Circular chart'),
                    ),
                   
                  ]),

                  body: TabBarView(children: [
                   
                    //bar graph
                    Comparebargraph(firstcountrydata: firstcountrydata, secondcountrydata: secondcountrydata),
              ///doughnots graph
                Container(
                  color: Colors.blue[50],
                  child: Column(
                    children: [

                      //circularcharts row
                      Circularchartrow(firstcountry: firstcountry, secondcountry: secondcountry),
                      
                      Row(
                        children: [

                          //firstcountrydatacolumn
                          Firstcountrydatacolumn(firstcountry: firstcountry),


                      //2nd column 
                      Secondcountrydatastatus(secondcountry: secondcountry)
                        ],
                      ),

                      
                    ],
                  ),
                ),
              
               
             
              ]), 
              )
              
              ),
          ),
        
        ],
        
      ),
    );
  }
}
