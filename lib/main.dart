import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_server/screen/tab_box.dart';
import 'package:library_server/services/file_manager_service.dart';

import 'data/repositories/file_repositories.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
  // BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

  await FileManagerService.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => FileRepository()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: TabBox1(),
      ),
    );
  }
}