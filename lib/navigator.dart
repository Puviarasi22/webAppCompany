
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorIn extends StatefulWidget {
  @override
  _NavigatorInState createState() => _NavigatorInState();
}

class _NavigatorInState extends State<NavigatorIn> {



  var king;
  var kingname;
  bool showMedical=false;
  var textsearch;
  List<Employees> searchedText=[];
  @override
  Widget build(BuildContext context) {
    makeChange();


    if(searchedText.isNotEmpty){
      setState(() {

        _employeeslist=searchedText;
      });
    }

    return Scaffold(
        body:
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
                          Flexible(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              elevation: 20,
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
                                          child: Text("List of Employees",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                        ),

                                        Container(
                                          width: 200,
                                          child: TextFormField(

                                            decoration: InputDecoration(labelText: "Search Employee",prefixIcon: Icon(Icons.search)),
                                            onChanged: (val){
                                             setState(() {
                                               textsearch=val;
                                               print(textsearch);
                                               if(textsearch==""){
                                                 searchedText=_employeeslist;
                                               }
                                               for(var i=0;i<_employeeslist.length;i++){
                                                 if(_employeeslist[i].name==textsearch){
                                                   searchedText.add(_employeeslist[i]);
                                                 }
                                               }
                                               print(searchedText);
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

                                           width: MediaQuery.of(context).size.width/2.5,
                                           child: DataTable(

                                             columns: <DataColumn>[
                                               DataColumn(
                                                 label: const Text('Emp.No',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black87),),

                                               ),
                                               DataColumn(
                                                 label: const Text('Name',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black87),),

                                               ),
                                               DataColumn(
                                                 label: const Text('Department',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black87),),

                                               ),

                                             ],

                                             rows:_employeeslist.map((Employees e) => DataRow(

                                                 cells: [
                                               DataCell(Text("${e.Empno}"),onTap: (){
                                                 setState(() {
                                                   king=e.Empno;
                                                   kingname=e.name;
                                                   showMedical=true;
                                                 });
                                               }),
                                               DataCell(Text("${e.name}"),onTap: (){
                                                 setState(() {
                                                   king=e.Empno;
                                                   kingname=e.name;
                                                   showMedical=true;
                                                 });
                                               }),
                                               DataCell(Text("${e.Depart}"),onTap: (){
                                                 setState(() {
                                                   king=e.Empno;
                                                   kingname=e.name;
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
                          ),
                          showMedical?
                          Flexible(
                            child: Card(
                              elevation: 20,
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
                                          width: 10,
                                        ),
                                        Text("(Employee Name: $kingname)"),
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
                            ),
                          ):SizedBox.shrink()
                        ],
                      ),
                  ),
                )

    );


  }
  void makeChange(){
    switch(king){
      case 1:
        setState(() {
          smaplelist= [{"Sno":1,"Temp":37,"spo2":96,"bpm":50,"hum":54,"dateIn":"19-02-2021"},
            {"Sno":2,"Temp":38,"spo2":97,"bpm":59,"hum":55,"dateIn":"19-02-2021"},
            {"Sno":3,"Temp":38,"spo2":94,"bpm":52,"hum":60,"dateIn":"19-02-2021"},
            {"Sno":4,"Temp":36,"spo2":92,"bpm":53,"hum":65,"dateIn":"19-02-2021"},
            {"Sno":5,"Temp":37,"spo2":93,"bpm":60,"hum":50,"dateIn":"19-02-2021"}];
        });
        break;
        case 2:
          setState(() {
            smaplelist= [{"Sno":1,"Temp":37,"spo2":96,"bpm":59,"hum":50,"dateIn":"19-02-2021"},
              {"Sno":2,"Temp":36,"spo2":50,"bpm":96,"hum":52,"dateIn":"19-02-2021"}];
          });
          break;
       case 3:
        setState(() {
          smaplelist= [{"Sno":1,"Temp":37,"spo2":96,"bpm":59,"hum":50,"dateIn":"19-02-2021"}
            ];
        });
        break;
      case 4:
        setState(() {
          smaplelist= [{"Sno":1,"Temp":37,"spo2":96,"bpm":59,"hum":50,"dateIn":"19-02-2021"},
            {"Sno":2,"Temp":37,"spo2":93,"bpm":60,"hum":50,"dateIn":"19-02-2021"}
          ];
        });
        break;
      case 5:
        setState(() {
          smaplelist= [{"Sno":1,"Temp":37,"spo2":96,"bpm":59,"hum":50,"dateIn":"19-02-2021"},
            {"Sno":2,"Temp":37,"spo2":93,"bpm":60,"hum":50,"dateIn":"19-02-2021"}
          ];
        });
        break;

    }
  }



}

List smaplelist=[];

class Employees {
  Employees(this.Empno, this.name, this.Depart);
  final int Empno;
  final String name;
  final String Depart;

}

 List<Employees> _employeeslist = <Employees>[


  Employees(1, 'Puvi', 'Technical Lead' ),
  Employees(2, 'Bala', 'Technical Lead'),
  Employees(3, 'suba', 'Project Manager'),
  Employees(4, 'Preetha', 'Software Developer'),
  Employees(5, 'Ishu', 'Software Technician'),





];




