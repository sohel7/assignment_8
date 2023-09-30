import 'package:flutter/material.dart';

void main() => runApp(ProfileApp());

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            // Portrait orientation: Profile picture on top
            return PortraitLayout();
          } else {
            // Landscape orientation: Profile picture on the left
            return LandscapeLayout();
          }
        },
      ),
    );
  }
}

class PortraitLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 80.0,
            backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
          ),
        ),
        // Container(
        //   padding: EdgeInsets.all(20.0),
        //   alignment: Alignment.center,
        //   child: CircleAvatar(
        //     radius: 80.0,
        //     //backgroundImage: AssetImage('assets/profile_pic.jpg'),
        //     child: Image.network('https://picsum.photos/250?image=9'),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'John Doe',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 6, // Change this to the number of items you want to display
            itemBuilder: (context, index) {
              return GridItem(index: index);
            },
          ),
        ),
      ],
    );
  }
}

class LandscapeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 80.0,
            backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
          ),
        ),
        // Container(
        //   padding: EdgeInsets.all(20.0),
        //   alignment: Alignment.center,
        //   child: CircleAvatar(
        //     radius: 80.0,
        //     backgroundImage: AssetImage('assets/profile_pic.jpg'),
        //   ),
        // ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'John Doe',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 6, // Change this to the number of items you want to display
                  itemBuilder: (context, index) {
                    return GridItem(index: index);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GridItem extends StatelessWidget {
  final int index;

  GridItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 90.0,
                backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
              ),
            ),
            // Icon(
            //   Icons.photo,
            //   size: 50.0,
            // ),
            Text(
              'Item $index',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
