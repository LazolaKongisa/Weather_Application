import 'package:flutter/material.dart';

class CurrentDayWidget extends StatelessWidget {
  CurrentDayWidget({
    Key? key,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 110,
                width: 110,
                child: Image.asset('assets/images/rain.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '12\u00b0',
                style: TextStyle(fontSize: 70),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Fair',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '12\u00b0/7\u00b0',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '12kph wind',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
