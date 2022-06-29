import 'package:flutter/material.dart';
import 'package:testmovies/core/util/screen_size.dart';

void openModal(BuildContext context, dynamic movieDetail) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromRGBO(0, 61, 111, 1),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      builder: (context) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'http://image.tmdb.org/t/p/w500' +
                                movieDetail['poster_path'],
                            width: ScreenSize.width(context) * 0.3,
                            height: ScreenSize.width(context) * 0.6,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: ScreenSize.width(context) * 0.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(movieDetail['original_title'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  "Rating " +
                                      movieDetail['vote_average'].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ))
                            ],
                          ))
                    ]),
                Container(
                    child: Text(movieDetail['overview'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)))
              ],
            )),
          ));
}
