import 'package:injectable/injectable.dart';

import '../repository/home_repository.dart';
import 'base_usecase.dart';

@lazySingleton
class DeleteUploadImageUseCase extends UseCase<int, int> {
  final HomeRepository _repository;

  DeleteUploadImageUseCase(this._repository);

  @override
  Future<int> call(int param) => _repository.deleteUploadImage(param);
}
