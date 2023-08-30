import 'dart:convert';
import 'package:Psynexa/view/pay.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/view/base_scaffold.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grock/grock.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({super.key});

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
    return Scaffold(
      appBar: CustomAccAppBar(
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
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      fontSize: 13,
                      color: const Color.fromARGB(146, 51, 51, 51),
                      fontWeight: FontWeight.w400,
                    ),
                    weekendStyle: TextStyle(
                      fontSize: 13,
                      color: const Color.fromARGB(146, 51, 51, 51),
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
                  onPageChanged: (focusedDay) {
                    setState(() {
                      _focusedDay = focusedDay;
                    });
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Aylık',
                    CalendarFormat.week: 'Haftalık',
                  },
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(
                      color: Constant.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    holidayTextStyle: TextStyle(
                      color: Constant.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    weekendTextStyle: TextStyle(
                      color: Constant.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    cellMargin:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    markerSize: 22,
                    todayDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Constant.purple,
                    ),
                    selectedDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Constant.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    defaultDecoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    weekendDecoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    holidayDecoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    outsideDecoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    withinRangeDecoration: const BoxDecoration(
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
                SizedBox(
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
                child: Container(
                  decoration: BoxDecoration(
                    color: Constant.darkwhite,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GrockContainer(
                            onTap: () {
                              isVisible == true
                                  ? null
                                  : isVisible == true
                                      ? null
                                      : setState(() {
                                          selectedTimeSlot = '10:00-10:50';
                                          isKey = true;
                                        });
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? Constant.inputText
                                  : (selectedTimeSlot == '10:00-10:50'
                                      ? Constant.purple
                                      : Constant.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Text(
                              '10:00-10:50',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: selectedTimeSlot == '10:00-10:50'
                                    ? Constant.white
                                    : const Color.fromARGB(187, 51, 51, 51),
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () {
                              isVisible == true
                                  ? null
                                  : setState(() {
                                      selectedTimeSlot = '13:00-13:50';
                                      isKey = true;
                                    });
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? Constant.inputText
                                  : (selectedTimeSlot == '13:00-13:50'
                                      ? Constant.purple
                                      : Constant.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Text(
                              '13:00-13:50',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: selectedTimeSlot == '13:00-13:50'
                                    ? Constant.white
                                    : const Color.fromARGB(187, 51, 51, 51),
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () {
                              isVisible == true
                                  ? null
                                  : setState(() {
                                      selectedTimeSlot = '16:00-16:50';
                                      isKey = true;
                                    });
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? Constant.inputText
                                  : (selectedTimeSlot == '16:00-16:50'
                                      ? Constant.purple
                                      : Constant.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Text(
                              '16:00-16:50',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: selectedTimeSlot == '16:00-16:50'
                                    ? Constant.white
                                    : const Color.fromARGB(187, 51, 51, 51),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GrockContainer(
                            onTap: () {
                              isVisible == true
                                  ? null
                                  : setState(() {
                                      selectedTimeSlot = '11:00-11:50';
                                      isKey = true;
                                    });
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? Constant.inputText
                                  : (selectedTimeSlot == '11:00-11:50'
                                      ? Constant.purple
                                      : Constant.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Text(
                              '11:00-11:50',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: selectedTimeSlot == '11:00-11:50'
                                    ? Constant.white
                                    : const Color.fromARGB(187, 51, 51, 51),
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () {
                              isVisible == true
                                  ? null
                                  : setState(() {
                                      selectedTimeSlot = '14:00-14:50';
                                      isKey = true;
                                    });
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? Constant.inputText
                                  : (selectedTimeSlot == '14:00-14:50'
                                      ? Constant.purple
                                      : Constant.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Text(
                              '14:00-14:50',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: selectedTimeSlot == '14:00-14:50'
                                    ? Constant.white
                                    : const Color.fromARGB(187, 51, 51, 51),
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () {
                              isVisible == true
                                  ? null
                                  : setState(() {
                                      selectedTimeSlot = '17:00-17:50';
                                      isKey = true;
                                    });
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? Constant.inputText
                                  : (selectedTimeSlot == '17:00-17:50'
                                      ? Constant.purple
                                      : Constant.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Text(
                              '17:00-17:50',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: selectedTimeSlot == '17:00-17:50'
                                    ? Constant.white
                                    : const Color.fromARGB(187, 51, 51, 51),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GrockContainer(
                            onTap: () {
                              isVisible == true
                                  ? null
                                  : setState(() {
                                      selectedTimeSlot = '12:00-12:50';
                                      isKey = true;
                                    });
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? Constant.inputText
                                  : (selectedTimeSlot == '12:00-12:50'
                                      ? Constant.purple
                                      : Constant.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Text(
                              '12:00-12:50',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: selectedTimeSlot == '12:00-12:50'
                                    ? Constant.white
                                    : const Color.fromARGB(187, 51, 51, 51),
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () {
                              isVisible == true
                                  ? null
                                  : setState(() {
                                      selectedTimeSlot = '15:00-15:50';
                                      isKey = true;
                                    });
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? Constant.inputText
                                  : (selectedTimeSlot == '15:00-15:50'
                                      ? Constant.purple
                                      : Constant.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Text(
                              '15:00-15:50',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: selectedTimeSlot == '15:00-15:50'
                                    ? Constant.white
                                    : const Color.fromARGB(187, 51, 51, 51),
                              ),
                            ),
                          ),
                          GrockContainer(
                            onTap: () {
                              isVisible == true
                                  ? null
                                  : setState(() {
                                      selectedTimeSlot = '18:00-18:50';
                                      isKey = true;
                                    });
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            decoration: BoxDecoration(
                              color: isVisible == true
                                  ? Constant.inputText
                                  : (selectedTimeSlot == '18:00-18:50'
                                      ? Constant.purple
                                      : Constant.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Text(
                              '18:00-18:50',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: selectedTimeSlot == '18:00-18:50'
                                    ? Constant.white
                                    : const Color.fromARGB(187, 51, 51, 51),
                              ),
                            ),
                          ),
                        ],
                      )
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
                  isKey ? Grock.to(PayPage()) : null;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isKey ? Constant.purple : Constant.inputText,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Randevu Al',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Constant.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
