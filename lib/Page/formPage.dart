// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Provider/transac_provide.dart';
import 'package:flutter_application_4/model/model.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("เพิ่มสถานที่ท่องเที่ยว"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "Please inform a name";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          labelText: "ชื่อสถานที่",
                          labelStyle: TextStyle(color: Colors.green)),
                      //autofocus: true,
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: locationController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "Please inform a location";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          labelText: "ที่อยู่",
                          labelStyle: TextStyle(color: Colors.green)),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: reviewController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "Please inform a review";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          labelText: "รีวิว",
                          labelStyle: TextStyle(color: Colors.green)),
                      keyboardType: TextInputType.text,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            var name = nameController.text;
                            var location = locationController.text;
                            var review = reviewController.text;

                            Model inputModel = Model(name, location, review);
                            var provider = Provider.of<TransacProvide>(context,
                                listen: false);
                            provider.addModel(inputModel);
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(color: Colors.green)),
                        child: const Text(
                          "Submit",
                        ))
                  ],
                )),
          ),
        ));
  }
}
