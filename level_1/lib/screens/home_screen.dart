import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:level_1/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  final CollectionReference myItems =
      FirebaseFirestore.instance.collection("CRUDitems"); 

  
  Future<void> create() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return myDialogBox(
          context: context,
          name: "Tạo hoạt động",
          condition: "Tạo",
          onPressed: () {
            String name = _nameController.text;
            String position = _positionController.text;
            addItems(name, position);
            Navigator.pop(context); 
          },
        );
      },
    );
  }

  void addItems(String name, String position) {
    myItems.add({
      'name': name,
      'position': position,
    });
  }

  
  Future<void> _update(DocumentSnapshot documentSnapshot) async {
    _nameController.text = documentSnapshot['name'];
    _positionController.text = documentSnapshot['position'];
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return myDialogBox(
          context: context,
          name: "Cập nhật dữ liệu của bạn",
          condition: "Cập nhập",
          onPressed: () async {
            String name = _nameController.text;
            String position = _positionController.text;

            await myItems.doc(documentSnapshot.id).update({
              'name': name,
              'position': position,
            });
            _nameController.text = '';
            _positionController.text = '';
            Navigator.pop(context); 
          },
        );
      },
    );
  }

  
  Future<void> delete(String productId) async {
    await myItems.doc(productId).delete();
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        duration: Duration(milliseconds: 500),
        content: Text("Xóa thành công !"),
      ),
    );
  }

  String searchText = '';

  void _onSearchChange(String value) {
    setState(() {
      searchText = value;
    });
  }

  bool isSearchClick = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        leading: IconButton(
        onPressed: () {
        FirebaseAuth.instance.signOut().then((value) {
          print("Đã đăng xuất");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
          );
        });
      },
      icon: Icon(Icons.logout),
    ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: isSearchClick
            ? Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: _onSearchChange,
                  controller: _searchController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                      hintText: "Tìm kiếm...",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.black,
                      )),
                ),
              )
            : const Text(
                "Danh Bạ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearchClick = !isSearchClick;
                });
              },
              icon: Icon(
                isSearchClick ? Icons.close : Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      
      body: StreamBuilder(
        stream: myItems.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final List<DocumentSnapshot> items = streamSnapshot.data!.docs
                .where(
                  (doc) => doc['name'].toLowerCase().contains(
                        searchText.toLowerCase(),
                      ),
                )
                .toList();
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot = items[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          documentSnapshot['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          documentSnapshot['position'],
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () => _update(documentSnapshot),
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () => delete(documentSnapshot.id),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: create,
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Dialog myDialogBox({
    required BuildContext context,
    required String name,
    required String condition,
    required VoidCallback onPressed,
  }) =>
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Tên của bạn",
                  hintText: 'Tuấn Anh',
                ),
              ),
              TextField(
                controller: _positionController,
                decoration: const InputDecoration(
                  labelText: "Nhập vị trí",
                  hintText: 'VD:  Developer',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: onPressed,
                child: Text(condition),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );
}