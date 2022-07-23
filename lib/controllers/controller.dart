import 'package:get/get.dart';
import 'package:kilo_takipcisi/models/record.dart';


class Controller extends GetxController {
  var records = <Record>[

    
  ].obs;

  void addRecord(double weight,DateTime dateTime,String note){
    records.add(Record(weight: weight, dateTime: dateTime,note: note));
    print(records.length);
  }
  void deleteRecord(int index){
    records.removeAt(index);
  }
}
