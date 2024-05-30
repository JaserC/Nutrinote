import 'package:flutter/material.dart';

//This page is to show off the team responsible for Food Focus!
//Everyone had fun working on the project (I think) and so we wanted a page detailing the experience
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/food_focus_logo.png',
                width: 40, height: 40),
            const SizedBox(width: 10),
            const Text("Food Focus", style: TextStyle(color: Colors.green)),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Semantics(
            label: 'About Food Focus',
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Image from: https://medium.com/@lloydannagrds/getting-started-in-graphic-design-a-beginners-guide-0cf5259f1e52
                  //Little graphic for a bit of visual flair
                  Semantics(
                    label: '3d food graphic',
                    child: Center(
                        child:
                            Image.asset('assets/images/about.png', width: 200)),
                  ),
                  const SizedBox(height: 10.0),
                  //Discussion of how the app idea started
                  const Text(
                    "THE HUMBLE",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Text(
                    "BEGINNINGS",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  const Text(
                    'Food Focus was born in the ground floor of the Gates building. It started as a niche journaling application for a small group of people, but it soon evolved to be something more. Now, we aspire to change the way all people (not really... but it sounds inspiring)',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(height: 15.0),
                  //Discussion into how the app works and what we provide a user
                  const Text("WHAT WE DO",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w900)),
                  const Text(
                    'At Food Focus, we empower users with insight into the food they put in their body and provide them the tools to keep track of their wellbeing. Here at Food Focus, everything about food is just a picture away!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(height: 15.0),
                  //A picture of the team and giving credit to each member
                  Semantics(
                    label: 'Image of Food Focus team',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          12.0), // Rounded corners for the image
                      child: Image.asset(
                        'assets/images/team.jpg', // Path to your image
                        width: MediaQuery.of(context).size.width * 0.9,
                        fit: BoxFit.cover, // Adjust the image size
                      ),
                    ),
                  ),
                  const Text("MEET THE TEAM",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w900)),
                  const Text(
                    'Left to right: Isabelle, Betty, Jaser, Thomas',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w200),
                  ),
                  const Text(
                    'Each member of our team has been integral to the design and implementation of our project. Special credit to Betty and Isabelle for handling logistics in addition to implementing views, Thomas for building out core functionality, and Jaser for backend processes.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
