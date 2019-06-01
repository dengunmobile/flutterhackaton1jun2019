import 'package:flutter/material.dart';
import 'package:servi/theme/colors.dart';
import 'package:servi/utils/constants.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:dio/dio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class ServiceData {
  String serviceType = '';
  String name = '';

  ServiceData({this.serviceType, this.name});
}

class _ServicesScreenState extends State<ServicesScreen> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  ServiceData _data;

  // for form control
  String _serviceType = ServiceMethod(ServiceType.TALK).getServiceMethod();

  String _setDateTime = "set date time";

  @override
  Widget build(BuildContext context) {

    _data = new ServiceData(serviceType: _serviceType, name: "");

    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 8, left: 8, right: 8),
      child: Container(
        color: AppColors.backgroundColor,
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Service Type:",
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primaryTextColor,
                      fontFamily: "Roboto ",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                              value: _serviceType,
                              onChanged: (String newValue) {
                                _data.serviceType = newValue;
                                setState(() {
                                  _serviceType = newValue;
                                });
                              },
                              items: ServiceType.values
                                  .map((ServiceType serviceType) {
                                String value =
                                    ServiceMethod(serviceType).getServiceMethod();
                                return new DropdownMenuItem<String>(
                                    value: value, child: new Text("$value"));
                              }).toList()),
                        ),
                      ),
                    ),
                  ],
                ),
                Text("Service Name:"),
                TextFormField(
                  onSaved: (String value) {
                    _data.name = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                ),
                Text("Service Date/Time:"),
                FlatButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
//                          minTime: DateTime(2018, 3, 5),
//                          maxTime: DateTime(2019, 6, 7),
                          onChanged: (date) {
                        print('change $date');
                        setState(() {
                          _setDateTime = date.toString();
                        });
                      }, onConfirm: (date) {
                        print('confirm $date');
                        setState(() {
                          _setDateTime = date.toString();
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Text(
                      _setDateTime,
                      style: TextStyle(color: Colors.blue),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      final form = _formKey.currentState;
                      if (form.validate()) {
                        form.save();

                        servicePost(_data.serviceType, _data.name);

                        // If the form is valid, we want to show a Snackbar
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void servicePost(String serviceType, String name) async {
    Firestore.instance.collection('service').document()
        .setData({ 'service_type': serviceType, 'name': name }).then((v) =>
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Done'))
          )
    );
  }
}
