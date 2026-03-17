"""
Author: Rodrigo Alejandro Hurtado Cortes
Date: March 16th, 2026

Title: Regular Expression Implementation

Description of the Regular Language:
    Alphabet:{0,1,2}
    Rules:
        Must have 1 before 2 always.
        End in 002

Regular Expression implementation:
Quantifiers used: 
    * (0 or more)

Metacharacters:
    | (or)

Groups:
    ( ) (Group)

Anchors:
    ^ (start of a string)
    $ (end of a string)

Regular Expression:
    ^{0|1}*(1{0|1}*2)* 1{0|1}*002$

"""

#Import of python library that supports regular expressions.
import re as re

"""
Function regex_automaton51(test)

Function responsible for printing the messages "Accepted" or "Declined" 
if the input test fully matches with the regular expression: 
    ^{0|1}*(1{0|1}*2)*1{0|1}*002$ 
which is the equivalent regular expression to the Automaton No. 51
"""
def regex_automaton51(test):
    if (re.fullmatch('^(0|1)*(1(0|1)*2)*1(0|1)*002$',test)):
        return "Accepted"
    else:
        return "Rejected"


# Avoid reading remaining file when being imported.

if __name__ == "__main__":
    test = input("Write the word to be tested by automaton No. 51: \n")
    print(regex_automaton51(test))