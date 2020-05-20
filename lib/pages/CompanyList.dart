
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
  var sort="id";
  var order="asc";
  var page=1;
  var totalpages=1;
  bool sortasc = true;
  int colindex =0;

  void  getData() async {

    Response response;
    Dio dio = new Dio();
    response = await dio.get("http://192.168.1.5:8080/company/?max=10&offset=0&sort=$sort&order=$order");
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

   sortData(String sortname,int columnIndex, bool ascending) async{
    this.setState(() {
      sortasc=!sortasc;
      colindex=columnIndex;
    });
       if (ascending) {
         this.setState(() {
           sort=sortname;
           order="asc";
         });
       } else {
         this.setState(() {
           sort=sortname;
           order="desc";
         });
       }

     print("The sort is "+sort);
     print("The order is "+order);
       print("The Column index is "+columnIndex.toString());
     print("The ascending is "+ascending.toString());

    Response response;
    Dio dio = new Dio();
    response = await dio.get("http://192.168.1.5:8080/company/?max=10&offset=0&sort=$sort&order=$order");
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
          sortAscending: sortasc,
          sortColumnIndex: colindex,
          columns: [
            DataColumn(label: Text("ID"),
                onSort:(columnIndex, ascending) {
              sortData("id",columnIndex, ascending);
            }),
            DataColumn(label: Text("Name"),
                onSort: (columnIndex, ascending) {
                  sortData("name",columnIndex, ascending);
                })
          ],
          rows:_getCompanyData(companyDTO),
      ),)
    );

  }

}