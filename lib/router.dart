import 'package:go_router/go_router.dart';
import '/main.dart';
import '/weather_page.dart';
import 'newsfeed.dart';
import '/word_counter.dart';

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
            path: 'newsfeed',
            builder: (context, state) => const NewsFeed(),
          ),
          GoRoute(
            path: 'wordcounter',
            builder: (context, state) => const WordCounterPage(),
          ),
        ]),
  ],
);
