#include <stdio.h>
#include <stdlib.h>

typedef struct treenode {
  struct treenode *leftchild;
  int data;
  struct treenode *rightchild;
} tree;

tree* initialize(int);
int isLeaf(tree*, int);
void insert_node(tree*, int);
// void remove_node(tree*, int);

// implement following functions
void inorder(tree*);
void preorder(tree*);
void postorder(tree*);
void traversal(void (*fp)(tree*));