import 'package:flutter/material.dart';
import 'package:flutter_application/data/blocs/app_bloc/app_bloc.dart';
import 'package:flutter_application/widgets/home_widgets/avatar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
              key: const Key('homePage_logout_iconButton'),
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Avatar(photo: user.photo),
            SizedBox(
              height: 16.0,
            ),
            Text(
              user.email ?? '',
              style: textTheme.headline6,
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              user.name ?? '',
              style: textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
