/*2019041094 김정민*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "Person.h"
#include "Delete.h"
#include "Registration.h"
#include "ShowAll.h"
#include "FindByBirth.h"


int main(){
	data *head;
	head = (data*)malloc(sizeof(data));
	head->link = (data*)malloc(sizeof(data));
	head->link->link = NULL;	
	while(1)
	{
		int x;
		printf("*****Menu*****\n");
		printf("1. Registration, 2. ShowAll, 3. Delete, 4. FindByBirth, 5. Exit\n");
		printf("Enter the menu number:");
		scanf("%d",&x);
		switch(x){
			case 1:
				Registration(head); 
				break;
			case 2:
				ShowAll(head->link);
				break;
			case 3:
				Delete(head);
				break;
			case 4:
				FindByBirth(head->link);
				break;
			case 5:
				exit(0);
		}
	}
}
