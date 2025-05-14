import 'dart:io';

bool winner = false;
bool isXturn = true;
int moveCount = 0;
List<String> values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
List<String> combination = [
  '012',
  '345',
  '678',
  '036',
  '147',
  '258',
  '048',
  '246',
];
void main() {
  generate_board();
  get_char();
}

bool check_combintions(String combination, String check) {
  List<int> numbers = combination.split('').map((e) => int.parse(e)).toList();
  bool match = false;
  for (final i in numbers) {
    if (values[i] == check) {
      match = true;
    } else {
      match = false;
      break;
    }
  }
  return match;
}

void check_winner(player) {
  for (final i in combination) {
    bool combination_validaty = check_combintions(i, player);
    if (combination_validaty == true) {
      print('$player Won.........');
      winner = true;
      break;
    }
  }
}

void get_char() {
  print('choose number for ${isXturn == true ? 'X' : 'O'}');
  int number = int.parse(stdin.readLineSync()!);
  values[number - 1] = isXturn ? "X" : "O";
  isXturn = !isXturn;
  moveCount++;

  if (moveCount == 9) {
    winner = true;
    print('Draw');
  } else {
    generate_board();
  }
  check_winner("O");
  check_winner("X");
  if (winner == false) get_char();
}

void generate_board() {
  // print('  |  |  ');
  print(' ${values[0]} | ${values[1]} | ${values[2]}');
  print('---|---|---');
  // print('  |  |  ');
  print(' ${values[3]} | ${values[4]} | ${values[5]}');
  print('---|---|---');
  // print('  |  |  ');
  print(' ${values[6]} | ${values[7]} | ${values[8]}');
}
