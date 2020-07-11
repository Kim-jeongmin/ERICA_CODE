#ifndef PERSON
#define PERSON

#include <stdio.h>

struct Person{
	char Name[21];
	char Num[16];
	char Birth[9];
	struct Person *link; //링크드리스트
};
typedef struct Person data;

#endif