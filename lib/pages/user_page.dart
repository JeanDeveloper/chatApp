import 'package:chat/models/user.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserPage extends StatefulWidget {

  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  RefreshController refreshController =  RefreshController(initialRefresh:false);

  final users = [

    User(uid: '1', nombre: 'Maria', email: 'test1@mail.com', online: true),
    User(uid: '2', nombre: 'Jose',  email: 'jose@mail.com',  online: false),
    User(uid: '3', nombre: 'Carlos',email: 'carlos@mail.com',online: true),

  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        leading: IconButton(
          onPressed: (){}, 
          icon:const Icon(Icons.exit_to_app, color: Colors.black)
        ),

        actions:  [

          Container(
            margin: const EdgeInsets.only( right: 10 ),
            // child: const Icon(Icons.offline_bolt, color: Colors.red)
            child: Icon(Icons.check_circle, color: Colors.blue[400])
          )

        ],
        title: const Text('Mi nombre', style: TextStyle(color: Colors.black)),
        centerTitle: true,

        backgroundColor: Colors.white,

      ),

      body: SmartRefresher(
        controller: refreshController,
        enablePullDown: true,
        header: WaterDropHeader(
          complete: Icon( Icons.check, color: Colors.blue[400] ),
          waterDropColor: Colors.blue,
        ),
        onRefresh: _loadUsers,

        child: _userListView()
      ) ,

    );
  }

  _loadUsers() async{

    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.refreshCompleted();

  }


  ListView _userListView(){

    return ListView.separated(

      itemBuilder: ( _ , i ) => _userListTile(users[i]),
      separatorBuilder: ( _ , i) => const Divider(),
      itemCount: users.length

    );
  }

  ListTile _userListTile(User user){

    return ListTile(
      title: Text(user.nombre),
      leading: CircleAvatar(
        child: Text(user.nombre.substring(0,2)),
      ),

      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: user.online ? Colors.green[300] : Colors.red,
          borderRadius: BorderRadius.circular(100)
        ),
      ),

    );

  }

}