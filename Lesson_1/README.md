1. Groups
■■ Id. The unique identifier of the group.
	▷▷ Data type is int.
	▷▷ Auto increment.
	▷▷Cannot contain null values.
	▷▷ Primary key.
■■ Name. Group Name.
	▷▷ The data type is nvarchar(10).
	▷▷Cannot contain null values.
	▷▷Cannot be empty.
	▷▷Must be unique.
■■■Rating. Group Rating.
	▷▷▷The data type is int.
	▷▷Cannot contain null values.
	▷▷Must be in the range of 0 to 5.
■■Course (Year) 
	▷▷Must be in the range of 0 to 5.
■■■Course (Year). The course (year) in which the group is enrolled.
	▷▷ The data type is int.
	▷▷Cannot contain null values.
	▷▷Must be in the range of 1 to 5.
2. Departments (Departments)
■■■Identifier (Id). The unique identifier of the department.
	▷▷▷The data type is int.
	▷▷ Auto increment.
	▷▷Cannot contain null values.
	▷▷▷Primary key.
■■■■Funding (Financing). The department's funding fund.
	▷▷▷ Data type is money.
	▷▷Cannot contain null values.
	▷▷Cannot be less than 0.
	▷▷The default value is 0.
■■ Name. The name of the department.
	▷▷The data type is nvarchar(100).
	▷▷Cannot contain null values.
	▷▷Cannot be empty.
	▷▷Must be unique.
3. Faculties (Faculties)
■■■Identifier (Id). The unique identifier of the faculty.
	▷▷▷ Data type is int.
	▷▷ Auto increment.
	▷▷Cannot contain null values.
	▷▷ Primary key.
■■■Name (Name). The name of the faculty member.
	▷▷▷Data type is nvarchar(100).
	▷▷Cannot contain null values.
	▷▷Cannot be empty.
	▷▷Must be unique.
4. Teachers (Teachers)
■■■Identifier (Id). The unique identifier of the teacher.
	▷▷ Data type is int.
	▷▷ Auto increment.
	▷▷Cannot contain null values.
	▷▷▷Primary key.
■■■EmploymentDate. The date of employment
of the faculty member's employment.
	▷▷ The data type is date.
	▷▷Cannot contain null values.
	▷▷Cannot be less than 01/01/1990.
■■■ Name (Name). The faculty member's name.
	▷▷ The data type is nvarchar(max).
	▷▷Cannot contain null values.
	▷▷Cannot be empty.
■■■Premium (Premium). The faculty member's premium.
	▷▷ Data type is money.
	▷▷Cannot contain null values.
	▷▷Cannot be less than 0.
	▷▷The default value is 0.
■■■Salary (Salary). The faculty member's rate.
	▷▷▷ Data type is money.
	▷▷Cannot contain null values.
	▷▷Cannot be less than or equal to 0.
■■■First name (Surname). The last name of the faculty member.
	▷▷ Data type is nvarchar(max).
	▷▷Cannot contain null values.
	▷▷Cannot be empty.