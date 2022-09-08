
import 'package:assignment_test/models/weather_data.dart';
import 'package:assignment_test/widgets/app_label.dart';
import 'package:assignment_test/widgets/current_day.dart';
import 'package:assignment_test/widgets/topbanner.dart';
import 'package:assignment_test/widgets/weathercard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<WeatherData>().fetchData;
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () async {


            
          },
      child: Center(
      
        child: Consumer<WeatherData>(
          builder: (context, value, child)
          {
            return value.map.length == 0 && !value.error ?
                  CircularProgressIndicator() : value.error ? Text('Oops, something went wrong. ${value.errorMessage}',
                  textAlign: TextAlign.center,) :
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const TopBanner(),
                      CurrentDayWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      const AppLabel(),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return WeatherCard(map: value.map['Cape Town'][index]);
                          },
                        ),
                      ),
                    ],
      );




          }
        )





      )

          
          
      ),
    );
  }
}
