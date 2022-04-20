#ifndef STUDENT_H
#define STUDENT_H

class Student
{
	private:
		string stdid;
		string name;
		double marks;
		
	public:
		Student();
		Student(string, string, double);
		
		void display();
		void setMarks(double m);
		double getMarks();
};

#endif
