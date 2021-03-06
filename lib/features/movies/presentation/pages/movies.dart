import 'package:flutter/material.dart';
import 'package:testmovies/core/model/movie_model.dart';
import 'package:testmovies/core/model/server_response.dart';
import 'package:testmovies/core/util/scaffold_theme.dart';
import 'package:testmovies/core/util/screen_size.dart';
import 'package:testmovies/core/widget/button/color.dart';
import 'package:testmovies/core/widget/panel/panel_index.dart';
import 'package:testmovies/core/widget/sliver/sliver_persistent.dart';
import 'package:testmovies/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:testmovies/features/movies/presentation/bloc/movies_event.dart';
import 'package:testmovies/features/movies/presentation/bloc/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:testmovies/features/movies/presentation/widgets/movies_container.dart';

ScrollController _scrollController = ScrollController();

class MoviesScreen extends StatefulWidget {
  MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen>
    with SingleTickerProviderStateMixin {
  static late PanelType panelType;

  late AnimationController animationController;
  late Animation<double> tweenAnimation;
  late Animation<double> tweenAnimationOut;
  late Animation<double> tweenAnimationSelectCheckbox;
  late Animation<double> tweenAnimationSelectCheckboxOut;
  static late PanelController panelController;
  static late MovieModel movieDetail;
  static late List<dynamic> listMovies;
  static late List<MovieModel> listMoviesFiltered = [];
  late final MovieModel movieModel;
  static late String filterSelected = "Popular";

  Function(String)? onTap;

  @override
  void initState() {
    panelController = PanelController();
    panelType = PanelType.movies;
    listMovies = [];
    super.initState();
    BlocProvider.of<MoviesBloc>(context).add(GetMoviesPopularEvent());
    movieModel = MovieModel(
        adult: false,
        backdropPath: "/wcKFYIiVDvRURrzglV9kGu7fpfY.jpg",
        genreIds: [14, 18, 12],
        id: 453395,
        originalLanguage: "en",
        originalTitle: "Doctor Strange in the Multiverse of Madness",
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        popularity: 16751.01,
        posterPath: "/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg",
        releaseDate: DateTime.parse("2022-05-04"),
        title: "Doctor Strange in the Multiverse of Madness",
        video: false,
        voteAverage: 7.5,
        voteCount: 3518);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    tweenAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.1, 0.5, curve: Curves.easeOut),
    ));
    tweenAnimationOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    ));
    //animationBillCounter initialization
    tweenAnimationSelectCheckbox =
        Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.1, 0.5, curve: Curves.easeOut),
    ));
    tweenAnimationSelectCheckboxOut =
        Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    ));
  }

  @override
  void dispose() {
    panelType = PanelType.none;
    listMoviesFiltered = [];
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _popPage,
      child: ScaffoldTheme(
        statusBarBrightness: Brightness.dark,
        navBarColor: Color.fromRGBO(0, 61, 111, 1),
        child: Scaffold(body: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (_, state) {
            return BlocConsumer<MoviesBloc, MoviesState>(
              listener: (context, state) {
                if (state is MoviesPopularLoadingState) {
                  listMovies = [];
                }
                if (state is MoviesTopLoadingState) {
                  listMovies = [];
                }
                if (state is GetMoviesPopularState) {
                  print("popular");
                  listMovies = state.listMoviesPopular;
                  print(listMovies);
                }
                if (state is GetMoviesTopRatedState) {
                  print("blac top rated");
                  listMovies = state.listMoviesTopRated;
                  print(listMovies);
                }
              },
              builder: (context, state) {
                if (state is OpenPanelState) {
                  _handledActionPanel(state);
                }
                return SlidingUpPanel(
                  minHeight: 0,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ScreenSize.width(context) * 0.05),
                    topRight: Radius.circular(ScreenSize.width(context) * 0.05),
                  ),
                  controller: panelController,
                  maxHeight: _handledGenerateMaxHeight(panelType),
                  panelBuilder: (ScrollController sc) => PanelIndex(
                      scrollController: sc,
                      panelType: panelType,
                      tweenAnimation: tweenAnimation,
                      panelController: panelController,
                      tweenAnimationOut: tweenAnimationOut,
                      animationController: animationController,
                      handledActiveAnimation: _handledActiveAnimation,
                      tweenAnimationSelectCheckbox:
                          tweenAnimationSelectCheckbox,
                      tweenAnimationSelectCheckboxOut:
                          tweenAnimationSelectCheckboxOut),
                  body: NestedScrollView(
                      controller: _scrollController,
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return [
                          SliverPersistentHeader(
                            pinned: true,
                            delegate: SliverPersistenceSimple(
                              title: 'Find and enjoy your movie',
                            ),
                          ),
                        ];
                      },
                      body: MoviesContainer(
                        handledClosePanel: _closePanel,
                        onScrollDown: _scrollDown,
                        onScrollUp: _scrollUp,
                        filterSelected: filterSelected,
                        listMovies: listMovies,
                        listMoviesFiltered: listMovies,
                        handledOpenPanel: _handledOpenPanel,
                        movieDetail: movieModel,
                        onTap: (value) {
                          if (value == "popular") {
                            BlocProvider.of<MoviesBloc>(context)
                                .add(GetMoviesPopularEvent());
                          } else if (value == "toprated") {
                            BlocProvider.of<MoviesBloc>(context)
                                .add(GetMoviesTopRatedEvent());
                          }
                        },
                      )),
                );
              },
            );
          },
        )),
      ),
    );
  }

  double _handledGenerateMaxHeight(PanelType panel) {
    switch (panelType) {
      case PanelType.movies:
        return ScreenSize.height(context) * 0.4;
      case PanelType.detailMovie:
        return ScreenSize.height(context) * 0.90;
      case PanelType.none:
        return 0;
    }
  }

  _handledActionPanel(OpenPanelState state) {
    panelType = state.panelType;
    if (panelType == PanelType.none) {
      panelController.close();
    } else if (panelType == PanelType.detailMovie) {
      panelController.animatePanelToPosition(0.7);
    } else {
      panelController.open();
    }
  }

  Future<bool> _popPage() async {
    BlocProvider.of<MoviesBloc>(context).add(MoviesInitEvent());
    if (!panelController.isPanelClosed) {
      panelController.close();
    } else {
      Navigator.pop(context);
    }
    return false;
  }

  _handledOpenPanel(PanelType panel) {
    animationController.reverse();
    BlocProvider.of<MoviesBloc>(context).add(OpenPanelEvent(panelType: panel));
  }

  _handledChangeBox(String value) {
    if (value == "popular") {
      BlocProvider.of<MoviesBloc>(context).add(GetMoviesPopularEvent());
    } else if (value == "toprated") {
      BlocProvider.of<MoviesBloc>(context).add(GetMoviesTopRatedEvent());
    }
    return value;
  }

  _handledActiveAnimation() {
    if (animationController.isCompleted) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  _closePanel() {
    panelController.close();
  }

  void _scrollDown() async {
    await _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _scrollUp() async {
    await _scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }
}
