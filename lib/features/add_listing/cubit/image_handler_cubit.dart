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

  void replaceCover({required int index}) {
    final updatedState = List.of(state);
    final temp = updatedState[0];
    updatedState[0] = updatedState[index];
    updatedState[index] = temp;
    emit(updatedState);
  }

  void deleteImage({required int index}) {
    final updatedState = state
        .asMap()
        .entries
        .where((e) => e.key != index)
        .map((entry) => entry.value)
        .toList();
    emit(updatedState);
  }

  void reset() {
    emit([]);
  }
}
