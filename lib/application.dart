import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/utils/routes.dart';
import 'data/blocs/app_bloc/app_bloc.dart';
import 'themes.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main.dart';
import 'package:flow_builder/flow_builder.dart';
import 'themes.dart';

// class Application extends StatefulWidget {
//   static const ROUTE_NAME = 'Application';
//   @override
//   _ApplicationState createState() => _ApplicationState();
// }
//
// class _ApplicationState extends State<Application> {
//   static const TAG = 'Application';
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: light(context),
//       darkTheme: dark(context),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Hello"),
//         ),
//       ),
//     );
//   }
// }
class Application extends StatelessWidget {
  const Application(
      {Key? key, required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(value: _authenticationRepository,
    child: BlocProvider(
      create: (_) => AppBloc(
        authenticationRepository: _authenticationRepository
      ),
      child: const AppView(),
    ),);
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light(context),
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
