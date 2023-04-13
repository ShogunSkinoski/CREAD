import 'package:flutter/material.dart';

import '../../model/userprofile_model.dart';

class EvaluationCard extends StatefulWidget {
  const EvaluationCard({super.key});

  @override
  State<EvaluationCard> createState() => _EvaluationCardState();
}

class _EvaluationCardState extends State<EvaluationCard> {
  @override
  Widget build(BuildContext context) {
    return EvaluationCard();
  }

  Card EvaluationCard() {
    return Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //user icon and profile and settings
            Row(
              children: [
                //user icon
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                //profile
                Text(
                  UserProfile.EMAIL,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    children: <TextSpan>[
                      TextSpan(
                          text: '  ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Sent a evaluation',
                          style: TextStyle(color: Colors.blueGrey)),
                      TextSpan(
                          text: '  ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: '1 hour ago',
                          style: TextStyle(color: Colors.blueGrey))
                    ],
                  ),
                ),
                //settings
                const Icon(Icons.filter_list_sharp, color: Colors.black),
              ],
            ),
            //chip for evaluation
            Chip(
              side: BorderSide(
                color: Colors.orangeAccent,
                width: 1,
                style: BorderStyle.solid,
              ),
              elevation: 2,
              avatar: const CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                child: Icon(
                  Icons.thumb_up,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              label: const Text('It was a good book'),
              backgroundColor: Colors.orangeAccent[100],
            ),
            //text for evaluation
            Text(
              'I really liked this book. I think it is a good book for everyone. I recommend it to everyone.',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            //image and information of book
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //image of book
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Spacer(),
                //information of book
                Column(
                  children: [
                    //book name
                    Text(
                      'Book Name',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //author name
                    Text(
                      'Author Name',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //book type
                    Text(
                      'Book Type',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //book page
                    Text(
                      'Book Page',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 9),
              ],
            ),
            //what do you think about this evaluation
            Text(
              'What do you think about this evaluation?',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
