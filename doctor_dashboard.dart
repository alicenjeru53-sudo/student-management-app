import 'package:flutter/material.dart';

import 'firebase_service.dart';



class DoctorDashboard extends StatelessWidget{


  DoctorDashboard({super.key});


  final FirebaseService service =
  FirebaseService();



  @override

  Widget build(BuildContext context){


    return Scaffold(


        appBar:

        AppBar(

            title:

            Text("Doctor Dashboard")

        ),


        body:

        StreamBuilder(


            stream:

            service.getAppointments(),


            builder:(context,snapshot){


              if(!snapshot.hasData){

                return CircularProgressIndicator();

              }



              var data=snapshot.data!;



              return ListView.builder(


                  itemCount:data.length,


                  itemBuilder:(context,index){



                    var appointment=data[index];



                    return Card(


                        child:

                        ListTile(


                            title:

                            Text(

                                appointment.patient

                            ),


                            subtitle:

                            Text(

                                appointment.status

                            ),



                            trailing:

                            Row(


                                mainAxisSize:

                                MainAxisSize.min,


                                children:[


                                  IconButton(

                                      icon:

                                      Icon(Icons.check),

                                      onPressed:(){


                                        service.updateAppointment(

                                            appointment.id,

                                            "Accepted"

                                        );


                                      }

                                  ),



                                  IconButton(

                                      icon:

                                      Icon(Icons.close),

                                      onPressed:(){


                                        service.updateAppointment(

                                            appointment.id,

                                            "Rejected"

                                        );


                                      }

                                  )



                                ]


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