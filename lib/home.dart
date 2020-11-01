





import 'package:covid19_dashboard/comparometer.dart';
import 'package:covid19_dashboard/fetchdata.dart';
import 'package:covid19_dashboard/homedashboard.dart';
import 'package:covid19_dashboard/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:covid19_dashboard/dataprovider.dart';





class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int activeindex = 0;
  bool isfetching = true;
  List<Widget> tabs = [
    HomeDashboard(),
    SearchTab(),
    Comparometer(),
    // TipsTab()
  ];

  

  Globalobject globalobject ;
  List<Country> countryobjectlist;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
       fetchdata().then((value){

            
            setState(() {
                globalobject  = value['globalobject'];
                countryobjectlist  = value['countryobjectlist'];
                isfetching = false;
                
            });

        });
    
  }

  @override
  Widget build(BuildContext context) {
    
    return isfetching?Scaffold(body: Center(child: CircularProgressIndicator())) :MultiProvider(
      providers: [
        ChangeNotifierProvider<Globalobjectproviderclass>(
          
          create:(context)=> Globalobjectproviderclass(globalobject: globalobject)),

          ChangeNotifierProvider<Countrylist>(
          
          create:(context)=> Countrylist(countrylist: countryobjectlist,searchlist: countryobjectlist)),
        //setting fierst country for comparison
           ChangeNotifierProvider<Firstcountry>(
          
          create:(context)=> Firstcountry(firstcountry:countryobjectlist.singleWhere((element) => element.name.toLowerCase() =='india'))),
        //setting up second country for comparison
           ChangeNotifierProvider<Secondcountry>(
          
          create:(context)=> Secondcountry(secondcountry: Country(name: 'Select',totalcases: '0',active: '0',recovered: '0',deaths: '0',
                                                                  newconfirmed: '0',newrecovered: '0',newdeaths: '0')))
      ],
          child: SafeArea(
            child: Scaffold(
             backgroundColor:Colors.blue[50],   

          bottomNavigationBar: BottomNavigationBar(
            
            items: 
          
              [
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.dashboard,size:25.0 ,),
                  icon:Icon(Icons.dashboard),label: 'Dashboard',
                  
                  
                  ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.search,size:25.0 ,),
                  icon:Icon(Icons.search),label: 'Search'),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.compare,size:25.0 ,),
                  icon:Icon(Icons.compare),label: 'Comparometer'),
                
              ],  
              currentIndex: activeindex,
              selectedItemColor: Colors.blue[800],
              iconSize: 20.0,
              
              unselectedItemColor: Colors.grey[400],
              onTap: (index){
                setState(() {
                  activeindex = index;
                  print(index);
                });
              },
          ),  

        body: tabs.elementAt(activeindex)
          
        ),
      ),
    );
  }
}

