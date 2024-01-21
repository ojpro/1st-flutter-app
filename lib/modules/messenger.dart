import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsetsDirectional.only(bottom: 8),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://api.dicebear.com/7.x/adventurer/png?seed=Sasha'),
              ),
              CircleAvatar(
                radius: 7,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 6,
                backgroundColor: Colors.green,
              ),
            ],
          ),
        ),
        title: const Text(
          'Chats',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const CircleAvatar(
                    child: Icon(Icons.camera_alt_outlined),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const CircleAvatar(
                    child: Icon(Icons.edit),
                  ),
                ),
              ],
            ),
          )
        ],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.purple,
                    contentPadding:
                        EdgeInsetsDirectional.symmetric(vertical: 4),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(90),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple,),
                      borderRadius: BorderRadius.all(
                        Radius.circular(90),
                      ),
                    ),
                    hintText: 'Search',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                height: 60,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStories(),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(width: 14),
                  itemCount: 8,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buildChats(),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 14),
                itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStories() => const Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://api.dicebear.com/7.x/adventurer/png?seed=Bandit'),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  end: 2,
                  bottom: 2,
                ),
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          Text(
            'Bandit',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );

  Widget buildChats() => const Row(
        children: [
          Padding(
            padding:
                EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 8),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://api.dicebear.com/7.x/adventurer/png?seed=Simba&size=64'),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Martin Parker',
                  maxLines: 1,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'You: Hey Martin, Are you free tomorrow at 8:30 a.m',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '9:41 AM',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 8),
            child: CircleAvatar(
              radius: 4,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      );
}
