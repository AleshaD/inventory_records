part of 'count_bloc.dart';

@immutable
abstract class CountEvent {}

class CountBlocFetchItems extends CountEvent {}

class CountAddItemEvent extends CountEvent {
  CountAddItemEvent(this.item);

  final CountItem item;
}

class CountEditItemEvent extends CountEvent {
  CountEditItemEvent(this.item);

  final CountItem item;
}

class CountFetchedBySort extends CountEvent {
  CountFetchedBySort(this.sortBy);

  final String sortBy;
}

class CountDeleteItemEvent extends CountEvent {
  CountDeleteItemEvent(this.item);

  final CountItem item;
}

class DeleteAllItemsEvent extends CountEvent {}
