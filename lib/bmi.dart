import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'hasil.dart';
import 'profil.dart';

class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  DateTime detetime;
  int tinggi = 0;
  int berat = 0;
  String _nama = "";
  int _umur = 0;
  List<String> kelamin = ["Laki-Laki", "Perempuan"];
  String _kelamin ;

  void pilihJK(String value) {
    setState(() {
      _kelamin = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[50],
      appBar: AppBar(
        //backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text('MENGHITUNG BMI'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset(
                'images/bmi.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              child: TextField(
                  decoration: InputDecoration(labelText: 'Nama Lengkap'),
                  onChanged: (String nama) {
                    setState(() {
                      _nama = nama;
                    });
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              child: DropdownButton(
                hint: Text("Pilih Gender"),
                onChanged: (String value) {
                  pilihJK(value);
                },
                value: _kelamin,
                items: kelamin.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(labelText: 'Umur'),
                onChanged: (txt) {
                  setState(() {
                    _umur = int.parse(txt);
                  });
                },
                keyboardType: TextInputType.number,
                maxLength: 3,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                // color: Colors.blue[700],
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (txt) {
                          setState(() {
                            tinggi = int.parse(txt);
                          });
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            suffix: Text('cm'),
                            filled: true,
                            labelText: 'Tinggi'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (txt) {
                          setState(() {
                            berat = int.parse(txt);
                          });
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            suffix: Text('kg'),
                            filled: true,
                            labelText: 'Berat'),
                      ),
                    ),
                  ],
                )),
            Container(
              //height: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BMIResult(
                            kelamin: _kelamin,
                            input_umur: _umur,
                            input_nama: _nama,
                            tinggi_badan: tinggi,
                            berat_badan: berat)),
                  );
                },
                padding: EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.grey,
                // textColor: Colors.white,
                child: Text(
                  'HITUNG BMI',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              //height: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HalamanSatu()),
                  );
                },
                padding: EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.grey,
                // textColor: Colors.white,
                child: Text(
                  'ABOUT',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}