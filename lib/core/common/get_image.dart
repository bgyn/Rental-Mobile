import 'package:image_picker/image_picker.dart';

Future<XFile?> getImage(ImageSource src) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: src);
  XFile? file = pickedFile;
  return file;
}
