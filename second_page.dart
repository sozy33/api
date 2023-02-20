import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  //get id by arguments

  Future getdata(id) async {
    var url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/' + id.toString());
    var response = await get(url);
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>; 
    return Scaffold(
      appBar: AppBar(
        title: const Text('API'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getdata(routes['id']),
          builder: (context, snapshot) {
            // context wata wegtakan wa snapshot wata datai naw methodaka
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                margin: EdgeInsets.all(60),
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 226, 219, 219),
                    
                    ),
                child: ListView(
                  padding: EdgeInsets.all(15),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Text(
                      "ID POST" + snapshot.data['id'].toString(),
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Title" + snapshot.data['title'],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Body" + snapshot.data['body'],
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text("Loading.."),
              );
            }
          }),
    );
  }
}
