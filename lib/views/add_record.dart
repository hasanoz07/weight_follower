import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kilo_takipcisi/controllers/controller.dart';
import 'package:kilo_takipcisi/views/history.dart';

import 'package:numberpicker/numberpicker.dart';

class AddRecord extends StatefulWidget {
   AddRecord({Key? key}) : super(key: key);
  final Controller _controller = Get.put(Controller());
  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  int _selectedValue = 70;
  int _selectedValue1 = 450;
  DateTime? _selectedDateTime = DateTime.now();
  String? _noteValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Kayıt Oluştur"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    FontAwesomeIcons.weightScale,
                    size: 48,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            NumberPicker(
                              minValue: 40,
                              maxValue: 130,
                              value: _selectedValue,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _selectedValue = value;
                                  },
                                );
                              },
                              axis: Axis.horizontal,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey)),
                            ),
                            Icon(
                              FontAwesomeIcons.chevronUp,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            NumberPicker(
                              minValue: 0,
                              maxValue: 950,
                              value: _selectedValue1,
                              step: 50,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue1 = value;
                                });
                              },
                              axis: Axis.horizontal,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey)),
                            ),
                            Icon(
                              FontAwesomeIcons.chevronUp,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                pickDate(context);
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 40,
                        ),
                        Expanded(
                            child: Text(
                          DateFormat.yMMMEd('tr').format(_selectedDateTime ?? DateTime.now()),
                          textAlign: TextAlign.center,
                        ))
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Icon(
                        Icons.note,
                        size: 48,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextField(
                          onChanged: ((value) => _noteValue = value),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Not',
                            hintText: 'Notunuzu giriniz',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String currentWeightStr="$_selectedValue"+"."+"$_selectedValue1";
                var currentWeightInt=double.parse(currentWeightStr);
                widget._controller.addRecord(currentWeightInt, _selectedDateTime!, _noteValue??"");
                Get.to(HistoryScreen());
              },
              child: Text("Kayıt Ekle"),
              style: ElevatedButton.styleFrom(primary: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  void pickDate(BuildContext context) async {
    _selectedDateTime = await showDatePicker(
      builder: (BuildContext context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
                colorScheme: ColorScheme(
                    brightness: Brightness.light,
                    primary: Colors.black87,
                    onPrimary: Colors.white,
                    secondary: Colors.brown,
                    onSecondary: Colors.yellow,
                    error: Colors.red,
                    onError: Colors.redAccent,
                    background: Colors.blueAccent,
                    onBackground: Colors.blueGrey,
                    surface: Colors.black,
                    onSurface: Colors.black)),
            child: child ?? Text(""));
      },
      locale: Locale('tr'),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2050),
    );

    debugPrint(_selectedDateTime.toString());
    setState(() {});
  }
}
