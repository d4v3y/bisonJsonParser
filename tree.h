#ifndef TREE_H
#define TREE_H

struct treenode {
    int label;
    int nkids;
    struct treenode *kids[5];
    struct token lexinfo
};

void printTree(struct treenode *n);

#endif