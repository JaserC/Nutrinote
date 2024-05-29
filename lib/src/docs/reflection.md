# Reflection


## Topics
Our fist topic is Properties of People: Vision. We included images for users to know the different types of meals and navigation bar and buttons for users to easily use our app. We tested our colors for accessiablity using the color contrast checker.

The second topic is Properties of People: Motor Control. In our app, we provide uniqueness and flexibility for our users to keep track of their nutrition intakes. Users have the ability to add meals that like to keep track by taking a photo of their food and upload in our app. Furthermore, if a user would like to remember a specific meal, they use our search bar feature to search up the meal.

Our third topic is stateless and stateful widgets. In the navigation bar, we have widgets with different icons to indicate what each page is about. We also implemented food tiles in the Home, Search, and History screens, that allows users to click and view additional information about the specified meals. Also in the Settings screen, we have different buttons that allows the users to view more information about our app. For instance, the FAQ section provides instructions on how to use our app.

Our next topic is accessing sensors. We implemented a camera function, which allows users to use their front and back cameras to take pictures. Furthermore, we used the GPS function to track the user's location and provide nearby location on where they purchase specific meals.

Our fifth topic is querying web services. We have a search button, that allows the users to search up existing meals and to view the nutritional information. For instance, if you search up "Chicken", Food Focus provides meals that has chicken.

Our last topic is secure data persistence. We included a History screen, which allows users to add their favorited meals and allows them to look back at the meals that saved. We also wanted to have the pictures we took with camera to be saved for storage.


## Changes
Our final implementation is similar to our original concept. However, some minor change we did were removing some extra screen views. For instance, we removed the Past Meals section in our app because it displays the same meals as the History screen. This is redudant information because we have the History screen that allows users to save existing meals, favorited meals, and a way to stored the pictures the user took. Furthermore, we reduced the amount of nutritional information for each meal because there's a lot of information to handle using our API. So, we decided to have only 3 information for each meal. Also, based on the scope since there were about 2 weeks to work on the project, we decided to make sure the camera is working, but the camera won't be able to detect the food and provided additional nutritional information. Furthermore, the information for each meal are sample data and may not be accurate because of the variety of servings and meals. Overall, our changes were minor and didn't change our original vision of the app.


## Challenges
The challenges we faced were techincal topics. First, we wanted to figure out how to implement the camera feature in our app, in which we asked the course staff for assistance. The location and microphone notifications doesn't pops up to prompt the user, in which took more time to figure out the error. Furthermore, since we have limited time to work on the app, we discussed on what to focus on implemented and what features we will need to cut. Also, we used Google Gemini API for the first time, so we needed to learn and deepen our understanding how to use it in our app. Furthermore, since this is a collborative project, we need to stay on top of our communication let each other know about our git commits and make sure there are no git conflicts when merging. In all, we learned new tools such as using the camera feature and Google Gemini API and deepen our skills in using git.



## Accessibility and Usability
Describe two areas of future work for your app, including how you could increase the accessibility and usability of this app

For future work of our app, we would like to continue working with Google Gemini API and make sure our camera can detect food. After detecting food in the photos, we would like to work more on showing nutritional facts about the photos the users had taken. Furthermore, we would like to create a way to store the photos the users took in the app and able to look back the meals they ate in the History section. Besides the technical areas, we would like to improve the app interface and create a cleaner and sleeker design if have more time. Lastly, we would like to increase usability of this app by storing information about the user's physical health and diet in order to provide more ways and meals recommendations based on the user's lifestyle. To improve the accessibility of Food Focus, we would like to provide different modes such as dark and light mode and text resizing for people with vision disabilities. Furthermore, we would like to implement a Google Maps API so it would provide better navigation for users to know where to purchase their meals.

## Citations
The images in our app are from Google Images. Also, we referenced Stack Overflow for git and debugging help. We asked both instructors, Ben and Lauren, and other TAs to help us getting started on the camera part of the app. We followed some YouTube videos to help us implement the camera feature and navigation bar: https://www.youtube.com/watch?v=MSv38jO4EJk and https://www.youtube.com/watch?v=TtXER1_Cq3E. The icons in our app are from https://thenounproject.com. Some helpful articles to change our app icon are https://www.geeksforgeeks.org/flutter-changing-app-icon/ and https://pub.dev/packages/flutter_launcher_icons. We referenced from the Flutter docs and class materials for our code. We used Google Gemini API for our cloud vision API: https://ai.google.dev/.

## Reflection Questions
What do you feel was the most valuable thing you learned in CSE 340 that will help you beyond this class, and why?

If you could go back and give yourself 2-3 pieces of advice at the beginning of the class, what would you say and why? Alternatively: what 2-3 pieces of advice would you give to future students who take CSE 340 and why?