import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kilo_takipcisi/controllers/controller.dart';
import 'package:kilo_takipcisi/widgets/record_listtile.dart';

import '../models/record.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    List<Record>records=_controller.records;
    return Obx(
      (() => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("History"),
            
          ),
          body: records.isEmpty
              ? Center(
                  child: Container(child: Text("Daha önce hiçbir kilo verisi girilmemiş.")),
                )
              : ListView.builder(reverse: false,
                  physics: BouncingScrollPhysics(),
                  itemCount: records.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RecordListTile(
                      record: records[index],
                      index: index,
                    );
                  },
                ))),
    );
  }
}
