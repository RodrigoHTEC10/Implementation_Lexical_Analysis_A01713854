# Evidence:Implementation of Lexical Analysis - TC2037 - Group 603

Author: Rodrigo Alejandro Hurtado Cortés - A01713854

Date: March 16th, 2026

## Introduction
**Lexical Analysis** is the process of scanning an input string *w* whose characters belong to the concrete alphabet **Σ** (*w* ∈ **Σ\***), 
to classify these into tokens according to patterns defined by regular languages.

This procedure performed computationally by compilers in order to be able to recognize whether a string belongs to a regular language or not based on its defined rules and characters has route in the **Formal Language Theory**

This theory covers the definition of a regular language and explains how this can be represented in different ways: **DFA**, NFA, Grammar and **Regular Expressions**.

The current evidence mainly supported by the theory presented by J. Glenn Brookshear in the book *Theory of Computation. Formal Languages, Automata, and Complexity* will cover the theorical and practical grounds behind the implementation of a DFA and regular expressions (REGEX), their equivalence, and comparison.

## Regular Language
A **regular language** is a language whose words come from a subset of all the possible combinations from a finite collection of characters **Σ**, that can be represented using **finite automata**, **regular grammar** and **regular expressions**, each form with advantages and limitations related to understanding and application.

During the present document, the regular language for which computational representations have been designed is the following:
- **Name**: No. 51
- **Σ** {0,1,2}
- **Rules**:
    A word composed of the characters of Σ belongs to the regular language (No. 51) if and only if:
    - A 2 is always preceded by a 1 independently of how many 0 are between them.
    - The string must always ends with 002.

In the following sections each of the two computational representations will contain their formal definition, their design, implementation and testing; to afterwards finalize with a formal comparison in order to select the most efficient computational method.

### Deterministic Finite Automata
#### Description
Following the formal definition a deterministic automaton consist of a quintuple (S,Σ,δ,ɩ,F), where:
-  S is a finite set of states.
- Σ is the machine's alphabet
- δ is the called transition function from S ✕ Σ into S.
- ɩ (al element of S) is the initial state.
- F (a subset of S) is the set of accept states.

(Glenn Brookshear, 1989)

In different words, the automaton represents a machine composed of arcs and states; from which starting at the initial state, depending on the characters of the string received (input stream being read from left to right) allow a transition to another (or sometimes the same) state depending on the arcs coming from each state. Within this, the input stream only belongs to the regular language depicted by the automaton if it concludes at an accept state (indendently of which one), otherwise being rejected.

The specific automaton being designed is *Deterministic* yet *not fully defined* as each state in the diagram has only one arch leaving it from each symbol of the alphabet, but not all of these arcs are represented in the graph, otherwise it would be overcrowded.

Both pictures, the DFA fully defined and simplified DFA of the **1st iteration** are shown below.

#### Design
During the development of the current evidence the simplified DFA was created first based completely on the rules of the regular language No. 51; afterwards, the fully defined DFA was created to fullfill the formal definition proposed by Glenn Brookshear, despite the recognition that these automaton versions are always ommited for simplicity.

##### 1st Iteration
<div align=center>
<img width="600" alt="automata_51-Simplified DFA drawio" src="https://github.com/user-attachments/assets/45625c4e-316b-4bba-ac15-e2b5c6b290f1" />
</div>

<p align=center> <i>Simplified Deterministic Finite Automaton - Transition diagram </i></p>

<div align=center>
<img width="600" alt="automata_51-Fully Defined DFA drawio" src="https://github.com/user-attachments/assets/e4797ed1-3313-473e-8838-ce6b9f4636d9" />
</div>

<p align=center> <i>Fully Defined Deterministic Finite Automaton - Transition diagram</i></p>


The automaton was programmed in Prolog based on the following transition table:

<div align=center>
<img width="450" alt="Screenshot 2026-03-17 071708" src="https://github.com/user-attachments/assets/af68b5a1-2b23-4e6a-a6f0-a187ed76e4b8" />
</div>

<p align=center> DFA Transition Table</p>

Supporting this knowledge base with the function provided by the professor Benjamín Valdés Aguirre in the **automata and prolog notes** called <code>parseDFA</code>, the automata was complete thanks to the properties and backtracking native from Prolog.

This automaton can be consulted in the file <code>automata_51.pl</code>

#### Testing

Additionally, the automaton was tested with 50 test cases (25 rejected and 25 accepted) which can be performed in the file <code>test_automata_51.pl</code> by running the function <code>start.</code>

Testing examples:
No. 5 - Rejected
```Prolog

```
No. 15 - Rejected

```Prolog


```

No. 25 - Accepted

```Prolog


```

No. 47 - Accepted

```Prolog

```

### Regular Expressions
#### Description
The description of the regular expression arrives from the operations that can be performed among subsets of all possible strings available staring from alphabet **Σ** which are:

- Union **Continue over here**



#### Design
#### Testing

## Computational Comparison
### Theory
### Method
### Results

## References

