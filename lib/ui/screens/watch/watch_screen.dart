import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movie_app/core/constants/text_styles.dart';
import 'package:movie_app/core/enums/view_state.dart';
import 'package:movie_app/ui/custom_widgets/custom_loader.dart';
import 'package:movie_app/ui/screens/watch/watch_view_model.dart';
import 'package:provider/provider.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<WatchViewModel>(
          builder: (context, model, child) => ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            progressIndicator: const CustomLoader(),
            child: Column(
              children: [
                ///
                //! Search field
                ///
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8..h),
                  child: TextField(
                    onChanged: model.searchMovies,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),

                ///
                //! List of movies
                ///

                model.filteredMovies.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          itemCount: model.filteredMovies.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                log("id ===${model.filteredMovies[index].id}");
                                model.requestGetMoviesDetails(
                                    model.filteredMovies[index].id);
                              },
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Container(
                                    height: 180.h,
                                    width: double.infinity,
                                    padding: EdgeInsets.only(bottom: 12.h),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.r),
                                      child: CachedNetworkImage(
                                        imageUrl: model.dbService.movieResponse
                                            .results![index].backdropPath,
                                        fit: BoxFit
                                            .cover, // You can adjust how the image should fit
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 24.h, horizontal: 24.w),
                                    child: Text(
                                      model.filteredMovies[index].title,
                                      style: kTextStyle4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Text(
                          "No movies available to watch.",
                          style: kTextStyle3,
                          textAlign: TextAlign.center,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
