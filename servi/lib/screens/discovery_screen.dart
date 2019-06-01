import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DiscoveryScreen extends StatefulWidget {
  DiscoveryScreen({Key key}) : super(key: key);

  _DiscoveryScreenState createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            _buildAppBar(screenWidth: screenWidth),
            _buildMentorsView(),
            _buildWorkshopsView(),
            _buildTalksView(),
          ],
        ),
      ),
    );
  }
}



class _buildTalksView extends StatelessWidget {
  const _buildTalksView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          child: Text(
            "Talks",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          height: 440,
          child: IgnorePointer(
            child: GridView(
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: <Widget>[
                _buildWorkshopListItem(),
                _buildWorkshopListItem(),
                _buildWorkshopListItem(),
                _buildWorkshopListItem(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class _buildWorkshopsView extends StatelessWidget {
  const _buildWorkshopsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          child: Text(
            "Workshops",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          height: 440,
          child: IgnorePointer(
            child: GridView(
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: <Widget>[
                _buildWorkshopListItem(),
                _buildWorkshopListItem(),
                _buildWorkshopListItem(),
                _buildWorkshopListItem(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _buildWorkshopListItem extends StatelessWidget {
  const _buildWorkshopListItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://i0.wp.com/berlinlovesyou.com/wp-content/uploads/2017/02/facebook_event_666663943505763.jpg?fit=720%2C405")))),
          SizedBox(height: 8.0),
          Text(
            "MY WORKSHOP",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 14.0),
          ),
          Container(
            height: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildEventParticipantList(),
                _buildStarsWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _buildEventParticipantList extends StatelessWidget {
  const _buildEventParticipantList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          Container(
              height: 25.0,
              width: 25.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://randomuser.me/api/portraits/women/14.jpg")))),
          Positioned(
            left: 16.0,
            child: Container(
              height: 25.0,
              width: 25.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://randomuser.me/api/portraits/women/14.jpg"),
                ),
              ),
            ),
          ),
          Positioned(left: 48.0, child: Text("+15", style: TextStyle(fontSize: 12.0),))
        ],
      ),
    );
  }
}

class _buildStarsWidget extends StatelessWidget {
  const _buildStarsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Row(
        children: <Widget>[
          Icon(Icons.star_border, size: 20.0,),
          Icon(Icons.star_border, size: 20.0,),
          Icon(Icons.star_border, size: 20.0,),
          Icon(Icons.star_border, size: 20.0,),
          Icon(Icons.star_border, size: 20.0,),
        ],
      ),
    );
  }
}

class _buildMentorsView extends StatelessWidget {
  const _buildMentorsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          child: Text(
            "Mentors you may know",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          height: 80.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext ctxt, int index) {
                return _buildMentorsListItem();
              }),
        )
      ],
    );
  }
}

class _buildMentorsListItem extends StatelessWidget {
  const _buildMentorsListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
      child: Container(
          height: 80.0,
          width: 80.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://randomuser.me/api/portraits/women/14.jpg")))),
    );
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
          _buildAppBarTextField(),
        ],
      ),
    );
  }
}

class _buildAppBarTextField extends StatelessWidget {
  const _buildAppBarTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
        bottom: 8.0,
        child: Row(
          children: <Widget>[
            SizedBox(width: 20),
            Container(
              height: 60.0,
              width: screenWidth - 40,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search here",
                    hasFloatingPlaceholder: false,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
            SizedBox(width: 20),
          ],
        ));
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
        Text("What are you looking for?",
            style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 8.0,
        ),
        Text("Search for workshops, talks, tutors, etc...",
            style: TextStyle(color: Colors.white70, fontSize: 16.0))
      ],
    );
  }
}
