#include <iostream>
#include "Student.h"

using namespace std;

void testing(); //prototype


int main() {
	
	Student s1("12345", "Mark", "100");
	s1.display();	
	
	return 0;
}

void testing() {
	cout << "Good Morning";	
}

