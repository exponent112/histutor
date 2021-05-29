import 'package:flutter/material.dart';
import 'package:histutor/model/Session.dart';
import 'package:histutor/model/User.dart';

import 'package:histutor/state/ApplicationState.dart';
import 'package:histutor/state/Authentication.dart';
import 'package:provider/provider.dart';

import 'myPageWidgets/SessionButton.dart';
import 'myPageWidgets/SessionList.dart';
import 'myPageWidgets/nicknameChange.dart';
import 'myPageWidgets/topButtons.dart';

class SessionPage extends StatefulWidget {
  @override
  _SessionPageState createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  @override
  Widget build(BuildContext context) {
    List<Session> sessions = Provider.of<List<Session>>(context);
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(125, 0, 145, 0),
        child:  Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
              child : SessionButton(),
            ),
            Consumer<ApplicationState>(
              builder: (context, applicationState, _){
                return selectMyPage();
              },
            )

          ],
        ),
      ),
    );
  }
}
Widget selectMyPage() {// to session
      return Container(
        width: 1167,
        height: 534,
        alignment: Alignment.topLeft,
        color: Color(0xffFFFFFF),
        child: SessionListPage(), //Session list 넣기
      );
}
