FLUTTER NOTES APP
==================

A simple and elegant notes application built with Flutter, featuring a black and green theme with local storage capabilities.

PROJECT STRUCTURE
------------------
- main.dart           - Main app entry point, Note model, and NoteService
- home_screen.dart     - Home screen displaying list of all notes
- add_note_screen.dart - Screen for adding new notes
- view_note_screen.dart- Screen for viewing individual notes in detail

FEATURES
--------
- Create new notes with title and content
- View all notes in a sorted list (newest first)
- Delete notes with confirmation dialog
- Unique 3-digit ID generation for each note (100-999)
- Local storage using Hive database
- Dark theme with black background and green accents
- Date and time tracking for each note
- Content preview in the notes list
- Search-friendly note IDs displayed

TECHNICAL DETAILS
-----------------
- Built with Flutter framework
- Uses Hive for local data persistence
- Notes are automatically sorted by creation date (newest first)
- Generates unique random 3-digit IDs for each note
- Responsive design with proper text formatting
- Input validation for note titles

HOW TO RUN THE APP
------------------
1. Make sure you have Flutter installed on your system
2. Clone or download the project files
3. Open terminal/command prompt in the project directory
4. Run: flutter pub get
   (This will install required dependencies including hive_flutter)
5. Connect a device or start an emulator
6. Run: flutter run

DEPENDENCIES
------------
- flutter/material.dart (UI framework)
- hive_flutter (local database storage)

USAGE
-----
1. Launch the app to see the notes list (empty initially)
2. Tap the green '+' button to add a new note
3. Enter a title (required) and content (optional)
4. Tap the save icon or use the save button
5. View your note in the main list
6. Tap any note to view it in full screen
7. Use the delete button (trash icon) to remove notes
8. All notes are automatically saved locally on your device

THEME
-----
- Background: Black
- Primary color: Green
- Text: White/Light gray
- Cards: Dark gray
- Accent elements: Green highlights

The app provides a clean, minimalist interface perfect for quick note-taking and organization.