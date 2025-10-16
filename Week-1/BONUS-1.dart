enum Direction { north, east, south, west }

Direction turnRight(Direction dir) {
  switch (dir) {
    case Direction.north:
      return Direction.east;
    case Direction.east:
      return Direction.south;
    case Direction.south:
      return Direction.west;
    case Direction.west:
      return Direction.north;
  }
}

Direction turnLeft(Direction dir) {
  switch (dir) {
    case Direction.north:
      return Direction.west;
    case Direction.west:
      return Direction.south;
    case Direction.south:
      return Direction.east;
    case Direction.east:
      return Direction.north;
  }
}

List<int> advance(int x, int y, Direction dir) {
  switch (dir) {
    case Direction.north:
      y += 1;
      break;
    case Direction.east:
      x += 1;
      break;
    case Direction.south:
      y -= 1;
      break;
    case Direction.west:
      x -= 1;
      break;
  }
  return [x, y];
}

void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  for (var instruction in instructions.split('')) {
    switch (instruction) {
      case 'R':
        direction = turnRight(direction);
        break;
      case 'A':
        var newPosition = advance(x, y, direction);
        x = newPosition[0];
        y = newPosition[1];
        break;
      case 'L':
        direction = turnLeft(direction);
        break;
      default:
        print("Invalid instruction!");
    }
  }

  // Print the final position and direction
  print("Final position:  {$x, $y}");
  print("Facing:  $direction");
}
