
class MyData {
    bool completed;
    int id;
    String title;
    int userId;

    MyData({this.completed, this.id, this.title, this.userId});

    factory MyData.fromJson(Map<String, dynamic> json) {
        return MyData(
            completed: json['completed'], 
            id: json['id'], 
            title: json['title'], 
            userId: json['userId'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['completed'] = this.completed;
        data['id'] = this.id;
        data['title'] = this.title;
        data['userId'] = this.userId;
        return data;
    }
}