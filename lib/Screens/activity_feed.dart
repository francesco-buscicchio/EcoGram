import 'package:flutter/material.dart';


class ActivityFeed extends StatefulWidget {

@override _ActivityFeedState createState() =>
_ActivityFeedState();
}

class _ActivityFeedState extends State<ActivityFeed> {
@override
Widget build(BuildContext context) {
return const Text('Activity Feed');
}
}

class ActivityFeedItem extends StatelessWidget {
@override
Widget build(BuildContext context) {
    return const Text('Activity Feed Item');
}
}