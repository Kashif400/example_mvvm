import 'package:example_mvvm/view_model/user_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Data/Response/status.dart';
import '../utils/utils.dart';

class ViewDetail extends StatefulWidget {
  const ViewDetail({super.key});

  @override
  State<ViewDetail> createState() => _ViewDetailState();
}

class _ViewDetailState extends State<ViewDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<UserDetailViewModel>(
        create: (BuildContext context) => UserDetailViewModel(),
        child: Consumer<UserDetailViewModel>(builder: (context, value, _) {
          switch (value.userList.status) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.userList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.userList.data!.name!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title:
                            Text(value.userList.data!.name![index].toString()),
                        subtitle: Text(
                            value.userList.data!.number![index].toString()),
                      ),
                    );
                  });
            default:
              return Container();
          }
        }),
      ),
    );
  }
}
