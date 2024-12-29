import 'package:movie_app/core/constants/api_end_pionts.dart';
import 'package:movie_app/core/logger_customizations/custom_logger.dart';
import 'package:movie_app/core/models/movie_details.dart';
import 'package:movie_app/core/models/upcoming_movie.dart';
import 'package:movie_app/core/responses/base_responses/request_response.dart';
import 'package:movie_app/core/services/api_services.dart';

class DataBaseService {
  final log = CustomLogger(className: 'DataBaseService');
  final ApiServices _apiServices = ApiServices();
  MovieResponse movieResponse = MovieResponse();
  MovieDetails movieDetails = MovieDetails();
  ///
  /// get all movies
  ///
  getAllMovies() async {
    log.i("call get all movies");
    // Make the API call
    RequestResponse response = await _apiServices.get(
      url: '${EndPoints.baseUrl}${EndPoints.upcoming}',
    );
    log.i("API response => ${response.data.toString()}");
    try {
      movieResponse = MovieResponse.fromJson(response.data);
      if (movieResponse.results != null && movieResponse.results!.isNotEmpty) {
        log.i("Movies fetched successfully");
        return true;
      } else {
        log.e("No movies found in the response");
        return false;
      }
    } catch (e) {
      log.e("Failed to parse movie response: $e");
      return false;
    }
  }
  

  ///
  /// get movie details
  ///
  getMovieDetails(int movieID) async {
    log.i("call get movies details");
    // Make the API call
    RequestResponse response = await _apiServices.get(
      url: '${EndPoints.baseUrl}$movieID',
    );
    log.i("API response movie details => ${response.data.toString()}");
    try {
      movieDetails = MovieDetails.fromJson(response.data);
      if (movieResponse.results != null && movieResponse.results!.isNotEmpty) {
        log.i("Movies details fetched successfully");
        return movieDetails;
      } else {
        log.e("No movies details found in the response");
        return null;
      }
    } catch (e) {
      log.e("Failed to parse movie details response: $e");
      return null;
    }
  }
}
