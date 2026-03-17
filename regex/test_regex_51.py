"""
Author: Rodrigo Alejandro Hurtado Cortes
Date: March 16th, 2026

Title: Regular Expression Testing

Description of the Regular Language:
    Alphabet:{0,1,2}
    Rules:
        Must have 1 before 2 always.
        End in 002

Regular Expression:
^{0|1}*(1{0|1}*2)* 1{0|1}*002$

"""
import Implementation_Lexical_Analysis_A01713854.regex.regex_51 as regex_51

rejected_tests = [
"",
"2",
"002",
"1110022",
"00121012010",
"0111212110",
"000122211210",
"01222121002",
"20112112101",
"01121121100",
"001212002",
"00111211210",
"221121001",
"00112112110",
"0112111210001",
"00102102110021",
"0122112121002",
"0011212110",
"2121121002",
"0011121211",
"2001121121",
"00000021002",
"011211210",
"0012111210",
"0122121121002"
]

accepted_tests = [
"1002",
"1110002",
"00011111002",
"12121121002",
"011211211002",
"0012112111002",
"0121121121002",
"0112111211002",
"0012112121002",
"1121121211002",
"1012012110021002",
"001121121121002",
"1211211211002",
"01121211211002",
"00001211211211002",
"11121121211002",
"012112121121002",
"0011211211211002",
"121211211211002",
"011211211211210000002",
"001211211211211002",
"1121121001210121121002",
"01211211211211002",
"001121121121121002",
"1211210121121121100210021002"
]

def test():
    count = 0
    print("Rejected Tests \n ----------------------------- \n")
    for test in rejected_tests:
        print("Test No. "+ str(count))
        print(str(test))
        print(regex_51.regex_automaton51(test) + "\n")
        count=count+1

    print("Accepted Tests \n ----------------------------- \n") 
    for test in accepted_tests:
        print("Test No. "+ str(count))
        print(str(test))
        print(regex_51.regex_automaton51(test) + "\n")
        count=count+1

test()
