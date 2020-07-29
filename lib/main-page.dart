import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime time = DateTime.now();
  String dob = "";
  int ageYears = 0;
  int ageMonths = 0;
  int ageDays = 0;
  int nextBirthdayMonth = 0;
  int nextBirthdayDate = 0;
  static List<String> weekDay = [
    "day",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  String nextBirthdayWeekday = weekDay[0];

  void getDOB(DateTime value) {
    // print(DateFormat('dd-MM-yyyy').format(value));
    // print(value);
    setState(() {
      time = value;
      dob = DateFormat('dd MMMM, yyyy').format(time);
      DateTime datetimenow = DateTime.now();
      // int ageinDays = datetimenow.difference(time).inDays;
      // print(ageinDays);
      // ageYears = (ageinDays / 365).floor();
      ageYears = datetimenow.year - time.year;
      ageMonths = datetimenow.month - time.month;
      if (ageMonths < 0) {
        ageMonths += 12;
        ageYears--;
      }
      ageDays = datetimenow.day - value.day;
      DateTime upcomingBirthday = time.month < datetimenow.month
          ? DateTime(datetimenow.year + 1, time.month, time.day)
          : DateTime(datetimenow.year, time.month, time.day);
      print(upcomingBirthday);
      // int diff = upcomingBirthday.difference(time).inDays;
      // print(diff);
      nextBirthdayMonth = upcomingBirthday.month - datetimenow.month;

      if (nextBirthdayMonth < 0) nextBirthdayMonth += 12;
      // nextBirthdayMonth = (diff / 3600).floor();
      nextBirthdayDate = (upcomingBirthday.day - datetimenow.day) + 1;
      // nextBirthdayDate = diff % 30;
      if (nextBirthdayDate < 0) {
        nextBirthdayDate += 30;
        nextBirthdayMonth--;
      }
      print(upcomingBirthday.weekday);

      nextBirthdayWeekday = weekDay[upcomingBirthday.weekday];

      // print(nextBirthdayMonth);
      // ageMonths = (ageMonths / 30) as int;
      // ageYears = (ageYears / 365) as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Age Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 150.0,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.tealAccent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Age",
                        style: TextStyle(fontSize: 32.0),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "$ageYears ",
                            style: TextStyle(
                                fontSize: 52.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "years",
                            style: TextStyle(fontSize: 24.0),
                          )
                        ],
                      ),
                      Text(
                        "$ageMonths months & $ageDays days",
                      ),
                    ],
                  ),
                  Container(
                    width: 1.0,
                    height: double.infinity,
                    color: Colors.teal,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Next Birthday",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Icon(
                        Icons.cake,
                        size: 36.0,
                      ),
                      Text(
                        "$nextBirthdayWeekday",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                          "$nextBirthdayMonth months & $nextBirthdayDate days"),
                    ],
                  )
                ],
              ),
            ),
            Text(
              "$dob",
              style: TextStyle(fontSize: 22.0, color: Colors.teal),
            ),
            RaisedButton(
              child: Text("Select date of birth"),
              color: Colors.tealAccent,
              onPressed: () => showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2050),
                cancelText: "Go Back",
                confirmText: "Okay",
                helpText: "SELECT YOUR BIRTHDATE",
              ).then((value) => getDOB(value)),
            ),
          ],
        ),
      ),
    );
  }
}
