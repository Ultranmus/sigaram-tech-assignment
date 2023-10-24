# sigaram_tech_assignment

This is a simple Android app created using Flutter that integrates with Firebase/Firestore to fetch data and display it. The app consists of two screens: a settings screen and a video player screen.

## Screens

### Screen #1: Settings

- The app opens with the Settings page by default.
- Data is fetched from Firestore collections for the options displayed in the bottom tray, language options, and color options.

Firestore Collection Schema:
- `bottom_tray_options`: Contains options for the bottom tray.
- `language_options`: Contains language options.
- `color_options`: Contains color options.

### Screen #2: Video Player

- The video player screen allows you to scroll up to view the next video.
- Video data is fetched from the Firestore collection `video_links`.

Firestore Collection Schema:
- `video_links`: Contains video titles and links.

## How to Run the App

1. Clone this repository.
2. Set up Firebase for your project by creating a Firebase project and adding your Firebase configuration to `android/app/google-services.json`.
3. Run the app using the following command:
   ```
   flutter run
   ```

## Dependencies

This project uses the following dependencies:

- `firebase_core` for Firebase integration.
- `cloud_firestore` for Firestore database access.
- `video_player` for video playback.

Install these dependencies using `flutter pub get` if they are not already installed.


