import 'package:state_notifier/state_notifier.dart';
import 'package:supabase_app/screens/home/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState());

  void increment() {
    state = state.copyWith(counter: state.counter + 1);
  }
}
