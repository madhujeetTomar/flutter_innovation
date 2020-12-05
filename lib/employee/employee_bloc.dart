  // 1. import all dependencies
import 'dart:async';
import 'employee.dart';

class EmployeeBloc {
  //2. list of employee
  List<Employee> _employeeList = [
    Employee(1, 1000, "Anuj"),
    Employee(2, 2000, "Rahul"),
    Employee(3, 3000, "Shivam"),
    Employee(4, 4000, "Ravi"),
    Employee(5, 5000, "Abhishek"),
    Employee(6, 6000, "Rakesh"),
  ];

  //3. Define all streamcontrollers
  final employeeStreamController = StreamController<List<Employee>>();
  final employeeIncrementSalaryStreamController = StreamController<Employee>();
  final employeeDecrementSalaryStreamController = StreamController<Employee>();


  //6. Constructor add data and listen to function
  EmployeeBloc() {
    employeeStreamController.add(_employeeList);
    employeeIncrementSalaryStreamController.stream.listen(_incrementSalary);
    employeeDecrementSalaryStreamController.stream.listen(_decrementSalary);
  }

  // 4. define all getters
  Stream<List<Employee>>get getEmployeeListStream=> employeeStreamController.stream;
  StreamSink<List<Employee>>get getEmployeeListSink=> employeeStreamController.sink;
  StreamSink<Employee>get getEmployeeIncrementSalary=> employeeIncrementSalaryStreamController.sink;
  StreamSink<Employee>get getEmployeeDecrementSalary=> employeeDecrementSalaryStreamController.sink;

 // 5. define logic function
   //incremented salary
  _incrementSalary(Employee employee) {
    double salary= employee.getSalary();
    double incrementedSalary= salary*20/100;
    _employeeList[employee.getId()-1].setSalary(salary+incrementedSalary);
  }
    //decremented salary
  _decrementSalary(Employee employee) {
    double salary= employee.getSalary();
    double decrementedSalary= salary*20/100;
    _employeeList[employee.getId()-1].setSalary(salary-decrementedSalary);
  }

  // 7. call dispose
  void dispose()
  {
    employeeIncrementSalaryStreamController.close();
    employeeStreamController.close();
    employeeDecrementSalaryStreamController.close();
  }
}
