import 'dart:convert';

import 'package:api/forth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class therd extends StatefulWidget {
  const therd({super.key});

  @override
  State<therd> createState() => _therdState();
}

class _therdState extends State<therd> {
  Future getdata() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
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
      backgroundColor: Color.fromARGB(255, 241, 237, 237),
      body: SafeArea(
        child: Column(
          children: [
            textfild(),
            Expanded(
              child: FutureBuilder(
                  future: getdata(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, e) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 9,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  child: Center(
                                    child: Text(
                                      snapshot.data[e]['id'].toString() + "-",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data[e]['name'],
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      snapshot.data[e]['email'],
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pushNamed(
                                        context,
                                        '/forth',
                                        arguments: {
                                          'id': snapshot.data[e]['id'],
                                          'name': snapshot.data[e]['username'],
                                          'email': snapshot.data[e]['email'],
                                          'phone': snapshot.data[e]['phone'],
                                          'website': snapshot.data[e]
                                              ['website'],
                                          'company': snapshot.data[e]
                                              ['company'],
                                          'address': snapshot.data[e]
                                              ['address'],
                                        },
                                      );
                                    });
                                  },
                                  icon: const Icon(Icons.arrow_forward_ios),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class textfild extends StatelessWidget {
  const textfild({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 44),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          labelText: 'Search',
          labelStyle: TextStyle(color: Colors.black),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }
}
