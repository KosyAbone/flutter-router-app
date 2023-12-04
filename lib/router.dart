import 'package:go_router/go_router.dart';
import '/main.dart';
import 'weatherPage.dart';
import 'newsFeed.dart';
import 'wordCounter.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
        path: '/',
        builder: (context, state) => const WelcomePage(),
        routes: <GoRoute>[
          GoRoute(
            path: 'weather',
            builder: (context, state) => const WeatherPage(),
          ),
          GoRoute(
            path: 'newsFeed',
            builder: (context, state) => const NewsFeed(),
          ),
          GoRoute(
            path: 'wordCounter',
            builder: (context, state) => const WordCounterPage(),
          ),
        ]),
  ],
);
