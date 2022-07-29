import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  QuillController? _quillController;

  var toolbar;

  var _focusNode = FocusNode();

  @override
  void initState() {
    initializeController();
    super.initState();
  }

  void initializeController() {
    try {
      setState(() {
        _quillController = QuillController.basic();
        toolbar = QuillToolbar.basic(
          controller: _quillController!,
          onImagePickCallback: _onImagePickCallback,
          onVideoPickCallback: _onVideoPickCallback,
          multiRowsDisplay: false,
          showUndo: false,
          showRedo: false,
          toolbarIconSize: 20,
          showCenterAlignment: false,
          showCodeBlock: false,
          showCameraButton: false,
          showDirection: false,
          showHeaderStyle: false,
          showVideoButton: false,
          showIndent: false,
          showDividers: false,
          showInlineCode: false,
          showLink: false,
          showUnderLineButton: true,
          showQuote: false,
          showStrikeThrough: false,
          showListCheck: false,
          showListNumbers: false,
          showJustifyAlignment: false,
          showRightAlignment: false,
          showLeftAlignment: false,
          showImageButton: false,
          showClearFormat: false,
          dialogTheme: QuillDialogTheme(dialogBackgroundColor: Colors.grey),
          customButtons: [
            QuillCustomButton(
                icon: Icons.format_bold,
                onTap: () {
                  quillDeltaToHtml(_quillController!.document.toDelta());
                })
          ],
          showAlignmentButtons: true,
        );
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RawKeyboardListener(
              focusNode: FocusNode(),
              child: QuillEditor(
                controller: _quillController!,
                focusNode: _focusNode,
                scrollController: ScrollController(),
                scrollable: true,
                autoFocus: false,
                readOnly: false,
                placeholder: 'Enter the shift note text here...',
                expands: false,
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
        Container(child: toolbar)
      ],
    );
  }

  Future<String> _onImagePickCallback(File file) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final copiedFile =
        await file.copy('${appDocDir.path}/${basename(file.path)}');
    return copiedFile.path.toString();
  }

  Future<String> _onVideoPickCallback(File file) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final copiedFile =
        await file.copy('${appDocDir.path}/${basename(file.path)}');
    return copiedFile.path.toString();
  }

  void quillDeltaToHtml(Delta delta) {
    final convertedValue = jsonEncode(delta.toJson());
    print(convertedValue);
    //_controller.document.root.children.print(convertedValue);
    // final markdown = deltaToMarkdown(convertedValue);
    //print(markdown);
    //final html = markdownToHtml(markdown);
    //print(html);
  }
}
