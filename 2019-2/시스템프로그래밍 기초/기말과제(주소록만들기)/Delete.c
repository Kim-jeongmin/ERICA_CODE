#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "Delete.h"

void Delete(data *ptr){ //삭제함수
	char Name[21];
	data *temp,*first;
	first = ptr;
	if(first->link->link==NULL){
		printf("No record founded.\n");
	}
	if(first->link->link!=NULL){
    printf("Name:");
	  scanf("%s",&Name);
		while(1){
			temp = ptr;
			ptr = ptr->link;
			if(strcmp(Name,ptr->Name)==0){
				temp->link = ptr->link;
				ptr->link = temp;
				free(ptr);
				break;
			}
			if(ptr->link->link==NULL){
				printf("No record founded.\n");
				break;
			}
		}
	}
}