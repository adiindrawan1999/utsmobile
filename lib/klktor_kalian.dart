import 'package:flutter/material.dart';

class KalkulatorKalian extends StatefulWidget {
  @override
  _KalkulatorKalianState createState() => _KalkulatorKalianState();
}

class _KalkulatorKalianState extends State<KalkulatorKalian> {
  //Registrasi kontoler anggo text field
  final kontrolerA = TextEditingController();
  final kontrolerB = TextEditingController();
  final form_key = GlobalKey<FormState>();

  String hasil = ""; //anggo menampilkan hasil
 
  
  //fungsi Perkalian
  void Kalian() {
    if (form_key.currentState.validate()) {
      int var_A = int.parse(kontrolerA.text);
      int var_B = int.parse(kontrolerB.text);
      int result = var_A * var_B;
      setState(() {
        hasil = "$result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perkalian'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Form(
            key: form_key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: kontrolerA,
                  //validasi untuk memastikan bahwa kotak sudah diisi
                  validator: (value) {
                    if (value.isEmpty) return "Masukan Angkanya Bang";
                  },
                  decoration: InputDecoration(
                    hintText: "Masukkan Angka",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: kontrolerB,
                  //validasi untuk memastikan bahwa kotak sudah diisi
                  validator: (value) {
                    if (value.isEmpty) return "Masukan Angkanya Bang";
                  },
                  decoration: InputDecoration(
                    hintText: "Masukkan Angka",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  height:30,
                  width: 100,
                  child: Text(
                    hasil,
                    style: TextStyle(fontSize: 20,),
                  ),
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(5),color: Colors.grey
                    )
                  ),
                RaisedButton(
                  onPressed: Kalian,
                  child: Text("Kalikan"),
                )
              ],
            )),
      ),
    );
  }
}
