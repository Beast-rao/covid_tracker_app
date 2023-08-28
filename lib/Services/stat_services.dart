

import 'dart:convert';

import 'package:covid_tracker/Services/Utilities/api_url.dart';

import '../Model/CovidWorldStats.dart';
import 'package:http/http.dart' as http;

// here we are doing api call for world stats of the corona as we know that it is json object so this is how we do that
class StatsServices{

  Future<CovidWorldStats> covidWorldStatsRecord()async{

    final response = await http.get(Uri.parse(ApiUrl.statApiUrl));
    if(response.statusCode==200){
      var data= jsonDecode(response.body);
      return CovidWorldStats.fromJson(data);

    }else{
      throw Exception("Error in loading ");

    }

  }

  Future<List<dynamic>> covidCountriesList()async{
    var data;
    final response = await http.get(Uri.parse(ApiUrl.countriesApiUrl));
    if(response.statusCode==200){
       data= jsonDecode(response.body);
      return data;

    }else{
      throw Exception("Error in loading ");

    }

  }


}