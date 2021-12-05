import 'package:bloc/bloc.dart';
import 'package:inventory/models/count_item.dart';
import 'package:inventory/providers/storage_provider.dart';
import 'package:meta/meta.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc(this.storage) : super(CountInitial([])) {
    on<CountBlocDoInitialFetch>((event, emit) async {
      emit(await _fetchItems());
    });

    on<CountAddItemEvent>((event, emit) {
      emit(_addItem(event.item));
    });

    on<CountEditItemEvent>((event, emit) {
      emit(_editItem(event.item));
    });

    on<CountDeleteItemEvent>((event, emit) async {
      emit(await _deleteItem(event.item));
    });

    this.add(CountBlocDoInitialFetch());
  }

  final StorageProvider storage;

  Future<CountState> _fetchItems() async {
    var items = await storage.fetchCountItems();
    return CountItemsUpdatedState(items);
  }

  CountState _addItem(CountItem item) {
    storage.insertCountItem(item);
    return CountItemChanged(item);
  }

  CountState _editItem(CountItem item) {
    storage.updateCountItem(item);
    return CountItemChanged(item);
  }

  Future<CountState> _deleteItem(CountItem item) async {
    storage.deleteCountItem(item.id);
    var items = await storage.fetchCountItems();
    return CountItemsUpdatedState(items);
  }
}
