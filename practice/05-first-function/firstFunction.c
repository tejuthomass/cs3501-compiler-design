#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#define MAX_NON_TERMINALS 10
#define MAX_TERMINALS 10
#define MAX_RULES 10

typedef struct ProductionRule {
    char nonTerminal;
    char production[20];
} ProductionRule;

bool isNonTerminal(char ch);
bool isTerminal(char ch);
void findFirst(char nonTerminal);

ProductionRule rules[MAX_RULES];
int numRules = 0;

char nonTerminals[MAX_NON_TERMINALS];
int numNonTerminals = 0;

char terminals[MAX_TERMINALS];
int numTerminals = 0;

int main() {
    strcpy(nonTerminals, "SABC");
    numNonTerminals = strlen(nonTerminals);
    
    strcpy(terminals, "abc");
    numTerminals = strlen(terminals);
    
    rules[0].nonTerminal = 'S';
    strcpy(rules[0].production, "AB");
    rules[1].nonTerminal = 'A';
    strcpy(rules[1].production, "bC");
    rules[2].nonTerminal = 'B';
    strcpy(rules[2].production, "c");
    rules[3].nonTerminal = 'C';
    strcpy(rules[3].production, "a");
    rules[4].nonTerminal = 'A';
    strcpy(rules[4].production, "ab");
    
    numRules = 5;
    
    for (int i = 0; i < numNonTerminals; i++) {
        printf("FIRST(%c): ", nonTerminals[i]);
        bool visited[MAX_RULES] = {false};
        findFirst(nonTerminals[i]);
        printf("\n");
    }

    return 0;
}

bool isNonTerminal(char ch) {
    for (int i = 0; i < numNonTerminals; i++) {
        if (nonTerminals[i] == ch) {
            return true;
        }
    }
    return false;
}

bool isTerminal(char ch) {
    for (int i = 0; i < numTerminals; i++) {
        if (terminals[i] == ch) {
            return true;
        }
       }
    return false;
}

void findFirst(char nonTerminal) {
    for (int i = 0; i < numRules; i++) {
        if (rules[i].nonTerminal == nonTerminal) {
            if (isTerminal(rules[i].production[0])) {
                printf("%c ", rules[i].production[0]);
            } else if (isNonTerminal(rules[i].production[0])) {
                findFirst(rules[i].production[0]);
            }
        }
    }
}