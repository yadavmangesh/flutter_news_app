
class Source{

  String id;

  String sourceName;

  Source({this.id,this.sourceName});

  factory Source.fromJson(Map<String,dynamic> json){
    return Source(

      id: json['id'].toString(),
      sourceName: json['name'].toString()
    );
  }
}