#include <stdio.h>
#include <stdlib.h>

// Global variables
int i = 0;
char str[10], tp;

// Function to move to the next character
void advance() 
{
    tp = str[++i];
}

// Function F -> i | (E)
void F() {
    if (tp == 'i') 
    {
        advance();
    } 
    else if (tp == '(') 
    {
        advance();
        E();
        if (tp == ')') 
        {
            advance();
        } 
        else 
        {
            printf("String not Accepted: Missing closing parenthesis\n");
            exit(1);
        }
    } 
    else 
    {
        printf("String not Accepted: Invalid token in F()\n");
        exit(1);
    }
}

// Function TP -> *F TP | ε
void TP() {
    if (tp == '*') 
    {
        advance();
        F();
        TP();
    }
    // ε (do nothing)
}

// Function T -> F TP
void T() 
{
    F();
    TP();
}

// Function EP -> +T EP | ε
void EP() 
{
    if (tp == '+') 
    {
        advance();
        T();
        EP();
    }
    // ε (do nothing)
}

// Function E -> T EP
void E() 
{
    T();
    EP();
}

// Main function
int main() 
{
    while (1) 
    {
        printf("\nEnter the String: ");
        scanf("%s", str);

        i = 0;
        tp = str[i];

        E();

        if (tp == '\0') 
        {
            printf("String Accepted\n");
        } 
        else 
        {
            printf("String not Accepted: Extra characters after parsing\n");
        }

        int op;
        printf("Enter 1 to exit, any other key to continue: ");
        scanf("%d", &op);
        if (op == 1) 
        {
            exit(0);
        }
    }

    return 0;
}
