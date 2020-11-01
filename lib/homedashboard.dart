import 'package:covid19_dashboard/components.dart';
import 'package:covid19_dashboard/dataprovidernmodels.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';



class HomeDashboard extends StatefulWidget {
  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    final  globalobject = Provider.of<Globalobjectproviderclass>(context);
    final countryobject = Provider.of<Countrylist>(context);
    Globalobject go = globalobject.getobject;
    Country country = countryobject.getobjectlist.firstWhere((element) => element.name.toLowerCase() == 'india');
    
    return SingleChildScrollView(
                  child: Stack(
                children: [
               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
          //upper header row
          SizedBox(height: 25.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Text('Welcome To\nCovid-19 Dashboard',style: TextStyle(
              fontSize: 26.0,fontWeight: FontWeight.w600,
              color: Colors.blue[800]
            ),),

           Container(
             
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(12.0)),
                //  color: Colors.blue,
                 boxShadow: <BoxShadow>[
                   BoxShadow(
           offset: Offset(0,4.0),
           blurRadius: 8.0,
           color: Colors.red[50]
           
                   )
                 ]

             ),
             child: SvgPicture.asset('assets/icons/virus.svg',height: 50.0,width: 50.0,),
           )
          ],),
           SizedBox(height: 20.0),      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Global Status',style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600
            ),),
          ),
            SizedBox(height: 5.0),
          //row for global data showcase
          Globalrow(totalcases: go.totalcases,active: go.active,recovered: go.recovered,deaths: go.deaths   ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: newcasesrow(go),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('India Status',style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600
            ),),
          ),
          //Country status
          Countrystatus(totalcases: country.totalcases,active: country.active,recovered: country.recovered,deaths: country.deaths,
          showlegend: true,shownumbers: true,radius:'100',title: '',country:country ,
          ),
          SizedBox(height: 20.0),
                  

                  ],
                ),
         

                ]
            ),
        );
  }

 
}






class Globalrow extends StatelessWidget {
   Globalrow({
    this.totalcases,this.active,this.recovered,this.deaths,
    Key key,
  }) : super(key: key);

  String totalcases;
  String active;
  String recovered;
  String deaths;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset('assets/icons/earth-globe.svg',height: 100.0,width: 0.0),
          SizedBox(width: 10.0),
          Expanded(
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
                 child: Column(
              children: [
                  //1st row
                  Row(
                    children: [
                      Expanded(
                                                  child: CasesContainer(
                                                    type: 'Total Cases',
                                                        cases: totalcases,
                                                        color:Colors.blueAccent,
                                                        boxShadow:Colors.blue[100]
                                                  ),
                      ),
                      SizedBox(width: 10.0),
                        
                       Expanded(
                                                      child: CasesContainer(
                                                    type: 'Active',
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
                  )
              ],
            ),
               ),
          )
        ],
      ),
    );
  }

}


