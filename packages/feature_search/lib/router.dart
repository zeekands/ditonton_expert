import 'package:feature_search/presentation/pages/search_page.dart';
import 'package:go_router/go_router.dart';

final searchRoutes = [
  GoRoute(path: '/search', builder: (context, state) => SearchPage()),
];
