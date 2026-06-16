import 'package:flutter/material.dart';

import 'firebase_service.dart';



class AppointmentScreen extends StatelessWidget{


  AppointmentScreen({super.key});



  final FirebaseService service =
  FirebaseService();



  @override

  Widget build(BuildContext context){


    return Scaffold(


        appBar:

        AppBar(

            title:

            Text("My Appointments")

        ),


        body:

        StreamBuilder(


            stream:

            service.getAppointments(),



            builder:(context,snapshot){


              if(!snapshot.hasData){

                return Center(

                    child:CircularProgressIndicator()

                );

              }


              var appointments =
              snapshot.data!;



              return ListView.builder(


                  itemCount:

                  appointments.length,


                  itemBuilder:(context,index){


                    var appointment =
                    appointments[index];



                    return Card(


                        child:

                        ListTile(


                            title:

                            Text(

                                appointment.doctor

                            ),


                            subtitle:

                            Text(

                                appointment.date

                            ),



                            trailing:

                            Text(

                                appointment.status

                            )


                        )


                    );



                  }


              );



            }



        )


    );



  }


}