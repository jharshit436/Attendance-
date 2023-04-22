import 'dart:async';

import 'package:attendance_tracker/models/subject_model.dart';
import 'package:attendance_tracker/services/attendance_manager.dart';
import 'package:attendance_tracker/services/dashboard_service.dart';
import 'package:attendance_tracker/services/globalVariables.dart';
import 'package:attendance_tracker/widgets/drawer.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'alert.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  StreamController<List<SubjectModel>> streamController =
      StreamController<List<SubjectModel>>();
  void initState() {
    super.initState();
    loadList();
  }

  MarkAttendace ma = MarkAttendace();

  void markPresnt(int index) {
    setState(() {
      sm1[index].attendclasses++;
      sm1[index].totalclasses++;
      streamController.add(s.list);
      ma.Present(
          context: context,
          id: sm1[index].id,
          subject: sm1[index].subject,
          email: LoginCredentials.email,
          total: sm1[index].totalclasses,
          attended: sm1[index].attendclasses);
    });
    loadList();
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => Dashboard()));
  }

  void undoPresnt(int index) {
    setState(() {
      sm1[index].attendclasses--;
      sm1[index].totalclasses--;
      streamController.add(s.list);
      ma.UndoPresent(
          context: context,
          id: sm1[index].id,
          subject: sm1[index].subject,
          email: LoginCredentials.email,
          total: sm1[index].totalclasses,
          attended: sm1[index].attendclasses);
    });
    loadList();
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => Dashboard()));
  }

  void markAbsent(int index) {
    setState(() {
      sm1[index].totalclasses++;
      streamController.add(s.list);
      ma.Absent(
          context: context,
          id: sm1[index].id,
          subject: sm1[index].subject,
          email: LoginCredentials.email,
          total: sm1[index].totalclasses,
          attended: sm1[index].attendclasses);
    });
    loadList();
  }

  void undoAbsent(int index) {
    setState(() {
      sm1[index].totalclasses--;
      streamController.add(s.list);
      ma.UndoAbsent(
          context: context,
          id: sm1[index].id,
          subject: sm1[index].subject,
          email: LoginCredentials.email,
          total: sm1[index].totalclasses,
          attended: sm1[index].attendclasses);
    });
    loadList();
  }

  void DeleteSubject(int index) {
    setState(() {
      ma.DeleteSubject(
          context: context,
          id: sm1[index].id,
          subject: sm1[index].subject,
          email: LoginCredentials.email,
          total: sm1[index].totalclasses,
          attended: sm1[index].attendclasses);
    });
    loadList();
  }

  List<SubjectModel> sm1 = [];
  Subjects s = Subjects();
  void loadList() async {
    await s.getSubject();
    sm1 = s.list;
    streamController.add(s.list);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RefreshIndicator(
        onRefresh: () async {
          loadList();
        },
        child: Material(
          borderRadius: BorderRadius.circular(25),
          child: Scaffold(
            backgroundColor: Vx.white,
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              actions: <Widget>[Alerts()],
              foregroundColor: Vx.black,
              elevation: 0.0,
              backgroundColor: Color.fromARGB(0, 36, 17, 17),
              centerTitle: true,
              title: Container(
                child: "Dashboard".text.bold.make(),
              ),
            ),
            body: Container(
              child: StreamBuilder(
                  stream: streamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: sm1.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(10),
                              child: AnimatedContainer(
                                duration:
                                    Duration(milliseconds: 300 + (index * 100)),
                                curve: Curves.easeInOut,
                                height: 125,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Vx.gray100,
                                        blurRadius: 2.0,
                                        spreadRadius: 0.0,
                                        offset: Offset(2.0, 2.0),
                                      )
                                    ]),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 120,
                                      // pie chart
                                      child: PieChart(
                                        animationDuration:
                                            Duration(milliseconds: 800),
                                        dataMap: {
                                          "Present": sm1[index]
                                              .attendclasses
                                              .toDouble(),
                                          "Absent": (sm1[index].totalclasses -
                                                  sm1[index].attendclasses)
                                              .toDouble()
                                        },
                                        chartRadius:
                                            MediaQuery.of(context).size.width,
                                        chartValuesOptions: ChartValuesOptions(
                                            showChartValuesInPercentage: true),
                                        legendOptions:
                                            LegendOptions(showLegends: false),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        // name
                                        Row(children: [
                                          Container(
                                            child: Center(
                                              child: (sm1[index].subject)
                                                  .text
                                                  .size(30)
                                                  .make(),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              alignment: Alignment.topRight,
                                              child: PopupMenuButton(
                                                iconSize: 22,
                                                itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                    child: Text("Undo Present"),
                                                    onTap: () {
                                                      undoPresnt(index);
                                                    },
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text("Undo Absent"),
                                                    onTap: () {
                                                      undoAbsent(index);
                                                    },
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text(
                                                      "Delete",
                                                      style: TextStyle(
                                                          color: Vx.red500),
                                                    ),
                                                    onTap: () {
                                                      DeleteSubject(index);
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ]),
                                        Row(
                                          children: [
                                            // Attendance
                                            Column(
                                              children: [
                                                Container(
                                                    child: Text(
                                                        "Total Class: " +
                                                            sm1[index]
                                                                .totalclasses
                                                                .toString())),
                                                Container(
                                                    child: Text("Attend: " +
                                                        sm1[index]
                                                            .attendclasses
                                                            .toString()))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  width: 0,
                                                  height: 0,
                                                ),
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      width: 150,
                                                    ),
                                                    InkWell(
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            seconds: 3),
                                                        height: 30,
                                                        width: 75,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text("Present"),
                                                        decoration: BoxDecoration(
                                                            color: Vx.green300,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                      ),
                                                      onTap: () {
                                                        setState(() {
                                                          markPresnt(index);
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                  width: 15,
                                                ),
                                                InkWell(
                                                  child: AnimatedContainer(
                                                    duration:
                                                        Duration(seconds: 3),
                                                    height: 30,
                                                    width: 75,
                                                    alignment: Alignment.center,
                                                    child: Text("Absent"),
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            246, 245, 98, 61),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                  ),
                                                  onTap: () {
                                                    markAbsent(index);
                                                  },
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            floatingActionButton: AddSubject(),
            drawer: Drawer(
              child: MyDrawer(),
            ),
          ),
        ),
      ),
    );
  }
}

class AddSubject extends StatefulWidget {
  const AddSubject({super.key});

  @override
  State<AddSubject> createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  final TextEditingController subjectController = TextEditingController();
  final Subjects addSubject_localInstance = Subjects();

  void AddSubject() {
    addSubject_localInstance.addSubject(
        email: LoginCredentials.email,
        subject: subjectController.text,
        totalclasses: 0,
        attendclasses: 0);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Dashboard()));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(CupertinoIcons.add_circled_solid),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              context: context,
              builder: ((BuildContext context) {
                return SizedBox(
                  height: 200,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(children: [
                        const SizedBox(
                          height: 15,
                        ),
                        "Enter Details".text.size(39).bold.make(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 28),
                          child: TextFormField(
                            controller: subjectController,
                            decoration: const InputDecoration(
                                labelText: "Subject Name ",
                                hintText: "Subject Name"),
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              AddSubject();
                            },
                            child: "Add".text.make(),
                          ),
                        )
                      ]),
                    ),
                  ),
                );
              }));
        });
  }
}
