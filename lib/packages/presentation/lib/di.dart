import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/di.config.dart';

@injectableInit
void configureDependencies({required GetIt getIt}) => getIt.init();
