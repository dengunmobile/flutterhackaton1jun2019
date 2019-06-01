import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:servi/theme/colors.dart';

class AccountScreen extends StatefulWidget {

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
              Stack(
                  children: <Widget>[
                      Container(
                        height: 200.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.black12,
                            image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage(
                                    "https://i0.wp.com/berlinlovesyou.com/wp-content/uploads/2017/02/facebook_event_666663943505763.jpg?fit=720%2C405"
                                )
                            )
                        ),
                      ),
                      Container(
                          child: Center(
                              child: Text(
                                  'Daniel Pescadinha Marco Pedro',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ))),
                          height: 200.0,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.black45
                          )
                      ),
                  ]
              ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10, top: 0, bottom: 8, right: 20),
                  child: Text(
                    "Recent Services ",
                    style: TextStyle(
                        fontSize: 13,
                        color: AppColors.greyTextColor1,
                        fontFamily: "Roboto ",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                )
              ],
            ),
            Expanded(child:
            statusList(context)
            )

          ],
        )
      ),
    );
  }


}

Widget statusList(BuildContext context) {

  var t1 = Status(1, "Created Workshop about Flutter", "10 attendees! Nice!!!");
  var t2 = Status(2, "Talk about cooking Xarem", "Joined");
  var t3 = Status(1, "Event about Algarve", "Joined");
  var t4 = Status(1, "How to craft beer", "Joined");

  List<Status> status = [t1, t2, t3, t4];

  return ListView.builder(
    shrinkWrap: true,
    padding: const EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 0),
    itemBuilder: (context, i) {
      if (i < status.length) {
        return Card( //
            borderOnForeground: false,
            shape: RoundedRectangleBorder(),
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0.1),
            child: Container(
              height: 60,
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.event, color: Colors.black, size: 25),
                      ),
                      Container(
                        //color: Colors.amber,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text(
                              status[i].hash,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          status[i].time,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
        );
      }
    },
  );

}

class Status {
  final int total;

  final String hash;

  final String time;

  Status(this.total, this.hash, this.time);
}