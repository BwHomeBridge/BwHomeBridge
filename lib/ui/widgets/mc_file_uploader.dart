import 'package:bw_home_bridge/ui/widgets/mc_button.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';

class McFileUploader extends StatefulWidget {
  final String documentName;

  McFileUploader({this.documentName = 'Select document'});

  @override
  _McFileUploaderState createState() => _McFileUploaderState();
}

class _McFileUploaderState extends State<McFileUploader> {
  String? _fileName;
  bool _isUploading = false;
  double _uploadProgress = 0;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
        _uploadProgress = 0;
        _isUploading = true;
      });
      _uploadFile(result.files.single.path!);
    }
  }

  void _uploadFile(String filePath) async {
    Dio dio = Dio();
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(filePath, filename: _fileName),
    });

    dio.post(
      "YOUR_UPLOAD_URL_HERE",
      data: formData,
      onSendProgress: (int sent, int total) {
        setState(() {
          _uploadProgress = sent / total;
        });
        if (sent == total) {
          setState(() {
            _isUploading = false;
          });
        }
      },
    ).catchError((error) {
      setState(() {
        _isUploading = false;
      });
    });
  }

  void _deleteFile() {
    setState(() {
      _fileName = null;
      _uploadProgress = 0;
      _isUploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _pickFile,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: McColors.secondary2,
              border: Border.all(color: McColors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _fileName == null
                      ? Flexible(child: Text(widget.documentName))
                      : Row(
                          children: [
                            Icon(Icons.insert_drive_file, color: Colors.orange),
                            SizedBox(width: 8),
                            Text(_fileName!),
                          ],
                        ),
                ),
                if (_fileName != null)
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: _deleteFile,
                  )
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0)
                        .copyWith(right: 0),
                    child: Transform.scale(
                      scale: .6,
                      child: McButton(
                        'Upload',
                        verticalPadding: 0,
                        horizontalPadding: 0,
                        elevation: .2,
                        color: McColors.orange,
                        onPressed: _pickFile,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (_isUploading) ...[
          SizedBox(height: 20),
          LinearProgressIndicator(
            value: _uploadProgress,
          ),
          SizedBox(height: 10),
          Text('${(_uploadProgress * 100).toStringAsFixed(0)}% uploaded'),
        ],
      ],
    );
  }
}
