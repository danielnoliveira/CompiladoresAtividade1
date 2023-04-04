class State {
  final String name;
  Map<String, State> transitions;

  State(this.name, this.transitions);

  State? getNextState(String char) {
    return transitions[char];
  }

  set updateTransitions(Map<String, State> newTransitions) {
    transitions = newTransitions;
  }
}
