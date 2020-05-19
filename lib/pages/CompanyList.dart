
import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:qnetmobile/model/company.dart';


class CompanyList extends StatefulWidget {
  CompanyList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {

  var companyDTO;
  var count=0;
  var page=1;
  var totalpages=1;
  final List<Map<String, String>> listOfColumns = [
    {"Name": "AAAAAA", "Number": "1", "State": "Yes"},
    {"Name": "BBBBBB", "Number": "2", "State": "no"},
    {"Name": "CCCCCC", "Number": "3", "State": "Yes"}
  ];

  void  getData() async {
    var response = await http.get(
      "http://192.168.1.5:8080/company/?max=10&offset=0",

    );

//    Response response;
//    Dio dio = new Dio();
//    response = await dio.get("http://192.168.1.5:8080/company/?max=10&offset=0");
//    var company = response.data;

    var company = json.decode(response.body);

    this.setState(() {
      companyDTO = company["company"];
    });

    print('data: $companyDTO');
  }

  @override
  void initState(){
    super.initState();
    this.getData();
    print("Company page");
  }

  DataRow _getDataRow(index) {
    return DataRow(
      cells: <DataCell>[
       // DataCell(Text(companyDTO[index]["id"])??"Empty"),
        //DataCell(Text(companyDTO[index]["name"])??"Empty"),
        DataCell(Text(index)),
      ],
    );
  }

  Widget _getCompanyData(List listOfData) {
    List<DataRow> rows = [];

    listOfData.forEach((stat){
      stat.item.forEach((row){
        rows.add(
            DataRow(
                cells: [
                  DataCell(
                    Text(row.symbol),
                  ),
                  DataCell(
                    Text(row.amount),
                  ),
                  DataCell(
                    Text("${row.symbol}"),
                  ),
                ]
            )
        );
      });
    });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      body: Container(),
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Container(
        child:DataTable(
          columns: [
            DataColumn(label: Text("ID")),
            DataColumn(label: Text("Name"))
          ],
          rows: _getCompanyData(),
      ),)
    );

  }

}