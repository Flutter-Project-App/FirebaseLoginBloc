import 'package:flutter/widgets.dart';
import 'package:flutter_application/application.dart';
import 'package:flutter_application/data/blocs/app_bloc/app_bloc.dart';
import 'package:flutter_application/pages/login/login_page.dart';
import '';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      // return [HomePage.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}