
import 'MyData.dart';

class TodoResponse {
    List<MyData> myData;

    TodoResponse({this.myData});

    factory TodoResponse.fromJson(Map<String, dynamic> json) {
        return TodoResponse(
            myData: json['myData'] != null ? (json['myData'] as List).map((i) => MyData.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.myData != null) {
            data['myData'] = this.myData.map((v) => v.toJson()).toList();
        }
        return data;
    }
}