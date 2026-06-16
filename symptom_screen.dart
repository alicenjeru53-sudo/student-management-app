import 'package:flutter/material.dart';

import 'diagnosis_screen.dart';



class SymptomScreen extends StatefulWidget{


  const SymptomScreen({super.key});


  @override

  State<SymptomScreen> createState()

  => _SymptomScreenState();


}



class _SymptomScreenState

    extends State<SymptomScreen>{



  final symptoms =

  TextEditingController();



  @override

  Widget build(BuildContext context){


    return Scaffold(



        appBar:

        AppBar(

            title:

            const Text(
                "Symptom Checker"
            )

        ),




        body:

        Padding(

            padding:

            const EdgeInsets.all(20),



            child:

            Column(


                children:[


                  const Text(

                      "Describe your symptoms",

                      style:

                      TextStyle(

                          fontSize:22,

                          fontWeight:FontWeight.bold

                      )

                  ),



                  const SizedBox(height:20),



                  TextField(


                      controller:

                      symptoms,


                      maxLines:5,


                      decoration:

                      const InputDecoration(


                          hintText:

                          "Example: fever, headache, cough",


                          border:

                          OutlineInputBorder()


                      )


                  ),




                  const SizedBox(height:20),




                  ElevatedButton(


                      child:

                      const Text(
                          "Analyze Symptoms"
                      ),



                      onPressed:(){



                        Navigator.push(


                            context,


                            MaterialPageRoute(


                                builder:(context)=>

                                    DiagnosisScreen(

                                        symptom:

                                        symptoms.text.toLowerCase()

                                    )


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