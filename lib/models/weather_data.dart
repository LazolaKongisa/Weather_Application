import 'package:flutter/foundation.dart';

import 'dart:convert';
import 'package:http/http.dart';

class WeatherData with ChangeNotifier {
  
  Map<String, dynamic> _map = {};

  bool _error = false;

  String _errorMessage = "";

  Map<String,dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchData async {
    final response = await get(Uri.parse('https://dl.dropbox.com/s/157hnn6ujl8h11s/weather.json?dl=0'),
    );

    if(response.statusCode == 200)
    {
      try
      {
        _map = jsonDecode(response.body);
        _error = false;


      }
      catch(e)
      {
        _error = true;
        _errorMessage = e.toString();
        _map = {};


      }

    }
    else
    {
      _error = true;
      _errorMessage = 'Error, possible internet connection problem';
      _map = {};
    }
    notifyListeners();
  }

  


void initialValues()
{
  _map = {};
  _error = false;
  _errorMessage = '';
  notifyListeners();

}


 


}

