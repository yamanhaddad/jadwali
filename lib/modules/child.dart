const String collectionChild = "child";

const String childId = 'id';
const String childName = 'name';
const String childDob = '';
const String childGge = 'age';
const String childGender = 'gender';
const String childUcode = 'ucode';
const String childBraceletId = 'braceletid';
const String childThreshold = 'threshold';
// testing

class Child {
  String id;
  final String name;
  final DateTime dob;
  late int age; // late: will be initialized later
  final String gender;
  late String ucode;
  String? braceletId;
  late int threshold;

  int calculateAge(DateTime dob) {
    final now = DateTime.now();
    final difference = now.difference(dob);

    return (difference.inDays / 365).floor();
  }

  int calculateThreshold(int age) {
//////insert code for calculating threshold
    return 100;
  }

//constructor
  Child({
    required this.id,
    required this.name,
    required this.dob,
    required this.gender,
  }) {
    age = calculateAge(dob);
    threshold = calculateThreshold(age);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      childId: id,
      childName: name,
      childDob: dob,
      childGge: age,
      childGender: gender,
      childUcode: ucode,
      childBraceletId: braceletId,
      childThreshold: threshold,
    };
  }

// to retrieve map from database
  factory Child.fromMap(Map<String, dynamic> map) => Child(
        id: map[childId],
        name: map[childName],
        dob: map[childDob],
        gender: map[childGender],
      ); //return a childmodel object
}

//List<ChildModel> childList = [];
