import 'package:flutter/material.dart';

import 'appointment_screen.dart';
import 'symptom_screen.dart';
import 'doctor_screen.dart';
import 'profile_screen.dart';
import 'auth_service.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();
    return Scaffold(
        appBar: AppBar(title: const Text("SmartMed Dashboard")),
        drawer: Drawer(
            child: ListView(children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff0097A7)),
              child: Text("Smart Medical System",
                  style: TextStyle(color: Colors.white, fontSize: 22))),
          ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              }),
          ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () async {
                await auth.logout();
                if (!context.mounted) return;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              }),
        ])),





        body:

        Padding(

            padding:

            const EdgeInsets.all(20),



            child:

            Column(


                crossAxisAlignment:

                CrossAxisAlignment.start,


                children:[


                  const Text(

                      "Welcome Patient 👋",

                      style:

                      TextStyle(

                          fontSize:26,

                          fontWeight:FontWeight.bold

                      )

                  ),



                  const SizedBox(height:20),



                  dashboardCard(

                      context,

                      "Check Symptoms",

                      Icons.health_and_safety,

                      SymptomScreen()

                  ),



                  dashboardCard(

                      context,

                      "Find Doctors",

                      Icons.medical_services,

                      DoctorScreen()

                  ),



                  dashboardCard(
                      context,
                      "Appointments",
                      Icons.calendar_month,
                      AppointmentScreen()
                  ),



                ]


            )


        )


    );


  }



  Widget dashboardCard(

      BuildContext context,

      String title,

      IconData icon,

      Widget page

      ){



    return Card(


        elevation:5,


        margin:

        const EdgeInsets.only(bottom:15),



        child:

        ListTile(


            leading:

            Icon(

                icon,

                size:40,

                color:

                Color(0xff0097A7)

            ),


            title:

            Text(

                title,

                style:

                TextStyle(

                    fontSize:18

                )

            ),



            trailing:

            Icon(Icons.arrow_forward),


            onTap:(){


              Navigator.push(

                  context,

                  MaterialPageRoute(

                      builder:(context)=>

                      page

                  )

              );


            }


        )


    );



  }



}