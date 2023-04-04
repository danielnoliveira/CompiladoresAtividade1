import 'package:afd_lexico/afd.dart';
import 'package:afd_lexico/state.dart';

void main(List<String> args) {
  State q1 = State('Q1', {});
  State q2 = State('Q2', {});
  State q3 = State('Q3', {});
  State qStar = State('Q*', {});

  State q0 = State('Q0', {});

  Map<String, State> q1Transitions = {
    '0': q1,
    '1': q1,
    '2': q1,
    '3': q1,
    '4': q1,
    '5': q1,
    '6': q1,
    '7': q1,
    '8': q1,
    '9': q1,
    '.': q3,
  };
  Map<String, State> q0Transitions = {
    '0': q1,
    '1': q1,
    '2': q1,
    '3': q1,
    '4': q1,
    '5': q1,
    '6': q1,
    '7': q1,
    '8': q1,
    '9': q1,
    '+': q2,
    '-': q2,
  };
  Map<String, State> q2Transitions = {
    '0': q1,
    '1': q1,
    '2': q1,
    '3': q1,
    '4': q1,
    '5': q1,
    '6': q1,
    '7': q1,
    '8': q1,
    '9': q1,
  };
  Map<String, State> q3Transitions = {
    '0': q3,
    '1': q3,
    '2': q3,
    '3': q3,
    '4': q3,
    '5': q3,
    '6': q3,
    '7': q3,
    '8': q3,
    '9': q3,
  };

  q0.updateTransitions = q0Transitions;
  q1.updateTransitions = q1Transitions;
  q2.updateTransitions = q2Transitions;
  q3.updateTransitions = q3Transitions;

  AFD afd = AFD(
    ['0', '1,', '2', '3', '4', '5', '6', '7', '8', '9', '.', '+', '-'],
    q0,
    [qStar],
    qStar,
  );

  // print(afd.isInputValid('18516'));
  print(afd.getSubstrings(
      'asdasd561asds-4.35-4.9-54+984-51.594.98ad5+18asd5.8asd516-5-5'));
}
