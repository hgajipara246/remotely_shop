// ignore_for_file: camel_case_types, non_constant_identifier_names

class RemotelyModel {
  List<workspasesmodel>? workSpasesData;

  RemotelyModel({
    this.workSpasesData,
  });

  RemotelyModel.fromjson(Map<String, dynamic> json) {
    workSpasesData = ((json["workspasesmodel"] ?? []) as List).map((value) => workspasesmodel.fromjson(value)).toList();
  }
}

class workspasesmodel {
  String? image;
  String? Post;
  String? suggestion;

  workspasesmodel({
    this.image,
    this.Post,
    this.suggestion,
  });

  workspasesmodel.fromjson(Map<String, dynamic> json) {
    image = json["image"];
    Post = json["Post"];
    suggestion = json["suggestion"];
  }
}
