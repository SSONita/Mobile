enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  @override
  String toString() => '$_street, $_city, $_zipCode';
}

class Employee {
  final String _name;
  final double _baseSalary;
  List<Skill> _skills;
  int _yearsOfExperience;
  Address? _address;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  int get yearsOfExperience => _yearsOfExperience;
  Address? get address => _address;

  Employee(
    this._name,
    this._baseSalary, {
    List<Skill>? skills,
    int yearsOfExperience = 0,
    Address? address,
  }) : _skills = skills ?? const [],
       _yearsOfExperience = yearsOfExperience,
       _address = address;

  Employee.mobileDeveloper(
    String name,
    double baseSalary, {
    List<Skill>? skills,
    int yearsOfExperience = 0,
    Address? address,
  }) : this(
         name,
         baseSalary,
         skills: [Skill.FLUTTER, Skill.DART],
         yearsOfExperience: yearsOfExperience,
         address: address,
       );

  double computeSalary() {
    double salary = _baseSalary + (_yearsOfExperience * 2000);

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }
    return salary;
  }

  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}');
    print('Skills: ${_skills.map((s) => s.name).join(", ")}');
    print('Address: ${_address ?? "Empty"}');
    print('Final Salary: \$${computeSalary()}');
  }
}

void main() {
  var emp1 = Employee.mobileDeveloper(
    'Sokea',
    40000,
    yearsOfExperience: 4,
    address: Address('6A', 'Phnom Penh', '11111'),
  );
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper(
    'Ronan',
    45000,
    yearsOfExperience: 9,
    address: Address('6A', 'Phnom Penh', '99999'),
  );
  emp2.printDetails();
}
