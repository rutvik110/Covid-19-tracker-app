import 'package:covid19_dashboard/functions.dart';
import 'package:flutter/material.dart';




class Globalobject {

  Globalobject({
        this.totalcases,
        this.active,
        this.recovered,
        this.deaths,
        this.name,
        this.newconfirmed,
        this.newdeaths,
        this.newrecovered
     
    });

    String totalcases;
    String active;
    String recovered;
    String deaths;
    String name = 'Global';
    String newconfirmed;
    String newrecovered;
    String newdeaths;
    

    factory Globalobject.fromJson(Map<String, dynamic> countrymap) => Globalobject(
        totalcases: countrymap["TotalConfirmed"] == null ? null : formatnumber(countrymap["TotalConfirmed"]) ,
        active: formatnumber(countrymap["TotalConfirmed"] - countrymap["TotalRecovered"]-countrymap["TotalDeaths"]),
        recovered: countrymap["TotalRecovered"] == null ? null : formatnumber(countrymap["TotalRecovered"]),
        deaths: countrymap["TotalDeaths"] == null ? null :formatnumber(countrymap["TotalDeaths"]),
        name:'Global',
        newconfirmed: countrymap["NewConfirmed"] == null ? null :formatnumber(countrymap["NewConfirmed"]),
        newrecovered: countrymap["NewRecovered"] == null ? null :formatnumber(countrymap["NewRecovered"]),
        newdeaths: countrymap["NewDeaths"] == null ? null :formatnumber(countrymap["NewDeaths"])
        
       
    );

    



}





class Country {
    Country({
        this.totalcases,
        this.active,
        this.recovered,
        this.deaths,
        this.name,
        this.newconfirmed,
        this.newdeaths,
        this.newrecovered
     
    });

    String totalcases;
    String active;
    String recovered;
    String deaths;
    String name;
   String newconfirmed;
   String newrecovered;
   String newdeaths;
    

    factory Country.fromJson(Map<String, dynamic> countrymap) => Country(
        totalcases: countrymap["TotalConfirmed"] == null ? null : formatnumber(countrymap["TotalConfirmed"]),
        active: formatnumber(countrymap["TotalConfirmed"] - countrymap["TotalRecovered"]-countrymap["TotalDeaths"]),
        recovered: countrymap["TotalRecovered"] == null ? null : formatnumber(countrymap["TotalRecovered"]),
        deaths: countrymap["TotalDeaths"] == null ? null :formatnumber(countrymap["TotalDeaths"]),
        name: countrymap["Country"] == null ? null : countrymap["Country"],
        newconfirmed: countrymap["NewConfirmed"] == null ? null :formatnumber(countrymap["NewConfirmed"]),
        newrecovered: countrymap["NewRecovered"] == null ? null :formatnumber(countrymap["NewRecovered"]),
        newdeaths: countrymap["NewDeaths"] == null ? null :formatnumber(countrymap["NewDeaths"])
       
    );

    
}


class Globalobjectproviderclass with ChangeNotifier{

  Globalobject globalobject;
  Globalobjectproviderclass({this.globalobject});

  Globalobject get getobject =>this.globalobject;

  void setobject(Globalobject go){
        globalobject = go;
        notifyListeners();
  }

  

}

class Countrylist with ChangeNotifier{

  List<Country> countrylist;
  List<Country> searchlist;
  String searchquery;
  Countrylist({this.countrylist,this.searchlist,this.searchquery });

  List<Country> get getobjectlist =>countrylist;
  List<Country> get getquerylist => searchlist;
  // String get getsearchquery => searchquery;
  void setobjectlist(List<Country> go){
        countrylist = go;
        searchlist = go;
        notifyListeners();
  }

  void  setquerylist([List<Country> newlist]) {
          // print(query);
          searchlist = newlist;
          
          
          
          notifyListeners();
   
    } 

   




  

}

//Providers for comparometer countries

class Firstcountry with ChangeNotifier{

  Country firstcountry;

  Firstcountry({this.firstcountry});

  Country get getfirstcountry => firstcountry;

  void setnewcountry(Country newcountry){
        print('set 1st');
        firstcountry = newcountry;
        notifyListeners();
  }

}


class Secondcountry with ChangeNotifier{

  Country secondcountry;

  Secondcountry({this.secondcountry});

  Country get getsecondcountry => secondcountry;

  void setnewcountry(Country newcountry){
        print('set 2nd');
        secondcountry = newcountry;
        notifyListeners();
  }

}

class Doughnotchart{
  
  Doughnotchart(this.year, this.cases,this.color);
  final String year;
  final double cases; 
  final Color color;
  
  }