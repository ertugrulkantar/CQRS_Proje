import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
import 'presentation/bloc/largest_prime_bloc.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/admin_page.dart';
import 'presentation/pages/selection_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LargestPrimeBloc>(
          create: (_) => di.sl<LargestPrimeBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Largest Prime App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SelectionPage(),
          '/home': (context) => HomePage(),
          '/admin': (context) => AdminPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
