# Thought Provocative Journal

A Flutter based clean and minimalistic journal which allows you to tag emotions and people to events in your life for future analysis.

## Screens in this app

<p float="left">
  <img src="https://drive.google.com/uc?export=view&id=1JpZXOUK9bXBOvBv4RTrBoNBs8HALKDbb" height="340em" />
  <img src="https://drive.google.com/uc?export=view&id=1JBPiAELkzkAqdWfT4VgsPy3JJPGWE-Y2"  height="340em" /> 
  <img src="https://drive.google.com/uc?export=view&id=1KXxf629Exn8rEwOlXP29GSStDdUDXz0j"  height="340em" /> 
  <img src="https://drive.google.com/uc?export=view&id=1KHwkecUs2yNSPG_Kgtb_7o44xoW6sYbJ"  height="340em" />
  <img src="https://drive.google.com/uc?export=view&id=1KGt3bjSdZev1Ld4bcAhl0ksKqc6xT6lH"  height="340em" /> 
  <img src="https://drive.google.com/uc?export=view&id=1KDFkrv-w3SCydgwOkUZz9ECV8uOafs06"  height="340em" /> 
  <img src="https://drive.google.com/uc?export=view&id=1JLMhrHeM5es7no0hXp0014t3xUR1YKcl"  height="340em" /> 
  <img src="https://drive.google.com/uc?export=view&id=1KYAEd37ztnsXcs5ehxsD7MwZCU8g8UHv"  height="340em" />
  <img src="https://drive.google.com/uc?export=view&id=1KG2GOj0CmQnlwqbIOCViwBO0NH3S6lWq"  height="340em" /> 
  <img src="https://drive.google.com/uc?export=view&id=1KOmOUp_bcbW274ZV90-r5yppYDVb1Qri"  height="340em" /> 
  <img src="https://drive.google.com/uc?export=view&id=1MEV41tUi7c3Lc8ETX9npyYdN5rxxSxIK"  height="340em" /> 
  
</p>

## Custom Editions to Default Package

#### material/bottom_sheet.dart - _ModalBottomSheetLayout

```
BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0.0,
      // maxHeight: isScrollControlled
      //   ? constraints.maxHeight
      //   : constraints.maxHeight * 9.0 / 16.0,
      maxHeight: constraints.maxHeight,
    );
```


#### material/text_selection.dart - _TextSelectionToolbar

```

const _TextSelectionToolbar({
    Key key,
    this.handleEmotion,
    this.handleCut,
    this.handleCopy,
    this.handlePaste,
    this.handleSelectAll,
}) : super(key: key);

final VoidCallback handleEmotion;  
final VoidCallback handleCut;
final VoidCallback handleCopy;
final VoidCallback handlePaste;
final VoidCallback handleSelectAll;

// Inside Build 

items.add(FlatButton(child: Text('EMOTION'), onPressed: handleEmotion));

```

#### material/text_selection.dart - _MaterialTextSelectionControls

```
child: _TextSelectionToolbar(
    handleEmotion: () => handleEmotion(delegate),
    handleCut: canCut(delegate) ? () => handleCut(delegate) : null,
    handleCopy: canCopy(delegate) ? () => handleCopy(delegate) : null,
    handlePaste: canPaste(delegate) ? () => handlePaste(delegate) : null,
    handleSelectAll:
        canSelectAll(delegate) ? () => handleSelectAll(delegate) : null,
),
````

#### widgets/text_selection.dart - TextSelectionControls

```
import 'package:thought_provocative_journal/tools/text_input_screen.dart';
```

```
// Custom Function

  void handleEmotion(TextSelectionDelegate delegate) {
    final TextEditingValue value = delegate.textEditingValue;
    String selectedText = value.selection.textInside(value.text);
    delegate.textEditingValue = TextEditingValue(
      text: value.text,
      selection: TextSelection.collapsed(offset: value.selection.end),
    );
    delegate.bringIntoView(delegate.textEditingValue.selection.extent);
    delegate.hideToolbar();

    // Custom Function which is imported
    works(selectedText);
  }
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

