import 'dart:convert';

import 'package:cook_together/models/currencyModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiTestingTool extends StatefulWidget {
  const ApiTestingTool({super.key});

  @override
  State<ApiTestingTool> createState() => _ApiTestingToolState();
}

class _ApiTestingToolState extends State<ApiTestingTool> {
  Future<List<Data>> getData() async {
    final response =
    await http.get(Uri.parse('https://api.coinbase.com/v2/currencies'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body.toString());
      print(response.body);
      var currency = jsonResponse['data'] as List;

      return currency.map((item) => Data.fromJson(item)).toList();
    } else {
      throw Exception('Error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CurrencyModel',style: TextStyle(fontWeight: FontWeight.w800,fontStyle: FontStyle.italic,fontSize: 26),),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<Data>>(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder:(context, index) {
                return Container(
                  height: 300,
                  color: Colors.orange,child: Column(
                  children: [
                    Text(snapshot.data![index].name.toString()),
                    Text(snapshot.data![index].id.toString()),
                    Text(snapshot.data![index].minSize.toString()),
                  ],
                ),

                );
              },
            );
          }
          return CircularProgressIndicator();

        },
      ),
    );
  }

}
