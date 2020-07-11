#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "Registration.h"

void Registration(data *ptr){ //등록 함수
	int k=0;
	data *newNode,*head,*File;
	head = ptr;
  File = ptr;
	newNode = (data*)malloc(sizeof(data));
	printf("Name:");
	scanf("%s",&newNode->Name);
	printf("Num:");
	scanf("%s",&newNode->Num);
	printf("Birth:");
	scanf("%s",&newNode->Birth);
  if(head->link->link==NULL){
    newNode->link = ptr->link;
    ptr->link = newNode;
  }
  else{
    while(strcmp(newNode->Name,ptr->link->Name)>=0 && ptr->link->link!=NULL){ 
      ptr = ptr->link;
    }
    newNode->link = ptr->link;
    ptr->link = newNode;
  }

	while(head->link->link != NULL){
		head = head->link;
		k++;
	}
	printf("count: %d\n",k);
}

