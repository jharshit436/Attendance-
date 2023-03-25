import 'package:attendance_tracker/models/subject_model.dart';
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

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void initState() {
    super.initState();
    loadList();
  }

  List<SubjectModel> sm1 = [];
  Subjects s = Subjects();
  void loadList() async {
    await s.getSubject();
    sm1 = s.list;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        borderRadius: BorderRadius.circular(25),
        child: Scaffold(
          drawerScrimColor: Vx.white,
          backgroundColor: Vx.white,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            actions: <Widget>[Icon(CupertinoIcons.bell)],
            foregroundColor: Vx.black,
            elevation: 0.0,
            backgroundColor: Color.fromARGB(0, 36, 17, 17),
            centerTitle: true,
            title: Container(
              child: "DashBoard".text.bold.make(),
              // style: TextStyle(color: Colors.black)
            ),
          ),
          body: Container(
            child: FutureBuilder(
                future: s.getSubject(),
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
                                  boxShadow: [
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
                                        "Present":
                                            sm1[index].attendclasses.toDouble(),
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
                                      Container(
                                        child: Center(
                                          child: (sm1[index].subject)
                                              .text
                                              .size(30)
                                              .make(),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          // Attendance
                                          Column(
                                            children: [
                                              Container(
                                                  child: Text("Total Class: " +
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
                                                width: 50,
                                                height: 0,
                                              ),
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    width: 150,
                                                  ),
                                                  InkWell(
                                                    child: AnimatedContainer(
                                                      duration:
                                                          Duration(seconds: 3),
                                                      height: 35,
                                                      width: 75,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text("Present"),
                                                      decoration: BoxDecoration(
                                                          color: Vx.blue300,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                    ),
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
                                                  height: 35,
                                                  width: 75,
                                                  alignment: Alignment.center,
                                                  child: Text("Absent"),
                                                  decoration: BoxDecoration(
                                                      color: Vx.green300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                ),
                                              )
                                            ],
                                          )
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
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(CupertinoIcons.add_circled_solid),
        onPressed: () {
          showModalBottomSheet(
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
    // return InkWell(
    //   child: Container(
    //       child: Image.network(
    //     "https://cdn-icons-png.flaticon.com/512/3018/3018447.png",
    //   )),
    //   onTap: () {
    // showModalBottomSheet(
    //     context: context,
    //     isScrollControlled: true,
    //     builder: (BuildContext context) {
    //       return SizedBox(
    //         height: 200,
    //         child: SingleChildScrollView(
    //           child: Padding(
    //             padding: EdgeInsets.only(
    //                 bottom: MediaQuery.of(context).viewInsets.bottom),
    //             child: Column(
    //               children: [
    //                 const SizedBox(
    //                   height: 15,
    //                 ),
    //                 const Text(
    //                   "Enter Details",
    //                   style: TextStyle(
    //                     fontSize: 35,
    //                     fontWeight: FontWeight.w400,
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(
    //                       vertical: 10, horizontal: 28),
    //                   child: TextFormField(
    //                     controller: subjectController,
    //                     decoration: const InputDecoration(
    //                         labelText: "Subject Name ",
    //                         hintText: "Subject Name"),
    //                   ),
    //                 ),
    //                 Center(
    //                   child: ElevatedButton(
    //                     onPressed: () {
    //                       setState(() {
    //                          AddSubject();
    //                       });

    //                     },
    //                     child: const Text("Add"),
    //                   ),
    //                 )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           );
    //         });
    //   },
    // );
  }
}
