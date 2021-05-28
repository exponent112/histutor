import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SessionButton extends StatefulWidget {
  @override
  _SessionButtonState createState() => _SessionButtonState();
}

class _SessionButtonState extends State<SessionButton> {
  @override
  Widget build(BuildContext context) {
    bool isTutee = false;
    return (isTutee) ? tuteeButton() : tutorButton(context);
  }
}

Widget tuteeButton(){
  return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child :Row(
      )
  );
}

Widget tutorButton(BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 10.0, 5.0),
        child: RaisedButton(
          color: Colors.white,
          child: Text('Create'),
          onPressed: ()=> _createButtonPressed(context), //만드는 창 만들기
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6)),
          // style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all(Color(0xffFFFFFF)),
          // ),
        ),
      ),
    ],
  );
}

void _createButtonPressed(BuildContext context){
 showDialog(context: context,
     builder: (context){
       return roomMaker();
     });
}

class roomMaker extends StatefulWidget {
  const roomMaker({Key key}) : super(key: key);

  @override
  _roomMakerState createState() => _roomMakerState();
}

class _roomMakerState extends State<roomMaker> {
  final _sessionName = TextEditingController();
  final _offsession = TextEditingController();
  final _zoomlink = TextEditingController();
  String tutor_name = "get_name()";
  String stuId = "";
  DateTime _datetime = DateTime.now();
  DateTime _starttime = DateTime.now();
  DateTime _endtime = DateTime.now();
  String session_name = "";
  String type = "";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          height: 700,
          width: 405,
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("TA 세션 열기"),
                ],
              ),
              width: 405,
              height: 66,
              color: Color(0xffD1E5EE),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            Flexible(child: SingleChildScrollView(
                child: Container(
                  height: 1000,
                  width: 405,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 5,),
                      Container(
                          width: 363,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _sessionName,
                                decoration: InputDecoration(
                                  labelText: '방이름',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value){
                                  if(value.length < 1) return '필수 항목입니다.';
                                  return null;
                                },
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                controller: _offsession,
                                decoration: InputDecoration(
                                  labelText: '오프라인장소',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                controller: _zoomlink,
                                decoration: InputDecoration(
                                  labelText: '줌링크',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 10,),
                              SizedBox(height: 20,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 10,),
                                      Text("시작 시각을 선택하세요."),
                                    ],
                                  )
                              ),
                              SizedBox(
                                height: 150,
                                width: 363,
                                child: CupertinoDatePicker(
                                    initialDateTime:_starttime,
                                    minimumDate: _datetime,
                                    mode: CupertinoDatePickerMode.dateAndTime,
                                    onDateTimeChanged: (datetime){
                                      print(_starttime);
                                      setState(() {
                                        _starttime = datetime;
                                      });
                                    }),
                              ),
                              SizedBox(height: 10,),
                              SizedBox(height: 20,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 10,),
                                      Text("끝나는 시각을 선택하세요."),
                                    ],
                                  )
                              ),
                              SizedBox(
                                height: 150,
                                width: 300,
                                child: CupertinoDatePicker(
                                    initialDateTime: _endtime,
                                    minimumDate: _datetime,
                                    mode: CupertinoDatePickerMode.dateAndTime,
                                    onDateTimeChanged: (datetime){
                                      print( _endtime);
                                      setState(() {
                                        _endtime = datetime;
                                      });
                                    }),
                              ),
                              SizedBox(height: 30,),
                              RaisedButton(
                                child: Text("Submit"),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },)
                              ////container  - row - rasiedbutton(정렬)
                            ],
                          )
                      ),
                    ],
                  ),
                )
            ),
            )
          ],
        )
        )
    );
  }

  @override
  void dispose(){
    _sessionName.dispose();
    _offsession.dispose();
    _zoomlink.dispose();
    super.dispose();
  }
}