import 'dart:convert';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterexperience/api/api_integration/details_page.dart';
import 'package:http/http.dart' as http;

import 'logic_data.dart';

class ApiIntegration extends StatelessWidget {
  const ApiIntegration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          "Api Integration",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: FutureBuilder(
          future: ProductService().getProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0.5,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ApiDetailsPage(
                                  id: snapshot.data[index]['id'],
                                )));
                      },
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(height: 15),
                          Image.network(snapshot.data[index]['image'],
                              width: 65),
                          SizedBox(height: 15),
                          Text(snapshot.data[index]['category']),
                          SizedBox(height: 5),
                          Text(
                            "\$ ${snapshot.data[index]['price'].toString()}",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
