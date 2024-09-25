import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:icons_plus/icons_plus.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness==Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){},icon: const Icon(Icons.icecream_rounded)),
        title: Text("Profile", style: Theme.of(context).textTheme.headlineMedium,),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // COLUMN THAT WILL CONTAIN THE PROFILE
          Column(
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/m.jpg'),
              ),
              SizedBox(height: 10),
              Text(
                "Sadia Sultana",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  "Update Your Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            children: List.generate(PCard.length, (index) {
              return Expanded(
                child: Container(
                  height: 7,
                  margin: EdgeInsets.only(right: index == 4 ? 0 : 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == 0 ? Colors.blue : Colors.black12,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 180,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final card=PCard[index] ;
                  return SizedBox(
                    width: 160,
                    child: Card(
                      shadowColor: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Icon(card.icon,size: 30,),
                            const SizedBox(height: 10),
                            Text(
                              card.title,
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            ElevatedButton(onPressed: (){},
                              child : Text(card.buttonText),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                const Padding(padding: EdgeInsets.only(right: 5)),
                itemCount: PCard.length,)
          ),
          const SizedBox(height: 30),
          Column(
            children: List.generate(CCard.length, (index) {
              final bar =CCard[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.black12,
                  child: ListTile(
                    leading: Icon(bar.icon),
                    title: Text(bar.title),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
              );
            },
            ),
          ) ,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2), label: "Messenger"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.add_circled), label: "Upload"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_2), label: "Profile"),

          ]
      ),
    );
  }
}
class ProfileCard{
  final String title;
  final String buttonText;
  final IconData icon;
  ProfileCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}
List<ProfileCard> PCard = [
  ProfileCard(
    title: "Set Your Profile Details",
    icon: Icons.person,
    buttonText: "Upload",
  ),
  ProfileCard(
    title: "Upload User Name",
    icon: Icons.text_format_rounded,
    buttonText: "Upload",
  ),
  ProfileCard(
    title: "Upload your Location",
    icon: Icons.location_on_outlined,
    buttonText: "upload",
  ),
  ProfileCard(
    title: "Upload NID",
    icon: Icons.note,
    buttonText: "upload",
  ),
];
class CustomCard {
  final String title;
  final IconData icon;
  CustomCard({
    required this.title,
    required this.icon,
  });
}
List<CustomCard> CCard = [
  CustomCard(
    title: "Favourites",
    icon: Icons.favorite,
  ),
  CustomCard(
    title: "Locations",
    icon: Icons.location_on_outlined,
  ),
  CustomCard(
    title: "Notifications",
    icon: Icons.notifications,
  ),
  CustomCard(
    title: "Log Out",
    icon: Icons.arrow_circle_left_outlined,
  ),
];