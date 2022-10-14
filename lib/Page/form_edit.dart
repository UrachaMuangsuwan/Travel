// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_4/Provider/transac_provide.dart';
import 'package:flutter_application_4/model/model.dart';
import 'package:provider/provider.dart';

class FormEditScreen extends StatefulWidget {
  final Model data;

  //Controller

  const FormEditScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<FormEditScreen> createState() => _FormEditScreenState();
}

class _FormEditScreenState extends State<FormEditScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final reviewController = TextEditingController();

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name.toString();
    locationController.text = widget.data.location.toString();
    reviewController.text = widget.data.review.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("แก้ไขสถานที่ท่องเที่ยว"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                      autofocus: true,
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
                            provider.updateModel(inputModel);
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(color: Colors.green)),
                        child: const Text(
                          "update",
                        ))
                  ],
                )),
          ),
        ));
  }
}
