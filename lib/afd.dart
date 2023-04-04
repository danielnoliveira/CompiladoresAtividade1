import 'package:afd_lexico/state.dart';

class AFD {
  final List<String> alphabet;
  final State initialState;
  final List<State> finalStates;
  final State other;

  AFD(this.alphabet, this.initialState, this.finalStates, this.other);

  bool isInputValid(String input) {
    State? currentState = initialState;
    for (var rune in input.runes) {
      String char = String.fromCharCode(rune);
      currentState = currentState?.getNextState(char) ?? other;
      if (currentState == other) {
        return false;
      }
    }
    currentState = currentState?.getNextState('EOF') ?? other;
    return finalStates.contains(currentState);
  }

  List<String> getSubstrings(String input) {
    String newInput = '$input!';
    State currentState = initialState;
    List<String> substrings = [];
    int charIndex = 0;
    int startSubstringIndex = 0;
    while (charIndex != newInput.length) {
      String char = newInput[charIndex];
      currentState = currentState.getNextState(char) ?? other;
      // print(char);
      // print(currentState.name);
      if (currentState == other) {
        // if (char == '.') {
        //   charIndex--;
        // }
        String possibleNumber =
            newInput.substring(startSubstringIndex, charIndex);

        double? value = double.tryParse(possibleNumber);

        if (value != null) {
          substrings.add(possibleNumber);
        } else {
          charIndex++; //= char == '.' ? 0 : 1;
        }
        startSubstringIndex = charIndex;
        currentState = initialState;
      } else {
        charIndex++;
      }
    }
    return substrings;
  }
}
