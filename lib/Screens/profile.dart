import 'package:ecogram/components/backgrounds/ProfileBackground.dart';
import 'package:flutter/material.dart';


class Profiles extends StatefulWidget {

@override _ProfilesState createState() =>
_ProfilesState();
}

class _ProfilesState extends State<Profiles> {
@override
Widget build(BuildContext context) {
return const Text('Profiles');
}
}

class Profile extends StatelessWidget {
@override
Widget build(BuildContext context) {
    return const ProfileBackground(child: Scaffold(backgroundColor: Colors.transparent,));
}
}