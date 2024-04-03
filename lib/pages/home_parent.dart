

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:jadwali_test_1/auth/auth_service.dart';
import 'package:jadwali_test_1/modules/child.dart';
import 'package:jadwali_test_1/pages/add_child.dart';
import 'package:jadwali_test_1/pages/child_profile.dart';
import 'package:jadwali_test_1/pages/login_parent.dart';
import 'package:jadwali_test_1/pages/pre_login.dart';
import 'package:jadwali_test_1/modules/child.dart';

class HomeParent extends StatefulWidget {
  static const String routeName = '/';
  const HomeParent({super.key});

  @override
  State<HomeParent> createState() => _HomeParentState();
}

class _HomeParentState extends State<HomeParent> {
  List<Child> children = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(leading: IconButton(onPressed: (){},
           icon:const Icon( Icons.dehaze_rounded,
           ),
           ), 

          title: const Text(' قائمة الأطفال',
          textAlign: TextAlign.right,
          ),

          backgroundColor: const Color.fromRGBO(255, 249, 227, 100),
           
        
        actions: [
          IconButton(
            onPressed: () {
              AuthService.logout().then((value) => context.goNamed(
                  PreLogin.routeName)); // .then: ino sho ye3mal after logout
            },
            icon: const Icon(Icons.logout),
          )
        ]),
        body:
         
        Stack(
          children:[ 
            Container(
          decoration: const BoxDecoration(
            image:  DecorationImage(image:  AssetImage("assets/images/background.png"), fit: BoxFit.cover,),
          ),
        ),
            Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: children.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3, // Add elevation for a shadow effect
                      child: ListTile(
                        title: Text(children[index].name),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // Remove the item from the data source
                            setState(() {
                              children.removeAt(index);
                            });
          
                            // Show a snackbar to indicate item deletion
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Item deleted"),
                              ),
                            );
                          },
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChildProfilePage(child: children[index]),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () async {
                    final newChild = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => addChild(),
                      ),
                    );
                    if (newChild != null) {
                      setState(() {
                        children.add(newChild);
                      });
                    }
                  },
                  child: const Text("أضف طفل"),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
      
          
          
          // Center(
          //   child: Column(
          //     children: [
          //       const Expanded(child: Text('Home parent test')),
          //       Padding(
          //         padding: const EdgeInsets.all(20),
          //         child: ElevatedButton(
          //           onPressed: () {
          //             ///kjd
          //           },
          //           child: const Text("أضف طفل"),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
//         );
//   }
// }


//////////////////////////
///
/*KeyedSubtree(
                    key: Key(children[index].name),
                    child: Dismissible(
                                  key: Key(children[index].name),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (direction) {
                                    // Remove the item from the data source
                                    setState(() {
                    children.removeAt(index);
                                    });
                    
                                    // Show a snackbar to indicate item deletion
                                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Item dismissed"),
                    ),
                                    );
                                  },
                                  background: Container(
                                    color: Colors.red,
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                                    ),
                                  ),
                    child: Card(
                    elevation: 3, // Add elevation for a shadow effect
                    child: ListTile(
                      title: Text(children[index].name),
                      onTap: () {
                        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                    builder: (context) => ChildProfilePage(child: children[index]),
                                    ),
                                  );
                      },
                    ))),
                  );*/
                  