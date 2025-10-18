class CustomDuration {
  final int _milliseconds;
  
  // Q1: Constructors with validation
  CustomDuration({int milliseconds = 0}) 
    : _milliseconds = _validateDuration(milliseconds);

  CustomDuration.fromHours(int hours) 
    : _milliseconds = _validateDuration(hours * 60 * 60 * 1000);

  CustomDuration.fromMinutes(int minutes) 
    : _milliseconds = _validateDuration(minutes * 60 * 1000);

  CustomDuration.fromSeconds(int seconds) 
    : _milliseconds = _validateDuration(seconds * 1000);

  static int _validateDuration(int milliseconds) {
    if (milliseconds < 0) {
      throw ArgumentError('Duration cannot be negative');
    }
    return milliseconds;
  }

  int get inMilliseconds => _milliseconds;
  int get inSeconds => _milliseconds ~/ 1000;
  int get inMinutes => _milliseconds ~/ (60 * 1000);
  int get inHours => _milliseconds ~/ (60 * 60 * 1000);
  
  // Q2:Operator overloading
  bool operator >(CustomDuration other) {
    return _milliseconds > other._milliseconds;
  }
  CustomDuration operator +(CustomDuration other) {
    return CustomDuration(milliseconds: _milliseconds + other._milliseconds);
  }
  CustomDuration operator -(CustomDuration other) {
    if (other._milliseconds > _milliseconds) {
      throw ArgumentError('Cannot subtract: result would be negative');
    }
    return CustomDuration(milliseconds: _milliseconds - other._milliseconds);
  }
  bool operator <(CustomDuration other) => _milliseconds < other._milliseconds;
  bool operator >=(CustomDuration other) => _milliseconds >= other._milliseconds;
  bool operator <=(CustomDuration other) => _milliseconds <= other._milliseconds;
  
  @override
  bool operator ==(Object other) =>
      other is CustomDuration && _milliseconds == other._milliseconds;
  
  @override
  int get hashCode => _milliseconds.hashCode;
  
  @override
  String toString() {
    return 'CustomDuration: ${inHours}h ${inMinutes % 60}m ${inSeconds % 60}s ${_milliseconds % 1000}ms';
  }
}

void main() {
  final duration1 = CustomDuration.fromHours(2);
  final duration2 = CustomDuration.fromMinutes(30);
  final duration3 = CustomDuration.fromSeconds(45);
  
  print('Duration 1: $duration1'); // 2h 0m 0s 0ms
  print('Duration 2: $duration2'); // 0h 30m 0s 0ms
  print('Duration 3: $duration3'); // 0h 0m 45s 0ms
  
  // Testing operator overloading
  print('Duration1 > Duration2: ${duration1 > duration2}'); // true
  print('Duration2 > Duration3: ${duration2 > duration3}'); // true
  
  final sum = duration1 + duration2;
  print('Sum: $sum'); // 2h 30m 0s 0ms
  
  final difference = duration1 - duration2;
  print('Difference: $difference'); // 1h 30m 0s 0ms
  
  // Testing exception handling
  try {
    CustomDuration(milliseconds: -100);
  } catch (e) {
    print('Error: $e'); // Duration cannot be negative
  }
  
  try {
    duration2 - duration1;
  } catch (e) {
    print('Error: $e'); // Cannot subtract: result would be negative
  }
}