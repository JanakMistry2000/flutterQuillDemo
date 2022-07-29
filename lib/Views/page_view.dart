import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterquilldemo/add_note.dart';

class Noteview extends StatefulWidget {
  const Noteview({Key? key}) : super(key: key);

  @override
  State<Noteview> createState() => _NoteviewState();
}

class _NoteviewState extends State<Noteview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black54),
                        children: [
                          TextSpan(text: 'Step'),
                          TextSpan(text: ' '),
                          TextSpan(
                            text: '1 of 2',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const LinearProgressIndicator(value: 30),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  child: Text(
                    'New Shift Note',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                const Expanded(
                  child: AddNote(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
          child: ElevatedButton(
            child: const Text('Next'),
            onPressed: () {},
          ),
        ));
  }
}
