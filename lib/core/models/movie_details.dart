class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductionCompany {
  final int id;
  final String name;
  final String? logoPath;
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'],
      name: json['name'],
      logoPath: json['logo_path'],
      originCountry: json['origin_country'],
    );
  }
}

class MovieDetails {
  final bool? adult;
  final String? backdropPath;
  final String? belongsToCollection;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final List<Map<String, dynamic>>? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<Map<String, dynamic>>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieDetails({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      adult: json['adult'],
      backdropPath:
          'https://image.tmdb.org/t/p/w500/${json['backdrop_path'] ?? ''}',
      belongsToCollection: json['belongs_to_collection'],
      budget: json['budget'],
      genres: List<Genre>.from(
          json['genres'].map((genre) => Genre.fromJson(genre))),
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originCountry: List<String>.from(json['origin_country']),
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath:
          'https://image.tmdb.org/t/p/w500/${json['poster_path'] ?? ''}',
      productionCompanies: List<ProductionCompany>.from(
          json['production_companies']
              .map((company) => ProductionCompany.fromJson(company))),
      productionCountries:
          List<Map<String, dynamic>>.from(json['production_countries']),
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages:
          List<Map<String, dynamic>>.from(json['spoken_languages']),
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}
