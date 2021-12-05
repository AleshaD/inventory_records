part of 'count_bloc.dart';

@immutable
abstract class CountState {}

class CountInitial extends CountState {
  CountInitial(List<CountItem> this.items);

  final List<CountItem> items;
}

class CountItemsUpdatedState extends CountState {
  CountItemsUpdatedState(
    List<CountItem> this.items,
  );

  final List<CountItem> items;
}

class CountItemChanged extends CountState {
  CountItemChanged(this.item);

  final CountItem item;
}

class CounItemsDeletedtState extends CountState {
  CounItemsDeletedtState();
}
