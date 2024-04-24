import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_server/utils/styles/app_text_stles.dart';
import 'package:open_filex/open_filex.dart';
import '../bloc/file_manager_bloc.dart';
import '../data/models/file_data_model.dart';
import '../data/repositories/file_repositories.dart';
import '../services/file_manager_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Welcome",
            style: AppTextStyle.interBold
                .copyWith(color: Colors.black, fontSize: 20),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                TextField(
                  onChanged: (v) {
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(25),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    children: [
                      ...List.generate(
                          context.read<FileRepository>().books.length, (index) {
                        FileDataModel fileDataModel =
                            context.read<FileRepository>().books[index];

                        FileManagerBloc fileManagerBloc = FileManagerBloc();

                        return BlocProvider.value(
                            value: fileManagerBloc,
                            child:
                                BlocBuilder<FileManagerBloc, FileManagerState>(
                              builder: (context, state) {
                                debugPrint("CURRENT MB: ${state.progress}");
                                String filePath = FileManagerService.isExist(
                                  fileDataModel.bookUrl,
                                  fileDataModel.bookName,
                                );
                                return Column(
                                  children: [
                                    Image.network(
                                      fileDataModel.imagePath,
                                      width: 180,
                                      height: 180,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          fileDataModel.bookName,
                                        ),
                                        IconButton(
                                            onPressed: () async {
                                              if (state.newFileLocation.isNotEmpty) {
                                                await OpenFilex.open(state.newFileLocation);
                                              } else {
                                                fileManagerBloc.add(
                                                  DownloadFileEvent(
                                                    fileDataModel: fileDataModel,
                                                  ),
                                                );
                                              }
                                            },
                                            icon: Icon(state.newFileLocation.isNotEmpty
                                                ? Icons.folder_open
                                                : Icons.download_outlined))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Visibility(
                                        visible: state.progress != 0,
                                        child: LinearProgressIndicator(
                                          value: state.progress,
                                          backgroundColor: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ));
                      })
                    ],
                  ),
                ),
              ],
            )));
  }
}
