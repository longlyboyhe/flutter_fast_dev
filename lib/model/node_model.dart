import 'package:equatable/equatable.dart';

/// create by 老贺 on 2020-03-04
/// contact me by email 744359304@qq.com
/// 说明: 详情页节点-展示-数据模型


class NodeModel extends Equatable {
  final String name;
  final String subtitle;
  final String code;

  const NodeModel({this.name, this.subtitle, this.code});

  @override
  List<Object> get props => [name, subtitle, code];

  factory NodeModel.fromJson(Map<String, dynamic> map) {
    return NodeModel(
        name: map['name'],
        subtitle: map["subtitle"],
        code: map["code"]);
  }

  @override
  String toString() {
    return 'Node{name: $name, subtitle: $subtitle, code: $code}';
  }
}