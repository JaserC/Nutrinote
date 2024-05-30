# Final Project: Food Focus

## Description
Food Focus is a reverse image search application that gives users the ability to gain insights into the nutritional information of the food they consume on a daily basis. Along with this comes the ability to keep track of what, when, and where you eat. 

For Food Focus, users can take a pictures of their meals that their eating and the app provides nutritional information and locations on where they can purchase the meals. Also, users can search up existing meals and look up more nutritional information on these meals. Users can save their meals of the photos they took in the gallery, which they can look back at the meals they have eaten. Food Focus allows the user to have more freedom to log in their meals and able to understand more about their intakes.

## Data Design and Data Flow
Describe the data structures you designed to hold user data, and how you architected your app to use Providers (or another framework, like Bloc) to propagate changes to these data in a reactive way.

Our Flutter application is structured such that the models directory contains definitions for data objects such as FoodItem which contains models for the different views to represent our foods. State management is centralized in the providers directory, where HistoryProvider manages user's previous food entries and LanguageProvider is prepared to handle language settings (however not fully implemented), both using Flutter's provider pattern to propagate changes reactively across the app. We use these providers to reflect new food pictures that users may want to add to their history. These upserts are referenced both in the camera screen after a Future and in the search screen, where any item from our dummy data can be upserted into the global data store. 

Additionally, the utils directory includes essential utilities like API keys and UUID generation. Each screen of the app, located under the views directory, is responsible for different functionalities, such as user accounts(not fully implemented), home screen, searching, history, and camera integration, and reacts to state changes from providers to update these pages. 

## How to Use
Explain how to build and run the project, as well as the layout of your project structure (what files/classes implement what functionality).

Our application works solely for Android mobile devices. IOS mobile devices can run the app and get reasonable results, but there is a semi-important bug regarding IOS file paths that mess with our implementation, so for grading purposes, we reccomend using an android to test the functionality of the app. 

With that said, our app also has an API key that is neccessary that is stored in a static class. This file has been linked in an edstem post by Jaser Chowdhury called "Group 18 API Key (Final Project Submission)" - This is post #461. The file is called apiKey.dart, and instructions are on that post about how to use it.  

To run the application, clone the repository and run a simple flutter run to pull the dependencies. Outside of getting the API key file,there are no special build steps or anything of the sort. While running the application, you will be prompted for permissions. In these cases, please accept. For the sake of robustness, we have produced error handling for the scenarios in which you don't, but the full user experience comes from enabling all permissions. 

For layout, we have all of our views stored in a views folder. These implement the different screens you will see as you navigate through the application. We have a utils folder as well that holds some key functionality, such as a method to query the API for image classification or a UUID generator that our secure storage relies on. We have 2 more folders that are interrelated: providers and models. These folders set the structure for saved information, such as what information needs to be in Food Elements and how to update the state across the application. 

## Installation
Within a particular ecosystem, there may be a common way of installing things, such as using Yarn, NuGet, or Homebrew. However, consider the possibility that whoever is reading your README is a novice and would like more guidance. Listing specific steps helps remove ambiguity and gets people to using your project as quickly as possible. If it only runs in a specific context like a particular programming language version or operating system or has dependencies that have to be installed manually, also add a Requirements subsection.

We do not have any special install instructions or command line prompts. If you have used flutter before, then you already know how to run our flutter application right out of the box. 

## Support
In the profile section of our app, users can see commonly asked questions and learn more about how to use this application. There are also guides on what to do in case of problems, such as in a scenario where a user is having trouble with taking a photo of their meal. 

Here, we would like to elaborate on some possible edge cases. With the functionality of saving a food to your history, there are 2 different ways. When going through the search screen, for when you want to note a food you'd like to try or just didn't have the ability to take a picture in the moment, you can add to the provider from there. You might be queried for location permissions in this instance, in which case please accept. If you do not, then we will display "No location" for your meal pictures history. 

For the camera, you may take a picture and recieve no response from the application. Because so much is running in the backend, please be patient and wait a few seconds for the image preview to pop up. Nothing has broken, nor has anything gone wrong - It's just a tad slow. When taking a picture, you may also find an error message on the Camera tab. If this is the case, a solution is already proposed, but we will reiterate that we do need permissions here so please manually enable them if you have declined them.  


## Authors and acknowledgment
Isabelle Valena Tinsley, Jaser Chowdhury, Thomas Chen, Betty Cheng and help from the CSE 340 Course Staff.

## Project status
If you have run out of energy or time for your project, put a note at the top of the README saying that development has slowed down or stopped completely. Someone may choose to fork your project or volunteer to step in as a maintainer or owner, allowing your project to keep going. You can also make an explicit request for maintainers.

This app came at 0 monetary cost and the MVP has already been constructed. The final version of the application we are submitting is a middle-ground between the bare minimum functionality and a fully-fleshed out app (hence why some pages may have placeholders).