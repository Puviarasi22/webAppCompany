import 'package:flutter/material.dart';

class SectorIn extends StatefulWidget {
  @override
  _SectorInState createState() => _SectorInState();
}

class _SectorInState extends State<SectorIn> {
  var king;

  bool showMedical=false;
  var textsearch;
  List<Employees> searchedText=[];
  @override
  Widget build(BuildContext context) {
    makeChange();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image:DecorationImage(
                      image:AssetImage("assets/emprec.jpg"),

                      fit: BoxFit.cover
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: showMedical?MainAxisAlignment.spaceAround:MainAxisAlignment.center,
                  children: [
                    Card(
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height/1.5,

                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Wrap(
                              spacing: MediaQuery.of(context).size.width/10,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("List of Department",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                ),

                                Container(
                                  width: 200,
                                  child: TextFormField(

                                    decoration: InputDecoration(labelText: "Search Department",prefixIcon: Icon(Icons.search)),
                                    onChanged: (val){
                                      setState(() {
                                        textsearch=val;
                                        List dummyin =[];
                                        for(var item in _employeeslist){
                                          dummyin.add(item.name);
                                        }
                                        // if(dummyin.contains(textsearch)){
                                        //   searchedText.
                                        // }

                                      });
                                    },

                                  ),
                                )
                              ],
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(

                                  width: MediaQuery.of(context).size.width/3,
                                  child: DataTable(

                                    columns: <DataColumn>[
                                      DataColumn(
                                        label: const Text('Emp.No',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black87),),

                                      ),
                                      DataColumn(
                                        label: const Text('Department',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black87),),

                                      ),


                                    ],

                                    rows:_employeeslist.map((Employees e) => DataRow(

                                        cells: [
                                          DataCell(Text("${e.Empno}"),onTap: (){
                                            setState(() {
                                              king=e.name;

                                              showMedical=true;
                                            });
                                          }),
                                          DataCell(Text("${e.name}"),onTap: (){
                                            setState(() {
                                              king=e.name;

                                              showMedical=true;
                                            });
                                          }),

                                        ])).toList(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    showMedical?
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height/1.5,

                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("Medical Records",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("(Departments: $king)"),

                              ],
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  child: DataTable(

                                    columns: <DataColumn>[
                                      DataColumn(
                                        label: const Text('S.No',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black87),),

                                      ),
                                      DataColumn(
                                        label: const Text('Name',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black87),),

                                      ),
                                      DataColumn(
                                        label: const Text('Temperature',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black87),),

                                      ),
                                      DataColumn(
                                        label: const Text('SPO2',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black87),),
                                      ),
                                      DataColumn(
                                        label: const Text('BPM',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black87),),
                                      ),
                                      DataColumn(
                                        label: const Text('Humidity',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black87),),
                                      ),
                                      DataColumn(
                                        label: const Text('Data&Time',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black87),textAlign: TextAlign.center,),
                                        numeric: false,
                                      ),

                                    ],
                                    rows: smaplelist.map((e) => DataRow(cells: [
                                      DataCell(Text("${e["Sno"]}")),
                                      DataCell(Text("${e["name"]}")),
                                      DataCell(Text("${e["Temp"]}")),
                                      DataCell(Text("${e["spo2"]}")),
                                      DataCell(Text("${e["bpm"]}")),
                                      DataCell(Text("${e["hum"]}")),
                                      DataCell(Text("${e["dateIn"]}"))

                                    ])).toList(),

                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ):SizedBox.shrink()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void makeChange(){

    switch(king){

      case "Technical Lead":
        setState(() {
          smaplelist= [{"Sno":1,"name":"Puvi","Temp":37,"spo2":96,"bpm":50,"hum":54,"dateIn":"19-02-2021"},
            {"Sno":2,"name":"Bala","Temp":37,"spo2":96,"bpm":59,"hum":50,"dateIn":"19-02-2021"},
           ];
        });
        break;
      case "Project Manager":
        setState(() {
          smaplelist= [{"Sno":1,"name":"suba","Temp":37,"spo2":96,"bpm":59,"hum":50,"dateIn":"19-02-2021"}
          ];
        });
        break;
      case "Software Developer":
        setState(() {
          smaplelist= [{"Sno":1,"name":"Preetha","Temp":37,"spo2":96,"bpm":59,"hum":50,"dateIn":"19-02-2021"}
          ];
        });
        break;
      case "Software Technician":
        setState(() {
          smaplelist= [{"Sno":1,"name":"Ishu","Temp":37,"spo2":96,"bpm":59,"hum":50,"dateIn":"19-02-2021"}
          ];
        });
        break;
    }

  }

List smaplelist=[];

List<Employees> _employeeslist = <Employees>[

  Employees(1, 'Technical Lead' ),
  Employees(2, 'Project Manager'),
  Employees(3, 'Software Developer'),
  Employees(4, 'Software Technician'),

];
}
class Employees {
  Employees(this.Empno, this.name);
  final int Empno;
  final String name;

}

