import 'package:flutter/material.dart';
import 'package:testmovies/core/model/movie_model.dart';
import 'package:testmovies/core/util/screen_size.dart';
import 'package:testmovies/core/widget/panel/panel_index.dart';
import 'package:testmovies/features/movies/presentation/widgets/modal_open_detail.dart';

class MoviesContainer extends StatefulWidget {
  final VoidCallback onScrollDown;
  final VoidCallback onScrollUp;
  final VoidCallback handledClosePanel;
  final MovieModel movieDetail;
  final List<dynamic> listMoviesFiltered;
  final Function(PanelType) handledOpenPanel;
  String filterSelected = "Popular";
  late List<dynamic> listMovies;
  bool? valueSelected;
  Function(String) onTap;

  MoviesContainer(
      {Key? key,
      required this.listMoviesFiltered,
      this.valueSelected = false,
      required this.movieDetail,
      required this.listMovies,
      required this.onTap,
      required this.handledOpenPanel,
      required this.filterSelected,
      required this.onScrollDown,
      required this.onScrollUp,
      required this.handledClosePanel})
      : super(key: key);

  @override
  State<MoviesContainer> createState() => _MoviesContainerState();
}

class _MoviesContainerState extends State<MoviesContainer> {
  String filterSelected = "Popular";

  bool? valuePopular;
  bool? valueTop;
  ValueChanged<bool?>? onChanged;
  bool isActivePopular = false;
  bool isActiveTop = false;
  @override
  void initState() {
    valuePopular = false;
    valueTop = false;
    super.initState();
  }

  void selectFilter(type) {
    if (type == "popular") {
      widget.onTap(type);
      setState(() {
        widget.onTap(type);
        isActivePopular = true;
        isActiveTop = false;
      });
    } else if (type == "toprated") {
      widget.onTap(type);
      setState(() {
        isActiveTop = true;
        isActivePopular = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.height(context) * 0.05,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("FILTERS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromRGBO(0, 61, 111, 1))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () => selectFilter("popular"),
                        child: Container(
                          height: 50,
                          width: 100,
                          child: Card(
                              elevation: isActivePopular ? 4 : 0,
                              child: Center(child: Text("Popular"))),
                        )),
                  ],
                ),
                GestureDetector(
                  onTap: () => selectFilter("toprated"),
                  child: Container(
                    height: 50,
                    width: 100,
                    child: Card(
                        elevation: isActiveTop ? 4 : 0,
                        child: Center(child: Text("Top Rated"))),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            GridView.builder(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              itemCount: widget.listMovies.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: ScreenSize.width(context) * 0.001,
                mainAxisSpacing: ScreenSize.height(context) * 0.001,
              ),
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: () {
                    openModal(context, widget.listMovies[index]);
                  },
                  child: Container(
                    width: ScreenSize.width(context) * 0.85,
                    height: ScreenSize.height(context) * 0.085,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Image.network(
                      'http://image.tmdb.org/t/p/w500' +
                          widget.listMovies[index]['poster_path'],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
