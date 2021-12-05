part of 'count_bloc.dart';

@immutable
abstract class CountEvent {}

class CountBlocFetchItems extends CountEvent {}

class CountAddItemEvent extends CountEvent {
  final CountItem item;
  CountAddItemEvent(this.item);
}

class CountEditItemEvent extends CountEvent {
  final CountItem item;
  CountEditItemEvent(this.item);
}

class CountDeleteItemEvent extends CountEvent {
  final CountItem item;
  CountDeleteItemEvent(this.item);
}

class DeleteAllItemsEvent extends CountEvent {}
