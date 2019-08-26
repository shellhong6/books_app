import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:books_app/models/main.dart';
import 'package:books_app/reducers/main.dart';
import 'package:books_app/views/home/index.dart';
import 'package:books_app/common/theme.dart';
import 'package:books_app/common/constants.dart';
import 'package:books_app/views/detail/index.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store<MainState>(
    mainReducer,
    initialState: MainState.loading(),
    // middleware: createStoreTodosMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: '读书',
        theme: AppTheme.theme,
        routes: {
          '/': (context) {
            return HomeRoute(
            //   // onInit: () {
            //   //   StoreProvider.of<AppState>(context).dispatch(LoadTodosAction());
            //   // },
            );
          },
          RouteKeys.bookDetail: (context) {
            return DetailRoute();
          }
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
