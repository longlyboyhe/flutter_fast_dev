import 'package:equatable/equatable.dart';


/// create by 老贺 on 2020-03-03
/// contact me by email 744359304@qq.com
/// 说明:

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class EventTabTap extends HomeEvent {
  final int currentIndex;

  EventTabTap(this.currentIndex);

}


