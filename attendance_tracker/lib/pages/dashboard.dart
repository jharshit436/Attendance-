import 'package:attendance_tracker/models/subject_model.dart';
import 'package:attendance_tracker/services/dashboard_service.dart';
import 'package:attendance_tracker/services/globalVariables.dart';
import 'package:attendance_tracker/widgets/drawer.dart';
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
  Subjects s = Subjects();

  void getSubjects() {
    s.getSubject();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            centerTitle: true,
            leading: InkWell(
              child: Container(
                  child: Image.network(
                "https://img.icons8.com/ios/256/long-arrow-right.png",
              )),
            ),
            actions: <Widget>[
              AddSubject(),
            ],
            backgroundColor: Colors.white,
            title: Container(
              child: const Text(
                "DashBoard",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    //color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  //color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 3),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ElevatedButton(
                          child: Text("Click"),
                          onPressed: () => {getSubjects()},
                        ),
                        // ListView.builder(
                        //   itemBuilder: (context, index) {
                        //     return Container(

                        //     );
                        //   },
                        //   itemCount: 1,
                        // )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
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
        context: context,
        userId: LoginCredentials.email,
        subject: subjectController.text,
        totalclasses: 0,
        attendclasses: 0);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          child: Image.network(
        "https://cdn-icons-png.flaticon.com/512/3018/3018447.png",
      )),
      onTap: () {
        // // Navigator.pushNamed(context, '/AddSubject');
        // final text = "some ifo of user";
        // final snackBar = SnackBar(
        //   content: Text(text),
        //   duration: Duration(seconds: 60),
        //   action: SnackBarAction(label: "Dismiss", onPressed: () {}),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Enter Details",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
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
                            child: const Text("Add"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
