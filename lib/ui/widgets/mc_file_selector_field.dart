import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class McFileSelectorField extends StatefulWidget {
  final void Function(List<PlatformFile>) onFilesSelected;

  const McFileSelectorField({required this.onFilesSelected, Key? key})
      : super(key: key);

  @override
  _McFileSelectorFieldState createState() => _McFileSelectorFieldState();
}

class _McFileSelectorFieldState extends State<McFileSelectorField> {
  List<PlatformFile>? _selectedFiles;

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4', 'mov'],
    );

    if (result != null) {
      setState(() {
        _selectedFiles = result.files;
      });
      widget.onFilesSelected(result.files);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _pickFiles,
          child: Text('Select Images/Videos'),
        ),
        const SizedBox(height: 10),
        _selectedFiles != null
            ? Column(
                children: _selectedFiles!.map((file) {
                  return ListTile(
                    title: Text(file.name),
                    subtitle: Text(file.size.toString() + ' bytes'),
                  );
                }).toList(),
              )
            : Text('No files selected'),
      ],
    );
  }
}
