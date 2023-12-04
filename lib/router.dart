import 'package:go_router/go_router.dart';
import '/main.dart';
import 'weather_page.dart';
import 'news_feed.dart';
import 'word_counter.dart';

// Creating a GoRouter instance and defining routes
final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/', // Root path
      builder: (context, state) => const WelcomePage(), // Builds WelcomePage when root path is accessed
      routes: <GoRoute>[
        GoRoute(
          path: 'weather', // Nested route for weather
          builder: (context, state) => const WeatherPage(), // Builds WeatherPage for '/weather' path
        ),
        GoRoute(
          path: 'newsFeed', // Nested route for newsFeed
          builder: (context, state) => const NewsFeed(), // Builds NewsFeed for '/newsFeed' path
        ),
        GoRoute(
          path: 'wordCounter', // Nested route for wordCounter
          builder: (context, state) => const WordCounterPage(), // Builds WordCounterPage for '/wordCounter' path
        ),
      ],
    ),
  ],
);