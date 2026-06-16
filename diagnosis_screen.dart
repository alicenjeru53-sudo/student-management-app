import 'package:flutter/material.dart';

import 'diagnosis_api.dart';

import 'doctor_screen.dart';



class DiagnosisScreen extends StatelessWidget{


  final String symptom;



  const DiagnosisScreen({

    super.key,

    required this.symptom

  });





  @override

  Widget build(BuildContext context){



    var result =

    DiagnosisAPI.analyze(symptom);





    return Scaffold(



        appBar:

        AppBar(

            title:

            const Text(
                "Diagnosis Result"
            )

        ),





        body:

        Center(


            child:

            Column(


                mainAxisAlignment:

                MainAxisAlignment.center,


                children:[



                  const Icon(

                      Icons.health_and_safety,

                      size:80,

                      color:

                      Color(0xff43A047)

                  ),




                  Text(


                      result["disease"]!,


                      style:

                      const TextStyle(

                          fontSize:24,

                          fontWeight:FontWeight.bold

                      )


                  ),



                  const SizedBox(height:20),




                  Text(

                      "Recommended Doctor:\n${result["doctor"]}",


                      textAlign:

                      TextAlign.center,


                      style:

                      const TextStyle(

                          fontSize:18

                      )

                  ),




                  const SizedBox(height:30),



                  ElevatedButton(


                      child:

                      const Text(
                          "Find Doctor"
                      ),



                      onPressed:(){


                        Navigator.push(


                            context,


                            MaterialPageRoute(


                                builder:(context)=>

                                    DoctorScreen()

                            )

                        );



                      }


                  )



                ]


            )


        )



    );


  }



}