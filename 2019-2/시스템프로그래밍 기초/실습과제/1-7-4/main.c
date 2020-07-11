#include <stdio.h>
#include "tree.h"
tree* root;

int main(void) {
  
  int size;
  scanf("%d", &size);
  root = NULL;
  for(int i = 0; i<size; i++){
    int data;
    scanf("%d", &data);
    
    if(root != NULL) insert_node(root, data);
    else root = initialize(data);
  }
  
  while(1){
    int num;
    printf("1. inorder, 2. preorder, 3. postorder\n");
    printf("Choose a way to traversal: ");
    scanf("%d", &num);
    switch(num){
      case 1: traversal(inorder); 
        putchar('\n');
        break;
      case 2: traversal(preorder);
        putchar('\n');
        break;
      case 3: traversal(postorder);
        putchar('\n');
        break;
      default:
        return 0;
    }
  }

  return 0;
}