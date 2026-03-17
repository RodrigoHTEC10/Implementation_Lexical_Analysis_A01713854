# Evidence: Implementation of Lexical Analysis - TC2037 - Group 603

Author: Rodrigo Alejandro Hurtado Cortés - A01713854

Date: March 16th, 2026

# Introduction
**Lexical Analysis** is the process of scanning an input string *w* whose characters belong to the concrete alphabet **Σ** (*w* ∈ **Σ\***), 
to classify these into tokens according to patterns defined by regular languages.

This procedure performed computationally by compilers in order to be able to recognize whether a string belongs to a regular language or not based on its defined rules and characters has roots in the **Formal Language Theory**

This theory covers the definition of a regular language and explains how this can be represented in different ways: **DFA**, NFA, Grammar and **Regular Expressions**.

The current evidence mainly supported by the theory presented by J. Glenn Brookshear in the book *Theory of Computation. Formal Languages, Automata, and Complexity* will cover the theoretical and practical grounds behind the implementation of a DFA and regular expressions (REGEX), their equivalence, and comparison.

# Regular Language
A **regular language** is a language whose words come from a subset of all the possible combinations from a finite collection of characters **Σ**, that can be represented using **finite automata**, **regular grammar** and **regular expressions**, each form with advantages and limitations related to understanding and application.

During the present document, the regular language for which computational representations have been designed is the following:
- **Name**: No. 51
- **Σ** {0,1,2}
- **Rules**:
    A word composed of the characters of Σ belongs to the regular language (No. 51) if and only if:
    - A 2 is always preceded by a 1 independently of how many 0 are between them.
    - The string must always ends with 002.

In the following sections each of the two computational representations will contain their formal definition, their design, implementation and testing; to afterwards finalize with a formal comparison in order to select the most efficient computational method.

## Deterministic Finite Automata
### Description
<p class="tab">
Following the formal definition a deterministic automaton consist of a quintuple (S,Σ,δ,ɩ,F), where:

-  S is a finite set of states.
- Σ is the machine's alphabet
- δ is the called transition function from S ✕ Σ into S.
- ɩ (al element of S) is the initial state.
- F (a subset of S) is the set of accept states.
</p>(Glenn Brookshear, 1989)

<br>
In different words, the automaton represents a machine composed of arcs and states; from which starting at the initial state, depending on the characters of the string received (input stream being read from left to right) allow a transition to another (or sometimes the same) state depending on the arcs coming from each state. Within this, the input stream only belongs to the regular language depicted by the automaton if it concludes at an accept state (independently of which one), otherwise being rejected.

The specific automaton being designed is *Deterministic* yet *not fully defined* as each state in the diagram has only one arch leaving it from each symbol of the alphabet, but not all of these arcs are represented in the graph, otherwise it would be overcrowded.

Both pictures, the DFA fully defined and simplified DFA of the **1st iteration** are shown below.

### Design
During the development of the current evidence the simplified DFA was created first based completely on the rules of the regular language No. 51; afterwards, the fully defined DFA was created to fullfill the formal definition proposed by Glenn Brookshear, despite the recognition that these automaton versions are always omitted for simplicity.

#### 1st Iteration

The automaton was programmed in Prolog based on the following transition table:

<div align=center>
<img width="450" alt="Screenshot 2026-03-17 071708" src="https://github.com/user-attachments/assets/af68b5a1-2b23-4e6a-a6f0-a187ed76e4b8" />
</div>

<p align=center> DFA Transition Table</p>

<div align=center>
<img width="600" alt="automata_51-Simplified DFA drawio" src="https://github.com/user-attachments/assets/45625c4e-316b-4bba-ac15-e2b5c6b290f1" />
</div>

<p align=center> <i>Simplified Deterministic Finite Automaton - Transition diagram </i></p>

<div align=center>
<img width="600" alt="automata_51-Fully Defined DFA drawio" src="https://github.com/user-attachments/assets/e4797ed1-3313-473e-8838-ce6b9f4636d9" />
</div>

<p align=center> <i>Fully Defined Deterministic Finite Automaton - Transition diagram</i></p>

As it can be observed, in the created automaton:
- Q1 is the initial state.
- Q6 is the only accept state.
- Q1 receives all those 0s before any 1 and after any 2, as to write another 2 , a 1 is required.
- Q2 receives all 1s as it has a direct arc to Q3 through a 2 or a possibility to finish the string with a 002 if a 0 is used, passing to Q4 instead.
- The connection between Q1, Q2 and Q3 regulate all those string combinations that does not involve 002, always respecting the rule that there must be a 1 before a 2.
- The connection between Q4, Q5 and Q6 regulates the acceptance of the string ending with 002, a combination that can be accomplished always coming from a previous 1 (Q2) even if several 0s are between them (iterative arc in Q5). 
- Any ocurrance of a 0 or 1 after a combination 002 is returned respectively to the states Q1 or Q2 as it corresponds.
- The state Q7 corresponds to a state that contains the analysis if one of the regular language rules has been broken previously. As it contains the remaining string and it is not an accept state, guarantees an automatic rejection and no way back to the automata flow.


Supporting this knowledge base with the function provided by the professor Benjamín Valdés Aguirre in the **automata and prolog notes** called <code>parseDFA</code>, the automata was complete thanks to the properties and backtracking native from Prolog.

This automaton can be consulted in the file <code>automata_51.pl</code>

### Testing

Additionally, the automaton was tested with 50 test cases (25 rejected and 25 accepted for a wider testing pool) which can be performed in the file <code>test_automata_51.pl</code> by running the function <code>start.</code>

Testing examples:
**No. 5 - Rejected**
```Prolog
[0,1,1,1,2,1,2,1,1,0].
```
The string does not end with 002, although the first rule of the language is followed.


**No. 16 - Rejected**
```Prolog
[0,1,2,2,1,1,2,1,2,1,0,0,2]
```
Although the string ends with 002, in the 3rd position of the array (starting from 0) there are two consecutive 2, breaking the first rule fo the language.

**No. 25 - Accepted**
```Prolog
[1,0,0,2]
```
Least acceptable string. It accomplishes to follow both rules exactly as there is only a 1 before the termination 002 whose 2 requires a previous 1.

**No. 47 - Accepted**
```Prolog
[0,1,2,1,1,2,1,1,2,1,1,2,1,1,0,0,2]
```
The sequence of 1 and 2 presented in the string do not break the first rule of the language as there is at least a 1 before each 2 including the termination 002.


## Regular Expressions
### Description
The description of the regular expression arrives from the operations that can be performed among subsets of all possible strings available staring from alphabet **Σ** ,sublanguages or building blocks; which are:

- Union (∪) : Binary Operation, Commutative.

        Σ {x,y}
        A,B ⊆ Σ*
        A = {x, xy}
        B = {y, yx}
        A∪B = {x,xy,y,yx}

- Concatenation (∘) : Binary Operation, Non-commutative.

        Σ {x,y}
        A,B ⊆ Σ*
        A = {x, xy}
        B = {y, yx}
        A∘B = {xy,xyx,xyy,yxxy}

- Kleene Star (*) : Unitary Operation.

        Σ {x,y}
        A ⊆ Σ*
        A* = {x, xy, λ (empty string)}

The result of any of this operations applied to regular languages is equally a regular language.

From this point, the definition of a regular expression from the **Formal Language Theory** can be expressed as:


<p class="tab">
A regular expression (over an alphabet Σ) is defined as follows:

- ∅ is a regular expression (empty set).
- Each member of Σ is a regular expression.
- If p and q are regular expressions, then so is (p ∪ q).
- If p and q are regular expressions, then so is (p ∘ q).
- If p is a regular expression, then so is p*.
</p>  
(Glenn Brookshear, 1989)
<br>

Therefore, the combination of these operations as grouping is powerful enough to represent a regular language similarly to a regular grammar or a DFA.

One of the advantages of regular expressions (also called regex) is that despite their limitations, these are able to express a regular language in one single line compared to other models; such practicity has taken these into becoming a notation for searching and modifying files in terminals and computers.

The adoption of multiple symbols into modern regular expressions come from their application in the real world, where symbols started substituting operations as:
- A | B = A ∪ B.
- A+ = AA*

### Design
It is important to highlight that the following regex will be written using modern symbols for regular expressions; which cheatsheet can be consulted in the reference section.

#### 1st Iteration
The regular expression designed for the Regular Language No. 51 was originally designed as three sections:

1. Possibility before any 2. This implies that any combination or repetition of 0 and 1 can exist before introducing any 2.
        
        (0|1)*

2. Introduction of any 2 before the ending 002. This case occurs when one or many 2 are present in the string, forcing it to have always a 1 before it (following No. 51 rules) and having any combination between 0 or 1 between them.

        (1 (0|1)* 2)*

3. Ending 002 with its respective 1 before it. Similarly to the previous section, there can exist any combination between 0 or 1 between them.

        (1 (0|1)* 002)

    It can be noted that the last section is obligatory as the minimum string accepted that can be formed is 1002.

<br>

**Regular Expression**

        (0|1)* (1 (0|1)* 2)* (1 (0|1)* 002)

### Testing
Similarly to the automaton, the same 50 test cases (25 rejected and 25 accepted) where tested for the regular expression in order to proof the consistency between both representations as both are designed for the same language. These can be found in the <code>test_regex_51.py</code> file by running it, as it automatically executes the function <code>test()</code>.

Testing examples:
**No. 5 - Rejected**
```python
"0111212110"
```
- <code>011</code> match with the first section.
- <code>1212</code>The following 12 repetitions fit within the second section.
- <code>110</code>The remaining 110 would fit with the third section if 02 was added to it, as the remaining 1 belongs to the internal possible existance of 0s and 1s.


**No. 16 - Rejected**
```python
"0122112121002"
```
- <code>0</code>The initial 0 fits with the first section.
- <code>12</code>The following 12 fits with the second section.
- However, as inmediately a 2 following the previous section, it can not fit within the remaining regular expression.

**No. 25 - Accepted**
```python
"1002"
```
- There is no 1st or 2nd section present in the example. 
- <code>1002</code>The string fits with the minimum required characters to be involved.

**No. 47 - Accepted**
```python
"01211211211211002"
```
- <code>0</code>The initial 0 matches with the first section.
- <code>12112112112</code>The remaining sequence of characters until the last five characters belong to a total of four repetitions of the second section.
- <code>11002</code>The final five characters belong correctly to the third section of the regex.


# Computational Comparison

In order to perform a valuable and reliable comparison between two computational methods, the greatest number of equal conditions must be met between them. 

As the representations analyzed in the present evidence were implemented in different programming languages greatly divided because of their execution models, two comparisons will be performed, one based on the model theory proposed by the Formal Language Theory and another focusing on the effects their implementation has over the theory; in order to select a better representation of the formal language No.51 while reducing the inequalities between them.

Important concepts to keep in mind:
- <code>n</code>: Number of characters in the analyzed string.
- <code>m</code>: Number of states in the defined automaton.

## Time Complexity
### DFA
#### Formal Language Theory
- O(n). By definition, the transition process between one state and the other depends completely on the current character and the current state (δ). 

    Within a fully defined DFA, as each state of the automaton has one and only one arc leaving from each symbol of the alphabet (even if it goes to the state Q7, which concentrate the string until it finishes once a rule of the language has been broken), the traversion of the DFA depends only on the number of characters of the string, giving a linear time complexity.

#### Prolog implementation
- O(n). Thanks to the properties of traversion through the recursive function <code>parseDFA()</code> based on the knowledge base of the automaton and the automatic error or rejection the programming language returns if a matching result is not found in such knowledge base (for example a 2 getting out of Q1); the implementation in Prolog keeps the same theoretical time complexity.

### Regular Expression
#### Formal Language Theory
- O(n) ideally - O(n*m). The implementation of a regular expression is done through its convertion to an automaton. Depeding on whether a Deterministic or Nondeterministic automaton is implemented from the regex translation, the time complexity can increase or decrease, being the lowest at Deterministic and the highest at Nondeterministic as this requires backtracking for its implentation; which involves going back in the automata to analyze other possible paths for which the string is accepted by the NFA.

#### Python implementation
- O(n*m) typically, could be higher for worst scenarios. For the implementation of the regular expression in python the library <code>re</code> was used. This library uses a Nondeterministic Finite Autonata with backtracking (similarly to Perl) which gives a higher time complexity in exchange for a greater flexibility compared to other engines to handle regular expression matching compared to DFA (Cox, R, 2007).

## Space Complexity
### DFA
- O(1) as the DFA in Prolog only stores temporarily the current state and follows the arc based on the current char in order to move to the next state. This space complexity can increase to O(n) in the worst case if an inefficient algorithm has been designed to parse the automaton.

### Regular Expression

- O(n) - O(2^n) as the implementation of the regular expression through the Nondeterministic Finite Automaton with backtracking stores the traversed states of the automaton in order to go back if necessary during the analysis or comparison. The worst case scenario can be reached if trying to analyze a long series of identical characters that can fit into multiple arcs of a NFA, forcing the program to store an exponential number of possible states in case of requiring backtracking.

## Results
Based on the previous analysis, a more efficient computational method to realize a lexical analysis is the implementation of a Deterministic Finite Automaton over the use of Regular Expressions; based on both time and space complexity. However, the usage of an engine that translate regex into a DFA would be ideal to approximate the time complexity between both representations, being even able to equal the efficiency of merely the DFA.

# Conclusion
The Formal Language Theory from which the automata, grammar and regular expressions theory is obtained and explained, gives a great insight and connection between the concepts learned during the class time. The reading of J. Glenn Brookshear was rich in details yet simple to understand thanks to the previously acquired knowledge, helping to collect, implement and afterwards explain the design of the models proposed for the lexical analysis of the mathematical regular language No. 51.

Despite the initial automata design based only on class knowledge (which felt more like a puzzle solving than a formal design), the insights in the lecture helped to gather different tools (as the transition table) and explain the remaining empty fields of the theory. Afterwards, the regular expression explanation starting from the operations of the building blocks of languages helped to explain the origin of this notation, despite the modern adaptations that have been made and new symbols being adopted because of implementation, still the theory is applicable nowadays.

Furthermore, the equivalence between DFA, NFA, regular grammar and regular expressions for representing a regular language gives rich and varied methods that complement each other with their own advantages and disadvantages; all the most initial and fundamental building blocks that support more complex mechanisms as grammar analysis and language generation.

As proof of the previous statement both designed automaton and regular expression presented above and in the current repository accept the same test batch based on the rules of the regular language No. 51. From now on, I will continue to use the recently learned regex for searching with a more efficient notation, yet go back to the automaton if I want to be able to appreciate the transition between states in order to categorize if an input is valid or not, a theoretical and practical more efficient implementation (by both time and space).

# References
Child, D. (2020). Regular Expressions Cheat Sheet. Recuperado de: https://cheatography.com/davechild/cheat-sheets/regular-expressions/

Cox, R. (2007) Regular Expression Matching Can Be Simple And Fast
(but is slow in Java, Perl, PHP, Python, Ruby, ...). Swtch.com. Obtained from https://swtch.com/~rsc/regexp/regexp1.html

Glenn Brookshear, J. (1989). Finite Automata and Regular Languages. In Apt, A. & McCormick, M. *Theory of Computation. Formal Languages, Automata, and Complexity* (pp. 21-72). The Benjamin/Commings Publishing Company Inc.

4.3. Comparing algorithms — CS3 data structures & algorithms. (s/f). Cs.vt.edu. Obtained from https://opendsa-server.cs.vt.edu/ODSA/Books/CS3/html/AnalIntro.html


<style type="text/css">
 .tab { margin-left: 40px; }
</style>