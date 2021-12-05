import 'package:bloc/bloc.dart';
import 'package:inventory/models/count_item.dart';
import 'package:inventory/providers/storage_provider.dart';
import 'package:meta/meta.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc(this.storage) : super(CountInitial([])) {
    on<CountBlocFetchItems>((event, emit) async {
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

    on<DeleteAllItemsEvent>((event, emit) async {
      emit(await _delAllItems());
    });

    this.add(CountBlocFetchItems());
  }

  final StorageProvider storage;

  Future<CountState> _fetchItems() async {
    if (!storage.inited) await storage.init();
    var items = await storage.fetchCountItems();
    return CountItemsFetchedState(_sortedItems(items));
  }

  CountState _addItem(CountItem item) {
    storage.insertCountItem(item);
    return CountItemChangedState(item);
  }

  CountState _editItem(CountItem item) {
    storage.updateCountItem(item);
    return CountItemChangedState(item);
  }

  Future<CountState> _deleteItem(CountItem item) async {
    storage.deleteCountItem(item.id);
    var items = await storage.fetchCountItems();
    return CountItemsFetchedState(_sortedItems(items));
  }

  Future<CountState> _delAllItems() async {
    var items = await storage.fetchCountItems();
    for (var item in items) {
      await storage.deleteCountItem(item.id);
    }
    return CountItemsFetchedState([]);
  }

  List<CountItem> _sortedItems(List<CountItem> items) {
    items.sort((a, b) {
      var nameA = a.name.toLowerCase(), nameB = b.name.toLowerCase();
      return nameA.compareTo(nameB);
    });
    return items;
  }
}
