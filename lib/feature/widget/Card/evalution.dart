import 'package:auto_size_text/auto_size_text.dart';
import 'package:cread/core/init/firebase/firestore_repository.dart';
import 'package:flutter/material.dart';

import '../../model/userprofile_model.dart';

class EvaluationCard extends StatefulWidget {
  final Map<String, dynamic> evaluation;
  const EvaluationCard({super.key, required this.evaluation});

  @override
  State<EvaluationCard> createState() => _EvaluationCardState();
}

class _EvaluationCardState extends State<EvaluationCard> {
  String email = '';
  String getDateFromTimeStap() {
    return DateTime.fromMillisecondsSinceEpoch(
            widget.evaluation['date'].seconds * 1000)
        .toString();
  }

  Future<void> getUserEmail() async {
    FireStoreRepository fireStoreRepository = FireStoreRepository();
    email = await fireStoreRepository.getUserEmail(widget.evaluation['userId']);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserEmail();
  }

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
                AutoSizeText(email,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                Spacer(),
                AutoSizeText(
                    getDateFromTimeStap().substring(0, 10) +
                        ' ' +
                        getDateFromTimeStap().substring(11, 16),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),

                //settings
                const Icon(Icons.filter_list_sharp, color: Colors.black),
              ],
            ),

            //text for evaluation
            AutoSizeText(widget.evaluation['review'] ?? "No review",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                      image: NetworkImage(widget.evaluation['bookCoverUrl'] ??
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
                      widget.evaluation['bookName'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //author name
                    Text(
                      widget.evaluation['bookAuthor'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //book type
                    Text(
                      widget.evaluation['bookPublisher'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //book page
                    Text(
                      widget.evaluation['bookYear'],
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
          ],
        ));
  }
}
