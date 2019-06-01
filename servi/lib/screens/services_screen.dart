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
  bool _isLoading = false;

  // for form control
  String _serviceType = ServiceMethod(ServiceType.TALK).getServiceMethod();

  String _setDateTime = "set date time";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    _data = new ServiceData(serviceType: _serviceType, name: "");

    return Scaffold(
      body: Container(
          child: ListView(
              children: <Widget>[
                _buildAppBar(screenWidth: screenWidth),
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 8, left: 8, right: 8),
                  child: Container(
                    color: AppColors.backgroundColor,
                    child: _isLoading ? LinearProgressIndicator() : Form(
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
                              decoration: new InputDecoration(
                                labelText: "",
                                contentPadding: new EdgeInsets.all(12.0),
                              ),
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
                            Container(
                              width: screenWidth,
                              height: 90,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(4))
                                  ),
                                  color: Colors.blueGrey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, top: 15, bottom: 15, right: 0
                                    ),
                                    child: Text('Submit', style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                                  elevation: 8,
                                  onPressed: () {
                                    // Validate will return true if the form is valid, or false if
                                    // the form is invalid.
                                    final form = _formKey.currentState;
                                    if (form.validate()) {
                                      form.save();

                                      setState(() {
                                        _isLoading = true;
                                      });

                                      servicePost(_data.serviceType, _data.name);

                                      // If the form is valid, we want to show a Snackbar
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(content: Text('Processing Data')));
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                )
          ])
      ),
    );
  }

  void servicePost(String serviceType, String name) async {
    Firestore.instance.collection('service').document()
        .setData({ 'service_type': serviceType, 'name': name }).then((v) {
          Scaffold.of(context).hideCurrentSnackBar(reason: SnackBarClosedReason.hide);
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Done'))
          );

          setState(() {
            _isLoading = false;
          });
    });
  }
}

class _buildAppBar extends StatelessWidget {
  const _buildAppBar({
    Key key,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      child: Stack(
        children: <Widget>[
          Container(
            height: 180.0,
            width: screenWidth,
            color: Colors.blueGrey,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
              child: _buildAppbarTexts(),
            ),
          ),
        ],
      ),
    );
  }
}

class _buildAppbarTexts extends StatelessWidget {
  const _buildAppbarTexts({
    Key key,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Create a new Service",
            style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 8.0,
        ),
        Text("Bring the community closer...",
            style: TextStyle(color: Colors.white70, fontSize: 16.0))
      ],
    );
  }
}
