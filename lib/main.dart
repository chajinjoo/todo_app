import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //정적위젯
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //ThemeData : 앱의 기본적인 디자인 테마를 지정하는 곳으로 이것 역시 argument를 가짐
        primarySwatch: Colors.red,
        //primarySwatch : 기본적으로 사용할 색상 견본을 의미 (특정 색의 음영들을 기본 색상으로 지정하겠다)
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
      body: Center(
        child: Text(
          '안녕',
        ),
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
          //children 요소들이 주축에 따라 수직 정렬
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
}
