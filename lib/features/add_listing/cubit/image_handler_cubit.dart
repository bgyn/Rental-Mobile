import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentpal/core/common/get_image.dart';

class ImageHandlerCubit extends Cubit<List<XFile>> {
  ImageHandlerCubit() : super([]);

  void getImages({required ImageSource src}) async {
    final file = await getImage(src);

    if (file == null) return;
    emit([...state, file]);
  }

}
