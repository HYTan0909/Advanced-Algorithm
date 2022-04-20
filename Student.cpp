#include "Student.h"

		Student::Student() {
			stdid = "N/A";
			name = "N/A";
			marks = 0;
		};
		
		Student::Student(string s, string n, double m) {
			stdid = s;
			name = n;
			marks = m;
		};
		
		void Student::display() {
			cout << "Name: " << name << ", marks: " << marks << endl;
		};
		
		void Student::setMarks(double m) {
			marks = m;
		};
		
		double Student::getMarks() {
			return marks;
		};
