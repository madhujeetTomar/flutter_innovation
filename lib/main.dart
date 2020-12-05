import 'package:flutter/material.dart';
import 'package:flutterinnovation/employee/employee.dart';
import 'package:flutterinnovation/employee/employee_bloc.dart';
import 'package:flutterinnovation/productdetail/product_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: "Employee App",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void dispose() {
    _employeeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.getEmployeeListStream,
          builder: (BuildContext context,
              AsyncSnapshot<List<Employee>> snapshot) {
            return ListView.builder(itemCount: snapshot?.data?.length,
                itemBuilder: (context, index) {
                  return Card(elevation: 5.0,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("${snapshot.data[index].getId()}."),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${snapshot.data[index].getName()}.",
                              style: TextStyle(fontSize: 18),),
                            Text("${snapshot.data[index].getSalary()}.",
                              style: TextStyle(fontSize: 18),),

                          ],
                        ),
                        Container(child: IconButton(icon: Icon(
                            Icons.thumb_up),
                          color: Colors.green,
                          onPressed: () {
                            setState(() {
                              _employeeBloc.getEmployeeIncrementSalary.add(snapshot.data[index]);

                            });
                          }
                          ,)
                          ,
                        ),

                        Container(child: IconButton(icon: Icon(
                            Icons.thumb_down),
                          color: Colors.red,
                          onPressed: () {
    setState(() {
                            _employeeBloc.getEmployeeDecrementSalary.add(snapshot.data[index]);
    });
                          }
                          ,)
                          ,
                        ),

                      ],),
                  );
                });
          },
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
