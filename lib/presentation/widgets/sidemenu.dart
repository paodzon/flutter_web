import 'package:flutter/material.dart';
import 'package:flutter_web/app/constants.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentRoute = ModalRoute.of(context)?.settings.name;
    const List options = sideMenuOptions;
    return Container(
      width: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: const ListTile(
              tileColor: Color(0xffF5F5F5),
              leading: Icon(Icons.person),
              title: Text('John Doe'),
              subtitle: Text('Placeholder text'),
              trailing: Icon(Icons.arrow_drop_down_sharp),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xffEC7C30),
                minimumSize: const Size.fromHeight(
                    50), // fromHeight use double.infinity as width and 40 is the height
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  Flexible(
                    child: Center(
                      child: Text(
                        'Build Form',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, index) {
              return DrawerListTile(
                  selected: options[index]['route'] == currentRoute,
                  title: options[index]['title'],
                  icon: options[index]['icon'],
                  press: () => Get.toNamed(options[index]['route']));
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {Key? key,
      // For selecting those three line once press "Command+D"
      required this.title,
      required this.icon,
      required this.press,
      required this.selected})
      : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: selected ? Color(0xffEC7C30) : Colors.grey,
      ),
      tileColor: selected ? const Color(0xffFDF4E3) : null,
      title: Text(
        title,
        style: TextStyle(color: selected ? Colors.black : Colors.grey),
      ),
    );
  }
}
