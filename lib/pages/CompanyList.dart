
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


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

  void  getData() async {

    Response response;
    Dio dio = new Dio();
    response = await dio.get("http://192.168.1.5:8080/company/?max=10&offset=0");
    var company = response.data;

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

  void sortData( ) async {

    Response response;
    Dio dio = new Dio();
    response = await dio.get("http://192.168.1.5:8080/company/?max=10&offset=0");
    var company = response.data;

    this.setState(() {
      companyDTO = company["company"];
    });

    print('data: $companyDTO');

  }

  List<DataRow> _getCompanyData(List listOfData) {
    List<DataRow> rows = [];
    var sizeof = listOfData == null ?0 : listOfData.length;
    for(var i = 0; i < sizeof; i++){
      rows.add(DataRow(
        cells: [
          DataCell(Text(listOfData[i]["id"].toString())),
          DataCell(Text(listOfData[i]["name"].toString()))
        ]
      )
      );
    }
    return rows;
  }


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
            DataColumn(label: Text("ID"),onSort: null),
            DataColumn(label: Text("Name"),onSort: null)
          ],
          rows:_getCompanyData(companyDTO),
      ),)
    );

  }

}