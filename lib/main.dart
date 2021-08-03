import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'application.dart';
import 'package:flutter/widgets.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';

import 'data/blocs/bloc_observer.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;
  runApp(Application(authenticationRepository: authenticationRepository));
}
