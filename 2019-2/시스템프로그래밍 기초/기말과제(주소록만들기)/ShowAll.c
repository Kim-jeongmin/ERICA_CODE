#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "Registration.h"

void ShowAll(data *ptr){ //출력 함수
	while(ptr->link!=NULL){
		printf("%s %s %s\n",ptr->Name,ptr->Num,ptr->Birth);
		ptr = ptr->link;
	}
}