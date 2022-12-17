import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutterblocdemo/respositories/frases_repository.dart';

part 'practica_event.dart';
part 'practica_state.dart';

class FrasesBloc extends Bloc<FrasesEvent, FrasesState> {
  final FrasesRepository _frasesRepository;

  FrasesBloc(this._frasesRepository);

  @override
  FrasesState get initialState => FraseNoCargada();
// 2. Metodo que se realizara cuando se realice este evento
  @override
  Stream<FrasesState> mapEventToState(FrasesEvent event) async* {
    if (event is CargarFrase) {
      yield* _cargarFrase();
    }
  }

  Stream<FrasesState> _cargarFrase() async* {
    String frase = await _frasesRepository.fraseAleatoria();

    yield (FraseCargada(frase));
  }
}
