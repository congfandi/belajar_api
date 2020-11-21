class MyModel {
    String id;
    String name;

    MyModel({this.id, this.name});

    factory MyModel.fromJson(Map<String, dynamic> json) {
        return MyModel(
            id: json['id'], 
            name: json['name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        return data;
    }
}