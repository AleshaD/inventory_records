part of 'count_bloc.dart';

@immutable
abstract class CountState {}

class CountInitial extends CountState {
  CountInitial(List<CountItem> this.items);

  final List<CountItem> items;
}

class CountItemsFetchedState extends CountState {
  CountItemsFetchedState(
    List<CountItem> this.items,
  );

  final List<CountItem> items;
}

class CountItemChangedState extends CountState {
  CountItemChangedState(this.item);

  final CountItem item;
}

class CounItemsDeletedtState extends CountState {
  CounItemsDeletedtState();
}
