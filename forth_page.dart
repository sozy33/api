import 'dart:convert';

import 'package:api/components/icon.dart';
import 'package:api/components/myTile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class forth extends StatefulWidget {
  forth({super.key, this.add});
  var add;

  @override
  State<forth> createState() => _forthState();
}

class _forthState extends State<forth> {
  //get id by arguments

  Future getdata(id) async {
    var url = Uri.parse(
        'https://jsonplaceholder.typicode.com/users/' + id.toString());
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                width: 800,
                height: 800,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 226, 219, 219),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Icon(
                        Icons.person_pin,
                        size: 100,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTile(
                      value: snapshot.data['username'],
                      icon: Icons.person,
                    ),
                    SizedBox(height: 20),
                    MyTile(
                      value: snapshot.data['phone'],
                      icon: Icons.phone,
                    ),
                    SizedBox(height: 20),
                    MyTile(
                      value: snapshot.data['website'],
                      icon: Icons.web,
                    ),
                    SizedBox(height: 20),
                    MyTile(
                      value: snapshot.data['address']['street'],
                      icon: Icons.home,
                    ),
                    SizedBox(height: 20),
                    MyTile(
                      value: snapshot.data['address']['suite'],
                      icon: Icons.home,
                    ),
                    SizedBox(height: 20),
                    MyTile(
                      value: snapshot.data['address']['city'],
                      icon: Icons.home,
                    ),
                    SizedBox(height: 20),
                    MyTile(
                      value: snapshot.data['address']['zipcode'],
                      icon: Icons.home,
                    ),
                    SizedBox(height: 20),
                    MyTile(
                      value: snapshot.data['company']['name'],
                      icon: Icons.work,
                    ),
                    SizedBox(height: 20),
                    MyTile(
                      value: snapshot.data['company']['catchPhrase'],
                      icon: Icons.work,
                    ),
                    SizedBox(height: 20),
                    MyTile(
                      value: snapshot.data['company']['bs'],
                      icon: Icons.work,
                    ),
                    SizedBox(height: 20),
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
//https://www.mobilhanem.com/recyclerview-searchview-retrofit-kullanimi/
