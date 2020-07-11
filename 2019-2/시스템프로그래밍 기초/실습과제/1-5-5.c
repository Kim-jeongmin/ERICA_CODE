#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void){
  
  int sizeOfDom, sizeOfCodom;
  scanf("%d", &sizeOfDom);
  scanf("%d", &sizeOfCodom);
  
  // make relational matrix
  int** rMatrix = (int**)malloc(sizeof(int*) * sizeOfDom);
  for(int i=0; i<sizeOfDom; i++){
    rMatrix[i] = (int*)calloc(sizeOfCodom, sizeof(int));
  }
  
  // take ordered pairs
  while(1){
    char pair[20];
    scanf("%s", pair);
    
    if(!strcmp(pair, "END")){
      break;
    }
    
    int xpos = atoi(strtok(pair, " (,)"));
    int ypos = atoi(strtok(NULL, " (,)"));
    
    rMatrix[xpos][ypos] = 1;
  }
  
  // your codes here
  if(sizeOfDom<sizeOfCodom){  //단사 
    int in=0;
  	for(int i=0;i<sizeOfDom;i++){
  		int cnt=0;
  		for(int j=0;j<sizeOfCodom;j++){
  			if(rMatrix[i][j]==1) cnt+=1;
	  		}
	  	if(cnt>1){
		  printf("nothing");
		  break;
  		}
  		in+=1;
  	}
  	if(in==sizeOfDom) printf("injective");
  }
  if(sizeOfDom>sizeOfCodom){  //전사
    int sur=0;
		for(int i=0;i<sizeOfCodom;i++){
			int cnt=0;
			for(int j=0;j<sizeOfDom;j++){
				if(rMatrix[j][i]==1) cnt+=1;
			}
			if(1>cnt){
			printf("nothing");
			break;
			}
			sur+=1;
		}
		if(sur==sizeOfCodom) printf("surjective");
	}
	if(sizeOfDom==sizeOfCodom){  //전단사  
	  int bi=0;
		for(int i=0;i<sizeOfDom;i++){
			int cnt1=0;
			for(int j=0;j<sizeOfCodom;j++){
				if(rMatrix[i][j]==1) cnt1+=1;
			}
			if(cnt1>1 || cnt1==0){
				printf("nothing");
				break;
			}
			bi+=1;
		}
		for(int n=0;n<sizeOfDom;n++){
			int cnt2=0;
			for(int m=0;m<sizeOfCodom;m++){
				if(rMatrix[m][n]==1) cnt2+=1;
			}
			if(cnt2>1 || cnt2==0){
				printf("nothing");
				break;
			}
			bi+=1;
		}
		if(bi==sizeOfDom*2) printf("bijective"); 
	}
  return 0;
}