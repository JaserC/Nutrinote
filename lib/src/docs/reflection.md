# Reflection


## Topics
Our fist topic is Properties of People: Vision. We included images for users to know the different types of meals and navigation bar and buttons for users to easily use our app. We tested our colors for accessibility using the color contrast checker. Further, we also specifically chose our color pallette such that it would be in alignment with what food represents. 

The second topic is Properties of People: Motor Control. With our app design, we designed interactivity with Fitt's Law in mind. In all of our pages, related functionality is grouped together and even within those subsections, these elements are tightly interrconnected. For example, our home page demonstrates related elements and the ability to quickly view them. Our search screen demonstrates more of the same behavior by implementing a list view that plalys to how humans read, up-down. 

Our third topic is stateless and stateful widgets. In the navigation bar, we have widgets with different icons to indicate what each page is about. We also implemented food tiles in the Home, Search, and History screens, that allows users to click and view additional information about the specified meals. Also in the Settings screen, we have different buttons that allows the users to view more information about our app. For instance, the FAQ section provides instructions on how to use our app.

Our next topic is accessing sensors. We implemented a camera function, which allows users to use their front and back cameras to take pictures. Furthermore, we used the GPS function to track the user's location and provide nearby location on where they purchase specific meals.

Our fifth topic is querying web services. One of the calling cards for our application is a camera feature that classifies images. We use a web API made available by Google to perform this classification in a way that guarantees accuracy and simplicity. 

Our last topic is secure data persistence. We included a History screen, which allows users to add their favorited meals and allows them to look back at the meals that saved. We also wanted to have the pictures we took with camera to be saved for storage. Whether the app is open or closed, this data persists until a user deletes the application. 


## Changes
Our final implementation is similar to our original concept. However, some minor change we did were removing some extra screen views. For instance, we removed the Past Meals section in our app because it displays the same meals as the History screen. This is redudant information because we have the History screen that allows users to save existing meals, favorited meals, and a way to stored the pictures the user took. Furthermore, the information for each meal are sample data and may not be accurate because of the variety of servings and meals. We also scrapped functionality that would use GPS data to map where certain foods can be found closest to you, but it seemed like a lofty aspiration that would require integrating a whole new API. Overall, our changes were minor and didn't change our original vision for our app.


## Challenges
The challenges we faced were technical topics. First, we wanted to figure out how to implement the camera feature in our app, in which we asked the course staff for assistance. The location and microphone notifications doesn't pops up to prompt the user, in which took more time to figure out the error. Furthermore, since we have limited time to work on the app, we discussed on what to focus on implemented and what features we will need to cut. Also, we used Google Gemini API for the first time, so we needed to learn and deepen our understanding how to use it in our app. Furthermore, since this is a collborative project, we need to stay on top of our communication let each other know about our git commits and make sure there are no git conflicts when merging. In all, we learned new tools such as using the camera feature and Google Gemini API and deepen our skills in using git.

## Accessibility and Usability
For future work of our app, we would like to continue working with Google Gemini API and make sure our camera can detect food. To this end, maybe we can experiment with different multimodal models for possible improvements to classification accuracy. After detecting food in the photos, we would like to work more on showing more comprehensivve nutritional facts to the user in addition to possibly tracking other information for their personal notice (like Caloric intake or other health measures). Besides the technical areas, we would like to improve the app interface and create a cleaner and sleeker design if have more time. Lastly, we would like to increase usability of this app by storing information about the user's physical health and diet in order to provide more ways and meals recommendations based on the user's lifestyle. To improve the accessibility of Food Focus, we would like to provide different modes such as dark and light mode and text resizing for people with vision disabilities. Furthermore, we would like to implement a Google Maps API so it would provide better navigation for users to know where to purchase their meals.

## Citations
The images in our app are from Google Images. Citing all of their locations would require too much space, but a reverse image search will yield those sources. Also, we heavily referenced Stack Overflow for git and debugging help. We asked both instructors, Ben and Lauren, and other TAs to help us getting started on the camera part of the app. We followed some YouTube videos to help us implement the camera feature and navigation bar: https://www.youtube.com/watch?v=MSv38jO4EJk and https://www.youtube.com/watch?v=TtXER1_Cq3E. The icons in our app are from https://thenounproject.com. Some helpful articles to change our app icon are https://www.geeksforgeeks.org/flutter-changing-app-icon/ and https://pub.dev/packages/flutter_launcher_icons. We referenced from the Flutter docs and class materials for our code. We used Google Gemini API for our cloud vision API: https://ai.google.dev/.

A chunk of code also came from a variety of past homework assignments, namely the Journal, Drawing App, and Food Finder. It wasn't copied code so much as the concepts and structure in which they were applied were similar. 

## Reflection Questions
What do you feel was the most valuable thing you learned in CSE 340 that will help you beyond this class, and why?

The most valuable thing we learned in CSE 340 was understanding how to create widgets and creating interactiving actions such as redoing, undoing, drawing, adding new widgets etc. Most of our perojcts allowed us to develop new skills in coding with Flutter such as learning how to use the location/GPS feature and storing information. Overall, being able to code fun features in our apps with Flutter is helpful to know and to use. Going beyond this class, we have a better understaning how to improve the accessiablity and usability in our future apps.

If you could go back and give yourself 2-3 pieces of advice at the beginning of the class, what would you say and why? Alternatively: what 2-3 pieces of advice would you give to future students who take CSE 340 and why?

An advice to give for future students who take CSE 340 would be starting on your work early and ask TA for help during OH. Since there is only an week to work on each app project, the class is fast-paced and you may not have enough time to finish the project. However, there are resubmissions, but you'll need to have time to fix your previous assignment while also working on the next app assignment. One thing I would've done differently is making bare-bone submissions for the original deadline rather than leaving things up to the resubmission window because that feedback can be quite valuable. Thus, it's important to allocate your assignments and set time for yourself to work on CSE 340 assignments.

Another advice is that the class would provide basic Flutter code to introduce you to new materials. However, you would need to research and take additional time outside of class to learn more on how to implement specific features in your app assignments. Overall, the class can be hard to keep up and you will need to take time to learn Flutter.
