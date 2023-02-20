import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future getdata() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await get(url);
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // context wata wegtakan wa snapshot wata datai naw methodaka
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, e) {
                  return ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Center(
                        child: Text(
                          snapshot.data[e]['id'].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    title: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/second',
                          arguments: {
                            'id': snapshot.data[e]['id'],
                          },
                        );
                      },
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: snapshot.data[e]['title'],
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    subtitle: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                          text: snapshot.data[e]['body'],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 148, 140, 140),
                            fontSize: 15,
                            letterSpacing: 1,
                            wordSpacing: 1,
                          )),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text("Loading...."));
            }
          }),
    );
  }
}
