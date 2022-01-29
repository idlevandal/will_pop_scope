import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showNavDialog(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('this is page 2', style: Theme.of(context).textTheme.headline3),
        ),
      ),
    );
  }
}

Future<bool?> showNavDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text('Are you sure you want to leave?'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('CANCEL')
            ),
            TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text('YES')
            ),
          ],
        ),
  );
