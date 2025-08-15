import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:math';

// Note model class
class Note {
  int id;
  String title;
  String content;
  DateTime date;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
  });

  // Convert note to map for storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'date': date.millisecondsSinceEpoch,
    };
  }

  // Create note from stored map
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }
}

// Note service functions
class NoteService {
  static final Box _notesBox = Hive.box('notes');

  // Get all notes sorted by date
  static List<Note> getAllNotes() {
    final notesList = _notesBox.values.map((noteData) {
      return Note.fromMap(Map<String, dynamic>.from(noteData));
    }).toList();

    // Sort by date (newest first)
    notesList.sort((a, b) => b.date.compareTo(a.date));
    return notesList;
  }

  // Generate unique 3-digit ID
  static int generateUniqueId() {
    Random random = Random();
    int newId;
    List<Note> existingNotes = getAllNotes();

    do {
      newId = 100 + random.nextInt(900); // 100-999
    } while (existingNotes.any((note) => note.id == newId));

    return newId;
  }

  // Save note to storage
  static void saveNote(Note note) {
    _notesBox.put(note.id, note.toMap());
  }

  // Delete note by ID
  static void deleteNote(int id) {
    _notesBox.delete(id);
  }
}

// Main app entry point
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for local storage
  await Hive.initFlutter();
  await Hive.openBox('notes');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData(
        // Black and green theme
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.black,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.green,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}