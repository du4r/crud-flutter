import 'package:crud_flutter/routes/app_routes.dart';
import 'package:crud_flutter/views/user_form.dart';
import 'package:crud_flutter/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:crud_flutter/provider/users.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Users() ) ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserList(),
        routes: {
          AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),
    );
  }
}
