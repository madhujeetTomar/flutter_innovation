

class Employee
{
  int _id;
  double _salary;
  String _name;
 Employee(this._id,this._salary,this._name);


 void setId(int id)=> _id=id;
 int getId()=> _id;

  void setSalary(double salary)=> _salary=salary;
  double getSalary()=> _salary;

  void setName(String name)=> _name=name;
  String getName()=> _name;



}