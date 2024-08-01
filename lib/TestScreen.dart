// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

// class TestScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Schedule View Calendar'),
//       ),
//       body: SfCalendar(
//         view: CalendarView.schedule,
//         dataSource: MeetingDataSource(_getDataSource()),
//         monthViewSettings: MonthViewSettings(
//           showAgenda: true,
//           agendaStyle: AgendaStyle(
//             appointmentTextStyle: TextStyle(
//               color: Colors.white,
//             ),
//             dateTextStyle: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//             dayTextStyle: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//         ),
//         scheduleViewSettings: ScheduleViewSettings(
//           hideEmptyScheduleWeek: false,
//         ),
//       ),
//     );
//   }

//   List<Meeting> _getDataSource() {
//     final List<Meeting> meetings = <Meeting>[];
//     final DateTime today = DateTime.now();
//     final DateTime startTime =
//         DateTime(today.year, today.month, today.day, 9, 0, 0);
//     final DateTime endTime = startTime.add(const Duration(hours: 2));

//     meetings.add(Meeting(
//       eventName: 'Conference',
//       from: startTime,
//       to: endTime,
//       background: Colors.blue,
//       isAllDay: false,
//     ));

//     return meetings;
//   }
// }

// class MeetingDataSource extends CalendarDataSource {
//   MeetingDataSource(List<Meeting> source) {
//     appointments = source;
//   }

//   @override
//   DateTime getStartTime(int index) {
//     return appointments![index].from;
//   }

//   @override
//   DateTime getEndTime(int index) {
//     return appointments![index].to;
//   }

//   @override
//   String getSubject(int index) {
//     return appointments![index].eventName;
//   }

//   @override
//   Color getColor(int index) {
//     return appointments![index].background;
//   }

//   @override
//   bool isAllDay(int index) {
//     return appointments![index].isAllDay;
//   }
// }

// class Meeting {
//   Meeting({
//     required this.eventName,
//     required this.from,
//     required this.to,
//     required this.background,
//     required this.isAllDay,
//   });

//   String eventName;
//   DateTime from;
//   DateTime to;
//   Color background;
//   bool isAllDay;
// }
