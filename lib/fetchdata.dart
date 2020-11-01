import 'dart:convert';

import 'package:covid19_dashboard/dataprovider.dart';

import 'package:http/http.dart' as http;


Future<Map<String,dynamic>> fetchdata()async{
    final responce = await http.get('https://api.covid19api.com/summary');
    
    final body = jsonDecode(responce.body);

    final Globalobject globalobject = Globalobject.fromJson(body['Global']);

    print(globalobject.totalcases.toString());


    List<Country>  countryobjectslist = body['Countries'].map<Country>((countrymap)=>
    
      Country.fromJson(countrymap)
    ).toList();

    print(countryobjectslist[2].name);

    return {
      'globalobject':globalobject,
      'countryobjectlist': countryobjectslist,

    };
}

