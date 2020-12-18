import 'package:equatable/equatable.dart';


/// create by 老贺 on 2020-03-03
/// contact me by email 744359304@qq.com
/// 说明:

abstract class RecommendEvent extends Equatable {
  const RecommendEvent();
  @override
  List<Object> get props => [];
}

class EventUpdataData extends RecommendEvent {
  final List data;

  EventUpdataData(this.data);

}


