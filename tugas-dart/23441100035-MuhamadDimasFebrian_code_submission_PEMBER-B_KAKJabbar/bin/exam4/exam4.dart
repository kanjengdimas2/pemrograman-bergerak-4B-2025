class PraktikanStudent {
  String fullName;
  int age;

  PraktikanStudent(this.fullName, this.age);

  int incrementAge() {
    // TODO 1
    age += 1; 
    return age; 
    // End of TODO 1
  }

  Future<String> getStudentInfo() {
    // TODO 2
    return Future.delayed(Duration(seconds: 3), () {
      return "Nama Lengkap: $fullName, Umur: $age tahun";
    });
    // End of TODO 2
  }
}

dynamic createStudent() {
  // TODO 3
  var praktikanStudent = PraktikanStudent("Muhamad Dimas Febrian",20,);
  return praktikanStudent;
  // End of TODO 3
}
