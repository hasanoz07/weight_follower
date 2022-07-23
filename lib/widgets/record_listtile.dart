import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kilo_takipcisi/controllers/controller.dart';
import 'package:kilo_takipcisi/models/record.dart';


class RecordListTile extends StatefulWidget {
  final Record record;
  final int index;
  const RecordListTile({Key? key, required this.index, required this.record}) : super(key: key);

  @override
  State<RecordListTile> createState() => _RecordListTileState();
}

class _RecordListTileState extends State<RecordListTile> {
  @override
  // ignore: override_on_non_overriding_member
  final Controller _controller = Get.put(Controller());
  Widget build(BuildContext context) {
    initializeDateFormatting("tr");
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: _buildDate(),
          title: _buildWeight(),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.record.note ?? ""),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  _controller.deleteRecord(widget.index);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center _buildWeight() => Center(
          child: Text(
        widget.record.weight.toString(),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ));

  Text _buildDate() {
    return Text(DateFormat.yMMMEd('tr').format(widget
            .record.dateTime) //Üreteceği tarih formatı: 31 Ağu 2019 Cmt //Üreteceği tarih formatı: 31 Ağu 2019 Cmt
        );
  }
}
