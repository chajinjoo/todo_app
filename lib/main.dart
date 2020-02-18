import 'package:flutter/material.dart';
import 'package:todo_app/pages/event_page.dart';
import 'package:todo_app/pages/task_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //정적위젯
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //ThemeData : 앱의 기본적인 디자인 테마를 지정하는 곳으로 이것 역시 argument를 가짐
        primarySwatch: Colors.red,
        //primarySwatch : 기본적으로 사용할 색상 견본을 의미 (특정 색의 음영들을 기본 색상으로 지정하겠다)
        fontFamily: 'Montserrat',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //동적위젯(상태변화)
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //동적위젯(상태변화)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //상자의 가장자리를 기준으로 자식을 배치하는 위젯. 여러 자식 요소를 겹칠 수 있음
        children: <Widget>[
          Container(
            height: 45.0,
            color: Theme.of(context).accentColor,
          ),
          Positioned(
            //Stack 위젯은 Position을 이용하여 배치해준다.
            right: 0,
            child: Text(
              '6',
              style: TextStyle(fontSize: 200.0, color: Color(0x10000000)),
            ),
          ),
          _mainContent(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        //하단 +버튼
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //하단 + 버튼 가운데 정렬
      bottomNavigationBar: BottomAppBar(
        //하단 네비게이션 바
        shape: CircularNotchedRectangle(), //하단 네비게이션바 +버튼 모양대로 시트 패임 효과
        child: Row(
          //가로정렬
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //Row니까 children 요소들이 주축에 따라 가로 정렬
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Column _mainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, //column이니까 가로로 시작지점 정렬
      children: <Widget>[
        SizedBox(
          height: 60.0,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Monday',
            style: TextStyle(
                fontSize: 50.0,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Anton'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: _button(context),
        ),
        SizedBox(
          height: 16.0,
        ),
        Expanded(
          child: EventPage(),
        ),
      ],
    );
  }

  Widget _button(BuildContext context) {
    //복잡한 레이아웃을 단순화하고 싶을때 위젯을 메소드로 추출해줌 (전구누르고 Extract method 클릭. 위젯명 변경가능)
    return Row(
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            //모서리가 살짝 둥근 네모 버튼
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), //모서리 둥글게
            ),
            child: Text('Tasks'),
            textColor: Colors.white,
            color: Theme.of(context).accentColor,
            //현재 주어진 context에서 위로 올라가면서 가장 가까운 Theme을 찾아서 그 color를 반환하라
            padding: const EdgeInsets.all(14.0),
            //const = 컴파일 시점에 상수가 되는데 암묵적으로는 final이라 함
            // textColor: Colors.white,
          ),
        ),
        SizedBox(
          width: 32.0,
        ),
        Expanded(
          child: MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).accentColor), //보더선
                borderRadius: BorderRadius.circular(12.0)),
            child: Text('Events'),
            textColor: Theme.of(context).accentColor,
            color: Colors.white,
            padding: const EdgeInsets.all(14.0),
          ),
        ),
      ],
    );
  }
}
