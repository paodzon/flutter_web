import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/models/users.dart';
import 'package:flutter_web/presentation/widgets/layout.dart';

class ApplicationsPage extends StatefulWidget {
  const ApplicationsPage({Key? key}) : super(key: key);

  @override
  State<ApplicationsPage> createState() => _ApplicationsPageState();
}

class _ApplicationsPageState extends State<ApplicationsPage> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _searchController;
  var search = '';
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void submitData() async {
    debugPrint(_nameController.text);

    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final json = {
      'id': docUser.id,
      'name': _nameController.text,
      'age': _ageController.text
    };
    final json2 = User(
        id: docUser.id, name: _nameController.text, age: _ageController.text);
    await docUser.set(json2.toJson());
  }

  void deleteData(id) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(id);

    await docUser.delete();
  }

  void updateData(id) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(id);
    final json = {
      'id': docUser.id,
      'name': _nameController.text,
      'age': _ageController.text
    };
    await docUser.update(json);
  }

  Stream<List<User>> readUsers() {
    return FirebaseFirestore.instance
        .collection('users')
        .orderBy('name')
        .startAt([search])
        .endAt(['$search\uf8ff'])
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
  }

  Widget buildUser(User user) => ListTile(
        leading: const Icon(Icons.list),
        trailing: Wrap(
          children: [
            ElevatedButton(
              child: const Text('Update'),
              onPressed: () => updateData(user.id),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              child: const Text('Delete'),
              onPressed: () => deleteData(user.id),
            ),
          ],
        ),
        title: Text('${user.name} is ${user.age} years old'),
      );

  @override
  Widget build(BuildContext context) {
    return Layout(
        header: Container(),
        contentPage: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Age',
              ),
            ),
            ElevatedButton(
                onPressed: () => submitData(), child: const Text('Submit')),
            TextField(
              controller: _searchController,
              onChanged: (value) => setState(() {
                if (value.isEmpty) {
                  search = '';
                } else {
                  search = value;
                }
              }),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
              ),
            ),
            StreamBuilder<List<User>>(
              stream: readUsers(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  final users = snapshot.data!;

                  return ListView(
                    shrinkWrap: true,
                    children: users.map(buildUser).toList(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ));
  }
}
