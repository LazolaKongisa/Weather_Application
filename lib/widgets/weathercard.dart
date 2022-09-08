import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatelessWidget {
 const WeatherCard({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        child: SelectedColor(map: map),
      ),
    );
  }
}

class SelectedColor extends StatelessWidget {
  const SelectedColor({
    Key? key,
    required this.map,
  }) : super(key: key);

  final Map<String, dynamic> map;

  Color getColor()
  {
    DateTime date = DateTime.now();
    String newDate = DateFormat('EEEE').format(date);

    if(map['day'] == newDate)
    {

      return Color(0xFFBBDEFB);
    }
    else
    {
      return Colors.white;
    }




    
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getColor(),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Condition(map: map,),
            Row(
              children: [
                Image.asset(
                  'assets/images/humidity.png',
                  height: 20,
                  width: 20,
                ),
                Text(
                  '${map['humidity']}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Image.network(
                  '${map['condition_day']}',
                  height: 25,
                  width: 25,
                ),
                Image.network(
                  '${map['condition_night']}',
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  '${map['maxtemp']}\u00b0/${map['mintemp']}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Condition extends StatelessWidget {
 const Condition({
    Key? key,
    required this.map,
  }) : super(key: key);

  final Map<String, dynamic> map;


  String today()
  {
    String todayDate;

    DateTime date = DateTime.now();
    String newDate = DateFormat('EEEE').format(date);

    if(map['day'] == newDate)
    {

      return todayDate = 'Today';
    }
    else
    {
      return map['day'];
    }
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      today(),
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class AppData with ChangeNotifier
{
  
  String _today = 'Today';
  

  void changeData(String data)
  {
    _today = data;

    notifyListeners();
  }
  

  String get today => _today;



}

