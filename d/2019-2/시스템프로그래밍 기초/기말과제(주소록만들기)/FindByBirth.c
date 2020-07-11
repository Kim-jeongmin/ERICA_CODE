#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "FindByBirth.h"

void FindByBirth(data *ptr){ //생일 함수
	int k;
	printf("Birth:"); 
	scanf("%d",&k);
	while(ptr!=NULL){
		char a[2];
		a[0] = (ptr->Birth)[4];
		a[1] = (ptr->Birth)[5];
		if(k==atoi(a)){
      		printf("%s %s %s\n",ptr->Name,ptr->Num,ptr->Birth);
		}
		ptr = ptr->link;	
	}
}