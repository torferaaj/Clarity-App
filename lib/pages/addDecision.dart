import 'package:decisionlite/services/functions/firebaseFunctions.dart';
import 'package:decisionlite/services/providers/pollProvider.dart';
import 'package:decisionlite/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

User? currUser = FirebaseAuth.instance.currentUser;


class AddDecision extends StatefulWidget {
  const AddDecision({Key? key}) : super(key: key);

  @override
  _AddDecisionState createState() => _AddDecisionState();
}

class _AddDecisionState extends State<AddDecision> {


  TextEditingController controllerOne = TextEditingController();
  TextEditingController controllerTwo = TextEditingController();
  // TextEditingController controllerThree = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<PollsProvider>(context,listen: false);

    return Scaffold(
      body: Consumer<PollsProvider>(
        builder: (context, model, child) => Container(
          color: Colors.black.withOpacity(0.8),
          padding: EdgeInsets.all(14),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // PollsContainer(controllerOne: controllerOne,controllerTwo: controllerTwo,),
            Consumer<PollsProvider>(
            builder: (context, model, child) => Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
            side:
            BorderSide(color: Colors.grey.shade600.withOpacity(0.3))),
        elevation: 0,
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        color: Colors.black87,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controllerOne,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(

                        hintText: 'Add Polls Title',
                        hintStyle: TextStyle(fontSize: 18, color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      cursorColor: AppColors.primary,
                      maxLines: 2,
                      minLines: 1,
                      validator: (value) {
                        if (value!.length == 0) {
                          return 'Enter Title';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        model.addPollTitle(value!);
                      },
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  // for (int i = 0; i < model.pollsOptions.length; i++)
                  Consumer<PollsProvider>(
                    builder: (context,data,child)=>
                     ListView.builder(
                      itemCount :  data.pollsOptions.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index){

                      return Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    model.removeOption();
                                  },
                                  icon: Icon(Icons.close)),
                              Expanded(
                                child: TextFormField(
                                  controller: data.controller(index),
                                  decoration: const InputDecoration(
                                      hintText: 'Enter Option',
                                      // hintText: 'Option ${index + 1}',
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value!.length == 0) {
                                      return 'Enter Option';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    model.pollsOptions[index] = value!;
                                    model.pollsWeights[value] = 0;
                                  },
                                  textCapitalization: TextCapitalization.sentences,
                                ),
                              )
                            ],
                          ));

                    }),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        model.addPollOption();
                        prov.addControllers();
                      },
                      child: Text('Add an Option')),
                ],
              )
            ],
          ),
        ),
      )),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        saveDecision(model.pollsWeights, model.pollTitle);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Decision Uploaded')));
                        controllerOne.clear();
                        prov.removeControllers();

                      }
                      //

                    },
                    child: Text('Upload decision'))
                // ElevatedButton(
                //   onPressed: () {}, child: Text('Add Poll'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
