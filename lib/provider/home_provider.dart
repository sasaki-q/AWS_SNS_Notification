import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider((ref) => HomeNotifier());

class HomeNotifier extends StateNotifier {
  HomeNotifier() : super("");
}