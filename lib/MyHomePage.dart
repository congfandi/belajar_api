import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/TodoResponse.dart';
import 'package:http/http.dart' as http;

import 'model/MyData.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  getData() async {
    setState(() {
      loading = true;
    });
    var response = await http.get("https://jsonplaceholder.typicode.com/todos");
    String myData = "{\"myData\":${response.body}\}";
    print("resopnse {\"myData\":${response.body}\}");
    setState(() {
      loading = false;
      TodoResponse todoResponse = TodoResponse.fromJson(jsonDecode(myData));
      todoData = todoResponse.myData;
    });
  }

  bool loading = true;

  List<MyData> todoData = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contoh API"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData();
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: loading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemBuilder: (c, i) => Container(
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Data ID Orang = ${todoData[i].userId}"),
                        Text("Judul = ${todoData[i].title}"),
                        Text(
                            "Apkah selesai = ${todoData[i].completed}")
                      ],
                    ),
                  ),
                ),
                itemCount: todoData.length,
              ),
      ),
    );
  }
}
