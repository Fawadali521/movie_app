import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/constants/text_styles.dart';
import 'package:movie_app/core/enums/view_state.dart';
import 'package:movie_app/core/extensions/sizedbox_extension.dart';
import 'package:movie_app/ui/custom_widgets/custom_loader.dart';
import 'package:movie_app/ui/screens/watch/watch_view_model.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<WatchViewModel>(
          builder: (context, model, child) => ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            progressIndicator: const CustomLoader(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CachedNetworkImage(
                        imageUrl: model.movieDetails.backdropPath!,
                        fit: BoxFit.cover,
                        height: 400,
                        width: double.infinity,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      Column(
                        children: [
                          Text(
                            model.movieDetails.title ?? 'Movie Title',
                            style: kTextStyle5.copyWith(
                              color: kgoldColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          12.h.ph,
                          Text(
                            "In theaters ${model.movieDetails.releaseDate ?? ''}",
                            style: kTextStyle5,
                            textAlign: TextAlign.center,
                          ),
                          12.h.ph,
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(knotesBlueColor),
                            ),
                            onPressed: () {
                              // Add ticket booking functionality here
                            },
                            child: Text(
                              'Get Tickets',
                              style: kTextStyle5,
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              // Add trailer functionality here
                            },
                            child: Text(
                              'Watch Trailer',
                              style: kTextStyle4,
                            ),
                          ),
                          24.h.ph,
                        ],
                      ),
                      Positioned(
                        top: 20.h,
                        left: 20.w,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: kWhiteColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Genres',
                          style: kTextStyle3,
                        ),
                        Wrap(
                          spacing: 8.0,
                          children: model.movieDetails.genres!.map((genre) {
                            return Chip(
                              label: Text(
                                genre.name,
                                style: kTextStyle6,
                              ),
                              backgroundColor: Colors.lightBlueAccent,
                            );
                          }).toList(),
                        ),
                        30.h.ph,
                        Text(
                          'Overview',
                          style: kTextStyle3,
                        ),
                        12.h.ph,
                        Text(
                          model.movieDetails.overview ??
                              'No overview available.',
                          style: kTextStyle3.copyWith(
                            color: kBlackColor.withOpacity(0.7),
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
