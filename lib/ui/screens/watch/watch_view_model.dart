import 'package:movie_app/core/logger_customizations/custom_logger.dart';
import 'package:movie_app/core/models/movie_details.dart';
import 'package:movie_app/core/models/upcoming_movie.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/database_service.dart';
import 'package:movie_app/core/services/navigation_services.dart';
import 'package:movie_app/core/view_models/base_view_model.dart';
import 'package:movie_app/locator.dart';
import 'package:movie_app/ui/custom_widgets/custom_snackbar.dart';

class WatchViewModel extends BaseViewModel {
  final log = CustomLogger(className: "WatchViewModel");
  final dbService = locator<DataBaseService>();
  final _dbService = locator<DataBaseService>();
  final NavigationService navigationService = locator<NavigationService>();
  MovieDetails movieDetails = MovieDetails();
  List<Movie> movieResults = [];
  List<Movie> filteredMovies = [];
  WatchViewModel() {
    if (dbService.movieResponse.results != null) {
      movieResults = dbService.movieResponse.results!;
      filteredMovies = dbService.movieResponse.results!;
    }
  }

  requestGetMoviesDetails(int id) async {
    log.i("Calling get all movies...");
    try {
      // Call the getAllMovies function to fetch data
      movieDetails = await _dbService.getMovieDetails(id);
      if (movieDetails.backdropPath != null) {
        log.i("Movies details fetched successfully with coun");
        navigationService.nav.pushNamed(NamedRoute.movieDetails);
      } else {
        log.e("No movies details found in the response");
        customSnackBar(
          message: 'No movies details found ',
        );
      }
    } catch (e) {
      log.e("Error occurred while fetching movies details: $e");
      customSnackBar(
        message: 'No movies details found ',
      );
    }
  }

  void searchMovies(String query) {
    if (query.isEmpty) {
      filteredMovies = movieResults;
    } else {
      filteredMovies = movieResults
          .where((movie) =>
              movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
