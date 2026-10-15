enum Skill { FLUTTER, DART, OTHER }

class Address {
  String? _street;
  String _city;
  String _zipCode;

  Address(this._street, this._city, this._zipCode);

  String? get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  String printAddress() {
    return '{${street ?? 'N/A'}, ${city}, ${zipCode}}';
  }
}

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills = [];
  Address? _address;
  int _yearsOfExperience = 0;

  Employee({
    required this._name,
    required this._baseSalary,
    this._skills = const [],
    this._address,
    this._yearsOfExperience = 0,
  });

  Employee.mobileDeveloper({
    required this._name,
    required this._baseSalary,
    required this._address,
    this._yearsOfExperience = 0,
  }) : _skills = const [Skill.FLUTTER, Skill.DART];

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address? get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double get totalSalary => _baseSalary + (_yearsOfExperience * 2000) + (_skills.contains(Skill.FLUTTER) ? 5000 : 0) + (_skills.contains(Skill.DART) ? 3000 : 0) + (_skills.contains(Skill.OTHER) ? 1000 : 0);

  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary} , Skills: [${skills.map((skill) => skill.name).join(', ')}], Address: ${address?.printAddress()}, Years of Experience: $yearsOfExperience \nTotal Salary: \$${totalSalary}\n');
  }
}

void main() {
  var emp1 = Employee(name: 'Sokea', baseSalary: 40000, skills: [Skill.FLUTTER, Skill.DART], address: Address('123 Main St', 'Phnom Penh', '12000'), yearsOfExperience: 5);
  emp1.printDetails();

  var emp2 = Employee(name: 'Ronan', baseSalary: 45000, skills: [Skill.OTHER], address: Address('456 Elm St', 'Siem Reap', '17000'), yearsOfExperience: 10);
  emp2.printDetails();

  var emp3 = Employee.mobileDeveloper(name: 'Saoly', baseSalary: 50000, address: Address('789 Oak St', 'Battambang', '02000'), yearsOfExperience: 2);
  emp3.printDetails();
}