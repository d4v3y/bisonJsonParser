#ifndef TREE_H
#define TREE_H

struct treenode {
    int label;                /* terminal symbol, or production rule # */
    int nkids;                /* 0 for tokens (tree leaves) */
    struct treenode *kids[5]; /* sized for muth.y */
};

void printTree(struct treenode* n);

#endif