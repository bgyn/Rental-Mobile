import 'package:image_picker/image_picker.dart';

Future<XFile?> getImage(ImageSource src) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: src);
  if (pickedFile == null) {
    return null;
  }
  return pickedFile;
}
