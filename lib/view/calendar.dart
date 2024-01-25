import 'dart:convert';
import 'package:Psynexa/view/pay.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:grock/grock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class CalendarPage extends StatefulWidget {
  String id;
  CalendarPage({super.key, required this.id});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  String? selectedTimeSlot;
  bool? isVisible;
  bool isKey = false;

  @override
  Widget build(BuildContext context) {
    String generateRandomString(int length) {
      final random = Random();
      const characters =
          'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
      String result = '';

      for (int i = 0; i < length; i++) {
        final randomIndex = random.nextInt(characters.length);
        result += characters[randomIndex];
      }

      return result;
    }

    Future<void> fetchLogin() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      DateTime parsedDate = DateTime.parse(_selectedDay.toString());

      Map<String, dynamic> body = {
        'client': prefs.getString('id'),
        'psyc': widget.id.toString(),
        'day': DateFormat('yyyy-MM-dd').format(parsedDate),
        'time': selectedTimeSlot
      };
      String jsonData = json.encode(body);
      try {
        final response =
            await http.post(Uri.parse('${Constant.domain}/api/reservation/add'),
                headers: {
                  'Content-Type': 'application/json',
                  'x-access-token': prefs.getString("token") ??
                      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwc3ljaG9sb2dpc3QiOnsiX2lkIjoiNjVhODI2NGUyMTY0ODg0ZWYyZjc1M2E5IiwibmFtZSI6IlBzeWMgQWhtZXQiLCJzdXJOYW1lIjoiRWNldml0IiwicGFzcyI6IiQyYSQwOCR1bVpYeTU3VXFudnVmdEZ4emZCNW8uSVN1QUFzNHk5b1BBYU1uR1YwWFRzVGdwakRjZVNMUyIsImVNYWlsIjoiZWVjZXZhaEBnbWFpbC5jb20iLCJ0YWciOlsidXptYW4iXSwiaW1hZ2UiOiJpbWFnZS0xNzA1NTE4NjcwODUwLmpwZWciLCJ1bnZhbiI6ImtsaW5payBwc2lrb2xvaCIsInN0YXIiOltdLCJzdGFyQXZnIjpbXSwiYWN0aXZlIjpmYWxzZSwiYWNjQWN0aXZlIjp0cnVlLCJjcmVhdGVBdCI6IjIwMjQtMDEtMTdUMTk6MTE6MTAuODcyWiIsInVwZGF0ZUF0IjoiMjAyNC0wMS0xN1QxOToxMToxMC44NzJaIiwiX192IjowfSwiaWF0IjoxNzA1NTIwMTM1fQ.ad3WLnfmxtpnob3kSqVRZHtUZuOv8nX-CMkQHHdRth4"
                },
                body: jsonData);

        if (response.statusCode == 200) {
          final jsonResponse = json.decode(response.body);
          await Grock.to(PayPage());
        } else {}
      } catch (e) {}
    }

    return Scaffold(
      appBar: const CustomAccAppBar(
        appbarTitle: 'Randevu Detayları',
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TableCalendar(
                  rowHeight: 40,
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      fontSize: 13,
                      color: Color.fromARGB(146, 51, 51, 51),
                      fontWeight: FontWeight.w400,
                    ),
                    weekendStyle: TextStyle(
                      fontSize: 13,
                      color: Color.fromARGB(146, 51, 51, 51),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  daysOfWeekVisible: true,
                  focusedDay: _focusedDay,
                  firstDay: DateTime(2023, 5, 24, 22, 22, 56, 486, 933),
                  lastDay: DateTime(2030, 8, 24, 22, 22, 56, 486, 933),
                  calendarFormat: CalendarFormat.month,
                  locale: 'tr_TR',
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        print(selectedDay);
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Aylık',
                    CalendarFormat.week: 'Haftalık',
                  },
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: const TextStyle(
                      color: Constant.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    holidayTextStyle: const TextStyle(
                      color: Constant.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    weekendTextStyle: const TextStyle(
                      color: Constant.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    todayTextStyle: const TextStyle(
                      color: Constant.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    cellMargin:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    markerSize: 22,
                    todayDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    selectedDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Constant.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    defaultDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                    weekendDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                    holidayDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                    outsideDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                    withinRangeDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                    rangeStartDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    rangeEndDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    rangeHighlightColor: Colors.red,
                  ),
                  headerStyle: HeaderStyle(
                    leftChevronIcon: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xffF4F5F7), width: 1)),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                      ),
                    ),
                    rightChevronIcon: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xffF4F5F7), width: 1)),
                      child: const Icon(
                        Icons.chevron_right,
                        color: Colors.black,
                      ),
                    ),
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: 20,
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Constant.gray,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '09.00';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '09.00'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '09.00',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '09.00'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '11.00';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '11.00'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '11.00',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '11.00'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '13.00';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '13.00'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '13.00',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '13.00'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '15.00';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '15.00'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '15.00',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '15.00'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '09.30';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '09.30'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '09.30',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '09.30'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '11.30';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '11.30'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '11.30',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '11.30'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '13.30';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '13.30'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '13.30',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '13.30'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '15.30';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '15.30'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '15.30',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '15.30'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '10.00';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '10.00'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '10.00',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '10.00'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '12.00';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '12.00'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '12.00',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '12.00'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '14.00';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '14.00'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '14.00',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '14.00'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '16.00';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '16.00'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '16.00',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '16.00'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '10.30';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '10.30'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '10.30',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '10.30'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '12.30';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '12.30'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '12.30',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '12.30'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '14.30';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '14.30'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '14.30',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '14.30'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () async {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '16.30';
                                          isKey = true;
                                        });
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? const Color(0xFFEAEAEF)
                                  : (selectedTimeSlot == '16.30'
                                      ? Constant.purple
                                      : Constant.white),
                              border: Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              '16.30',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isVisible == true
                                    ? Colors.black.withOpacity(0.35)
                                    : selectedTimeSlot == '16.30'
                                        ? Constant.white
                                        : Constant.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  isKey ? fetchLogin() : null;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isKey ? Constant.purple : const Color(0xFFEAEAEF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  isKey ? 'Randevu Al' : 'Tarih Seç',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: isKey
                        ? Constant.white
                        : Constant.black.withOpacity(0.35),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
