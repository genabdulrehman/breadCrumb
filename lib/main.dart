import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/addNewBreadCrumb.dart';
import 'package:provider_app/breadCrumb_provider.dart';
import 'package:provider_app/breadCrumb_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => BreadCrumbProvider()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
        routes: {
          '/new': (context) => AddNewBreadCrumb(),
          '/home': (context) => Material(),
          '/DriverScreen': (context) => Material(),
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<BreadCrumbProvider>(context).items;
    // print(provider[1].title);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          Consumer<BreadCrumbProvider>(builder: ((context, value, child) {
            return BreadCrumbWidget(breadCrumb: value.items);
          })),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/new');
            },
            child: Text("Add new Bread Crumb"),
          ),
          TextButton(
            onPressed: () {
              context.read<BreadCrumbProvider>().reset();
            },
            child: Text("Reset"),
          ),
        ],
      ),
    );
  }
}
