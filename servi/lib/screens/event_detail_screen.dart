import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                "https://i0.wp.com/berlinlovesyou.com/wp-content/uploads/2017/02/facebook_event_666663943505763.jpg?fit=720%2C405",
                fit: BoxFit.cover,
              )),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            color: Colors.white70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "MY WORKSHOP",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 26.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  "By Mentor do Destino",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Saturday, June 1",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "21:00 - 23:00 GMT+01:00",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 14.0),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.my_location),
                    SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "San Francisco",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "Main street",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 14.0),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "About",
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Participants",
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://randomuser.me/api/portraits/women/14.jpg"),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0,),
                            Text("Maria")  
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
