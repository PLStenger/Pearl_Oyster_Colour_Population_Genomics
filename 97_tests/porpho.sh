#!/usr/bin/env bash

string="GGAAACTTTCGGAGGTGGACATATTCCAAGAAAGTCCCTTCTTGCATCATCATATTCAAGCTTTATAAAAGAAATAAAATTCTAATGATTTCATTAATAGGAAGAAATGGGTAATTCAAACAAATGGTTATGAGAACGGCTCCATGGCTTTTAAGATGTAAAATGTTATCTTTTCTTAAATCAATGCAAAATAAAAGTGCATTTGTGGAGACTTCTGGATTCCTGAAATGTGGACGGGTAGTTCTCATGTAATTTGGATAGCTCTACTATTTGCCTTTGACGTATCGAGTGACCCTCCTTGGTCGACTTACTGGTTTCCTTTGTATAGATGCTATCATACATGTACGTTTTTGATGCTGGTTGTCAGTGCGTCTTTCATATAGGTCTGTATAATTTACATGTAGATGCTGCCATTCGTGATTGATGTATTAATACGTGTTCGGAGTGGTTATGCGTCTTTGTTATTGGTCTATATTGTTTAAGGTAGATCGTCCCTCAGGTCAGAATTGTTGGTACATTATTGAAAGGATACCCCATGTTTTTTTTTAATATTGTCCAGAAGGTCAAACAAATAGAGCTAGGGAACAAGATAATGTTAAAGTTACATTTTGTAATCTCTAAAGAATTTTTCTGATTTTTCCGAAAGGGTGCAATGTTAAAATACAGATGATTTAAATTTAGTTTATTTGTTGATCATATTTTATACAAGCTTTAAACATATCGGTATGAAAATATTGAAAAAGTTGTTCATAAGAAAATATTAGCATTTGAGACCTAAGGGATGCTCTACCTTAAATGTTGTTATATATGTTTAGTGCATTAATATCTTGAGACTCTCTACGTTTTTCTCGTCGATCTGTTTTGTTTAACCTGAGCCTTTGTGTGTCTTTCTCATTGATCTGTTTTGTTTAGATGCTGTTAAACATGTTTGATGCTTTCATGTGTTTCCTGGGTGTTTGTATGTACGTCCTCCTCATTGATCTGTTTTGATGTACATGTATGTGTTATGGCTTGTGAGTAGTGTGTTAGCTGTAGGTGTCGCTATGGATAACTGTGGGGATTATATCCATCTTTCACTTGAAGTCACTCCTATTATCGTACTACCACATTAATTACGTACATTATACAATTACCGTCTTTTTCATAAATGTCATCTAAATCTTACATAAGTTATGAAAGAAGTTCCTGACACGCTTACGCAACAAGTTTGCACACAAAGAATATTCGATAGAAACTTTCGTTTTAACTCGAACACATGATTCATTAAGAGAAAAGAAGATTAACTTCGTCTTACTTTTTGTTGGTTTTGAACGCTTCTATCGTCCTCAAGAAAAGACTTGCTGACGGATTTCTTTATGTAATTACGACCATCTGTACTTGACACTTCTCCGTGTAGGTGAATCTGAAGGTAAAGAAATATAACAAGTCTAAATAAACAAGCTGTAGGATACTCGGTATTACATTATTCACTACTAAACAGTGGCGTAGCTGCCATTACGCCAAATACGCCTGGGCGTACACATTATTTTCACAATCTCCAGGAGAGAGAGAGACTTTAATAAAGGGTCAGAATGATGACTTTTCCGTTCCTTATAAACACTGAAATTCATTCGCTTCCGGGGCTTCGCCCCCTGGAACACCCGCCAGGGCTCCGCCCTGGATCCATTGAGGGTCTCAAGGCGGCCCCCCAAACCTCCTGCCTATCTGGTGCGTACACATTATTTGCACTCTGGCTACGCCCCTGCTACAGTGAAATGTATATTTCTAATAACAATGGCTTGACGCCTATATGTCGATTTCAAACTTATTTGCGTATGGACAACTGTACCTCTTACATGTACCTCCCCTCAAGTCATTATTTGCACTTTAAAACCTTGCTTGCGATAGGATATAAAAAAAAAAAAAAATCGGAATTGCAGTTTGGTCTACAAATTACAATTGTATAGAAATGAACTATACGTAACAAATCACTCAAGGTAATGTACACTTCTTATAGAATAATTCATTACTTGAAGAAAACTTGCTTCAATATCGTAATGTTTCATTTTGAGCATGAAAAAAGAACATAAAATTGACTCGCACACTTACATGTACAATGTCAAAGTCTACTTGTATAATTGTGTCATTTTGTAATATAGACTTAGGCACGGTCCATTTGATATTCGGGGGGGGGGGGGGGCTTGGGTTTTTTTGGGTGACACCACCTTAGGCAAAAGTATCAGGGGATACCCTCATTGACAAACTTCTTCAGACCCGTATCACATATCAACCGAAAGTATCAGAATTTTCCAGCGTTTTTGGCGTCTCTTCGGGCTTCATCAGAAATGCACATTTTGTGTTATTTCTTTGATTTACTCTACAGAGATATGGTTTTATGTGCTCATTTTCTTTATATATGTAGCATTTGACTAGGTTAGTGCTTTGAAATTGCCCTAAAAATACTAAAGTAGACTATAGTTTACTATAGTAAACCATATATACTATAGTAAACTTTACAATGTGTGTAGAAAAATTAAGTCTTGTGTAGCATAGTAAAGTTTTATGTAGTATCGTTTCGTGGAAGTATCACATTGTAAAGTATAGTGTAGTAAAGTATCATTTAATAATTTAGGGTGTAGTATAGCAAAGGTTTATGTTGTAAAGTTACATGTAGTAAAGTTCTGTGTAGTAAAGTGTCATGTAGAATAATAAAGTTTCAAGAAGTAAAGTAAAGTGTCATGTAGTACATAGTGTCGTTTTGTGTAATGAAGTTCCATGTAGTAAAGTATAGAGTAGCATAGTAAAGGTTTGTGAAGTAAATTAAAAGTTCATGTCATTACATGATAGGTCTATGTAATTTTAATAAAGTCAATTAGAACAGTAAAGAATTTTGCACTGCGTTACATGTACATAAAGAGAGCCTATAGCTAGTAAGTGTCCGAATCCCCCTATACTCTCTCGTTCCCTCCAAATTTTCTAAGTTATGAGATCGCAAAACAACTAAATATATATATGTGTGATCGTTAAAGGAAGTTTGCATCATATGGACAAAAAGAGCATTTGGAATTGCATGTGCATGTCAGTATAATGTAGTAAAAAGTATAGTGTATTATAAATAATTTTCGTGCAGTAAAGTAAATTTGTAAAAGTTTTTTTTTCGGTAGATAAGTTTCGTCTAGTAAAGTTTTGTGTAGTGTAGTAATGTTTTGATAAGTATAGTAAAGTATCATGTAGTATAGTATATTGTAATTTAGCCACTGAAGTTTAAAGTAGTCAATTGTAGTAAAGTAAACTATTCTATATTACAGTACACTGTGGTACTTTTTTGTTTGGAAGATCTTGTGCTTTAGATAACCTTTTTTTTTAAAAAAATTGTGAACCTTTTTCCCATCAAAAAGGAGGAGAGGAGGCTCATTTGCATACATTTTCCAGTTTATTCTTCAGAACCACTAAACAGATTTTGATGAACCCTGCATGGTAGGGATGAAGTGCCAGTGGACACCTTCTTAGAGTTATATTTTCCGGATCCGTCACATGTGTGACCACCACAGGCAAAAGTAGATCAGGGGAGTTCATGTACCTCCCACAACAAATATCTTCTTCTGAACCGGACTGTGTGAGAAATGCCCATTCCTCTGTTCTTTCTTTGAGTAAGTCAACAAAGGTATACCTTTATGTACTCTGATGCTGAGTATTTGTAGCATATGACTTTACTTTGATATAAATATTGTGCTTTAAATTTATATTTGTGAATTTTCAAGAATATTTTTATCAAATGAGAGAGGAGTAAATTCATTTGCATACTTTTTCAGCGTCTTCTCTCAAGCAATGAGCAGATTTTGATGAAATTTGGTAGGAATGAAGTACAAGACATTTTCCTACAAATATATTTCGTTTTGCTCAGATCCATCAACAGGTGGTACTACCACAGGTAAAAGAAGGTAGTAGGAGTTACCCTCCTTTGATACACTTCTCTCCAGAAACCGGAGCATATGAGCCCAGTTCGAAGTCATCAGAATGATCGAAAGGATGTCTTTATAACACCCTCAGCTGTGTAACTACAAAGCGGATAATTAATAAAATCGATAGGACTTTCCTTTACTATATCTTAGTATCAACTAAAATTTTTATAAGTGTTAAGAAAACGCATTGATGTTTACTGAAGTTACTGTGTTCCAAAGAAACTCCCATTATACTATCACTGTAAAACATAACGGTGTAAGGACAAAACAAATAATTTATAAATCGAAAGGGCTCTTCCTTTACTGTATCTAAGTATCAAGTATAAGTTTTATGAAGATACATTCACGTTTACTTAAGTTATTACATCCAATAGAAGTTCCTATTATGCTATCACTGTAAAAAAAAATATAAAAAACAAGAGGTCGATAGGGCCACATCGCTCATCTGAGAACACTGGAAATCTGACAGTGAATGTGATTAGAATATCAAATCGATACAACATAAAACTATTGAAATCACATTGAGCATTTTACATTAAAGGCTAAAAAGGGAAATAATTGTTGAACATTTGTAACAATTTTCTGGAACAAAACCATAATACTTTAGCATACAACTTTCTAAATCACTTCACTGCTTTCAGTTTGTCCTTGTAAACAGCTAGTCTGGAAAAGAAATTAATCAATGGTGTGGATTATCTGTGTACTTTTGCTTGTGTTGGTGCCACCTTTTTTAAAAATTCAGGACAAAAACCAAATACACTTGTTAGGAATTTTGAATCCTTCATCTCTACTACTTTTCATCAAGTTCTGTGACTGGATTCTACAAGAAATGTCAAAAATTTGCAAAAATACCCCCTCCCTTTTTCTGCAGTCTAAAAAAATCTTATAAATCCCAAAATTAAATTCTATCAATATTCTTTAACAAAAGCATTCCTTTATTCAATTCTATCTAAAATACAGTTTTAGTGTATTAAATTAGGGACGAGTATTGTCTTGCATGAAAATGCCAAAGATAAAAAATAAATAAATAAATAAATAAATGAATAAAATACGTCAAAACTAAAATTGAAATTATTCGGGTACTTCAGAAATGCAAATAAATGCTGAGAAAAATGGGGAAAAATGAAAAAGAAAAAGAATTTTTGTTGCCTCCAGTGGGATTTGAACCCACACCCTAGGTTTCTTGAGCACTATACACTTACCTTTTGCAGTCTTAAAAATCATGATAAATCCAAAAGTTGATGATAATGACAAAATTCTTTTACAGTAACATTCCTTACCTTTAATATGATTAAACAAAATGAGTGATTTCAGAGGAGAAGTTGCAAATGTGAAAAATGACCATCCCTCTTCCTTTTTTACAGTCTTAAAAAATCATAAAAATATCGATTTTATAAATTATCTGTCTTATCCTTACATAGTTATGTGACTTTGATTGTTTTACAGTGATAGTATAATGGGAGTTTCTTTGGAACGCAGTCACTTCAATAAACAATGTATTTTCATAAAGCTTTTAAAAGTTATAGTTGAAACTCAGATAATGTAAAGGAAATGCCCTATCGATTTTATTAATTATCCGCTTTGTAGTTACACAGTTGTGGGACTTTGATTTTTTAACGGTGATAGTGTAAAAGGTGTTTCTACTGGACGTAATTACTTGTAGTAAAAAGCAGTGTATTTTCATAAAACTTCTATTTGATACTCAGGTACAGTAAAAGAAAAGCCTATCCCTATCGATTTTATAAATTATCTGCTTTGTCGTTTTTCAGAGGCTCCACCGGCCGATTCACTGGTTGGCGAAATGATCATTCTCGGTGACCCTAGGGGATTTTCTTCATGCATGTAATCCCCTGGGTTCACTCGTAAAATTTCCCTGGTTTGATGGTGATGTATCTAGATTACCGTCAGATGGTATTTGCAAATCCCAACACATCAGATACAAATGTACGCAAGAGCTTGTAGTTATGTATTGGATTTTTACAGTTAAAATTACAAATCATGATTCTGCTTCCATAAACGATTTTGGAAATTTACAACAATCATTCTAAAGATCTGAAAAATTTAGATCTTTGCCTGCAACAGCTCTGGGAACGTCAGACACTTCCTTTCATGGTGACTTAATCAGCAAAATAAGAGGAATCAAAGTTACATAGAATTTCCATCAGAAAAAATCAAAGGAATCAACAACAGAACACTCTGCGTGGTGCTGGACCCATTTACAGTATACTAGCCAACTGTGAAGACGGAACACCGTGACGGTCATGTTCAAATATCAGCAAGAAAAGGAAAAGACAGAATCCTAACCACCTGCAGATCATTTACATTAGTTCATTAGTTCATTCCATTCCGCGAAGCAAAAAAGCATATACTTCATGCTTTTGATACTCGATTAAATATTAATCTATTTGTTTCTTAATCCCCATCTTTTGACTGTCTTGTTTGTACCTTAGAGGATGCTATGATATACAGTAAATGTACGTTCGTCGAGATCTGTGGGTTATCGCATAAGTTACAGGGTTGTGAGAACGTTATCCGGATAACCACACCATTTGCTATTAGCATAGCAAATGTCCATTCTCAAGTGGAACATTCTGCTCATTTGTCTCTGGTCTTTGTGCCGCCTATGTTGGTATCTTATTGTCGTTTATGCTTGCATGTCAAATAATACCCCCGCCAACGAAGTTGAGGGGGTATACCGGTTTCACAATGTCTGTCTGTCCGTCTGTCCGTCCACGGACACAAATTTCGTTTCCGCACCGTAGAGACCAATCCAAAGGAGGATCCCTATTTATATTTTGGGCAAGAGGTCAAAGGTCAAGGTCACACATTTTTGCTGCCGCGGGGGTTATTTGTCCCGTTAGGACAGTTCTTGTTTCTTCTGTTTTTTTAACATTTTGTTGTTTGCTTGTTTTGCCGTGGATGTTGCAGCGGAGTCTTGCTGAAGAGCATATCATTTTCCTTTTTGAAAGAAGGTTTTCAAATAAGAACCAATGTGACCAACATTTGTCTGTAGTGGCGCCAGCGGATGAAACACAAAAACACTGGTACACACCATTTATACCTCATTCAATACCTGGTAATTTTCGTTTAGAACCCTTTAATGGGTCTTGAAAAGAAATTAAAATGAATGCAATTGACCCTAACCTAATTTTAAAGAACGTAAAAATATTAAGATAAGAGTATCCGACTAATTGATGATTCGCTAATTGCATCAAACCAATGAAAATTTTCGAAAAATCGCTGTGATAAAATTCTTTTTGTGTATGTTTAGTTCTGTTTTCATGGATGGCGTTGACTTTTTAGACCACCTAGTCGGAACACCAAAAATTGACGAATGACCATAAACATTCATAAAGTGAAAAGTCACTTGCATATGAGCTCATTTACTTTTTCTTAAATTCTAGTGTCAAAACTTGACCTCTCAACTATCGCATTGTGAGAATTAATAAGTTTAAAGTTCATTAGTCTTTGAGCTATCGTTCAGTGAAATAAGGGAATAACTATCTTCTTACCTAAGGTTTGCGGTCGGTAAACGCTGATTTTACGGTCGTAAAACGGATGTTTGCGACCGTAAAGTCAGCATTTACCGACCACAAACCTTTGGTAAGAAGATAGTTATTCCCATTCTAATTGCAACGCAAATAATTCACATTAAAGCCTCCAATAGAAGCACTACAGCACTATTCAAATCGGAGCCAAATTACATACTAACAACATTGATCCGAGAACTAAAAGTAGTTCTCTAGTTCATTCATGAAGAGTTACCTCCCACAAAAAATTTACACAGCGAGTAGCACATTGGCTACGCTACTGCTCGTTTGGTACGGTACAGTTGAAATTTCCACGAAAGAGCGATTTCTGTAGGATGCCAATACAACTACTTTCTTACACTTTGCTTAGAGATGAAAATTACTGTTTAGAAATAGGGTACTGACCTCAGATAGCGCCTAGTACAGAAACTGTACACATGTTCGGAGAAGTGTGAAATTCCACTGGCATGCTTTGTTCGAAGCTTTGTTCGTTTAAATTTGGGAAACAACATCAATTCCAAACCTTTAGTTCCTTAATAGATGACTATTCATTACAACCAGCGTCATTTCATATAACTTGCTTAAAAATATATCAAATGACTCAGGCTGAAACGATATGTTAAACTGTAAACATAACGTTGGCGCGATCCAACTTTCGTTCTTGTTCATTGCTGTGTCTGCCGTTACTGGTTGCTGATAGCAACTGCAGGGGAGTCGATTCTTACACTGACTTTTCGCATTCTGAATGGAATCAAACTAAATTGTTCCTATTGCTTTGAAAAGGTTTTATATTGCTTAGTTAAATAAATTGTTCAAATATGTGATTAAATTACAAGAAATGACTGTACTGGATTATCTTAGCAACGACCGCGTATGGATACTTAAGTTTGCGGCTCGTAAACGCTGATTTTACGGTCGTAACTATGGAAGGATTAACCAATCAAAATCGACGTTTTAGCAACGTTGCATTAGAATTTTGTATTGAGTGTCATGAAACACTGTTTAAAACAAACCTCAATAGGACTTTCTGTGGGTATTTTAAACGTAGTTGTAGAAGGATATAGTAAAGCTGCCGTTCGTCTGTATGTGTGTGTCACACTTTCTTGTATAAGAATTATAGGGTGAATTTTTAATCGGAGCTTGGTCAAACTTAATGTATTTATTGCTTTTGGCCTATGAAAGAACCCTACTTGATTTACAAGGTAATTAGTCAAAGGTCAGGGTCACAGATGGGACTTTGATTAAAATCCATGTATACACCTTAGAGGGCTTATTTTTCAACAGCACTTCATCAAATTTGCTACAGGTATTCATTATGATCTAAGAAAGAACCCTATTGTTTTTGAAAGTCATAGGGCTAAGGTCAAGGTCACAGATGTGACTTAATAAAAATCCTTGTATACACTCTAGAATGCGATTTTTAACAGAACTTCATCAAACTTGATACAGGTGTTCCTAAGAACTAGAGAAGAATTCTATTGATTTTGAAGGTCAAGGTCACAGATGGGACCAAATCAAAATCCTTGTATATACTGATTCAAAATCCTTGTATACACTCTAGAAGGTGCATTTTTAAACAGAACTTCATCAAACTTGGTACACTTATTTCGGTTACCCGGAGAAGAACCCTATCGATTTTTATGGTCAAAGATCATCAAAATCCTTGTATTCACTCCCATCCGTGTTCGATTGTCTTTTTTGTATAATCATCTAACAGAGATAAGGCTACTGTATATAACAAGTGTGAGTGACTTCTGGATAACAGATAAGGGGAGGATTGTACGCGCGTTATCCAGATAATTATATCATTTGCGTTAACGTTTGTGAGACTTCATGGTTACCGGATAAGTTACGAAGGTAATACGGATAACTACAAAATTTGCTATCAGCATAGCAAATGACCGTCCTGCGTCGTTTACGATTGTCCATTGGTCTCTATGGTTTTGATGTTGTTTATGACGTTTTAATGTTGTTGGTGTTTGTCTGGTTTTGTAAGTTTTATTTATTCTGTGCTTTCACATTTTGGTGTGTTCGCGCGTTTTCCTGTGGATGTTTTATTGTAGTTTTATCCCCTTTCTTTCGGAACTGAACCAAAAGTAACAACACTTCTTAAAATATCCCTCCAGATCATCCATTTACCTTCAGTTTGTCCATATGTGTTTCCGTTCGTAAGAAGTTTGTTTGAAAAAGGATGATTAACATGTGACTTAATGGTGGCGTCATCTACGACTGTTGCGGACAAAAATGAACAACACGTAAAGGGCACCACTTGTATTAAATCCCTACTATATTTCATCAAAATTCGATTTCTATGACGAAAAGCCTATTTGATACTTTGGCACAGGTCAAATAAAATACTAAACAGAGATACACTTAAGCACACACAATGAGTAGTCTGTCTTTGTGATGAATACTCTGTGGGACGATCTTATTTCAAGTAAGTTTTTGTTTGTTTTTTTGTCAAACTTGGCGGAGCAAACGTGGTGTCCGTGGTGTCTGGCAAAACTTTAACATTGGTCATTACCTTTGGATGGTAATTGACAGTTATTTCATATTTCAAATGTGTACTCCTTGTGAGAAGCGGTTTTTTTCATATTTTATACAAAGAACTTTTGACCTTGTGATCCTAATGTTGGTGCTTGATTATGTTATCAAGACGATCTAAATAGGCCGAACTTTTGAAAGCAAAAAATGTTATCCTTTGACATTGATGGTTGCCTTTGAAGAAAAAAAGATGCAGGTTTCCGATGTTACCGTCCGTGGGCAACAGTGTATCACAAAACACATCTTGCTTTCTTTTCAAATGACCCCAATGTGATTACCAAATGGAAAGCAAACAAGGTTTTTGTTTGAAATTAAATCATAGATATACCTTTTCGTCTGTTACAGTTGTCAACACGGAGACGGGTACTTTGTATCCACAGTCCTATAAAGCAAAAACACAAAAATGAAATTTATTTCTTAGAACTTATTTTGTAAATATTTACGAGTTTCATGATAAATTTTGGCCAAAAAATAACAAGTCAAGGCACCTTTCAGTTATTATACCAAGACGTCAAGGTAGCATATTTGATTTGGTTTTCCACAGGCACAGGAAATGAAAGAATACTATTTGAATTTTTTATCCATTTAAGCCATCAAATGGCATACATTTGAAACTTTTTTCGCTAAAGAGAAGTATGAATAAAAGATAAATATAAAAAAAAATTATATAAAGGCGAAGGAAGACTAAATTTACCAGTTGTTTGATGAAAGACCGCTCTGCAATGGACTGAAGTGTTGCTTTTCGGTCATGGATAACTGACAACAGTTTTATCATATTCTCGTCGTCTTCCCGGCATTCCACTGCCAAAGCGCCCTGACATACAGCGTGCAGACATTCATCACCATCTAGTCTCTGTAATAAATATTTAACTAAATAATCACCAGAATGAACCTTGCATTGATAAAAGTACTGATTCATACATTAAATTATTTTATTTTCTGGACAAAAGACAAATAAATCTATTGTGGACGTCTAGTTTTGAATTGGAAATGCTACTATAATCACCTCTGTGATCCTGTCTTGCATATTCATCCTGATCAGTCCTGATTCTGCCAGTATTATGGCCGCATAAGTATTGTCTCCGTCAAGTTTTCCGAAGCGGGTATTCAGGTTTCCTCTCTGTTGTAAAAAGAAAATCGTTGTGCAAATAAACAACATAGAAACAGCTTTTTGTTTAGATGTCTACGGCGAGGTCAATTCTGGGGAAAATGAAAGTGTCTATTTCATGTAGACATCATCCTAAGATTATGAAAAAGACAATGAATAGGCAATTAATTTTAAATGTGATAATCTAAGAATGCATATTTTCAGTATGTTCTTGTTCGTATCTACAAATGGTAATACTGATCAGAGGATTAATACAAATAAGAAAGTAACCTATAAGTGGTGCACAATTAGTGCCCATTAGAATGCCGGAAATTTGTTGAAAAACCTTTCCTCCGAACACCACAAAAATGTTATCAATCAGAAGGCTCAACATCGTGATAACCTATGGTAGAAATTCACGGCTACTGTTTTTATTTCTGATAGCGTTTTGATAGTTTTGTTAAGTCTGTCTTAAACTGTGAATGAGAAATTGCCGTGTAGTGTTGAGATATCGAATACCTTGATAAAGTGAATTTCATTGCAGCTGCTGGATTTGCAGTCTTATAATTCTATGGAATTCCTTACGATTCAAAACTGACTGATCCCTCTTCAAGAATACAATGTCCAACAGCATCTTTTGAGGTTGCATTAAGTTTCAGACAAAAATTCCAGTACGATTCGTAAACGATCCTGTTTTCCGTTGCTGATCAACGTTTAAATTCCTTTTCTTTGGAATGCCTCAGTTGCTAAAATCCTATTGAATCTCCATGCCAAATTCGAAGTCAGTATCTCCCGTAAAAGTGAAGATATGCTTCCTACCATTTCTCTTACGCTCTTTTTCGAGTTCGGACAAAAAGGTGTCTGCTTTTAAGTCTATGAGATGTTCGCAACATTGAATGTTCGAGCGACGTCCTAAGTTGACCGCTGCTGCCTGCTAATTGATCTGCTATCCTCCGACACCTTTTTGTCCAACCTCGAAAAAGACCGCTCGTGAAAAAAATATTAGGAAGCGTGTCTCCGTTTTTACGGGAGATAATGACTTCAACTTTGGTATGAAGATTAAATAGGATTTTAGCTATTGAGGCATACCGAAGAAAAGTAGTTTAACCATTGATCAGTCTATTTCTACAGCCTGAAACGATGACTTGTTTATCTTTCCGTAGACGCCATGTTAGAGCCCTTTACATAACCCAAGGCCCATCACGCAACGGAAAACATAGAATAATCAAAGATTACATAGCTCACCTCGACGTAGGCATTTGAATTGAAGGAATTTGATTTTAAAGAACTACTCTATACATGTAGAAATATTTTAATAGGATACCTAAATAAAAGAAAGATTAAGACGGAATTAATGCTTTCTGCAGAAGACAGAATATGAGAGTTTGAAACATGTATACTTCTTCATTGCCTAATATATGTAATTCAGAACTAAATCATTCAAGCAGAAAAGGTAGGTCAAGGTCAATTTTTGAAAGTTAGACCAATGGAGCATTCATTGTGCAAGTATAGACAATGTAACACTTATACTTTGCCCAATATAAGTAATTTAGTGCAAAATCATTCAAACGGAAAAAGTAGGTCAAGGCCATTTTTGTAAGTTGGACCAAAGGAACATCTAATACATGTATGCAAGTTTGGACCATGTACCATTTATACTTTGCACAATACAGGTAATTTAGTTCAAAATCATTCAAGGAGAAAAAGTAGGTCAAGGTCAATTTTATGAAAGTAAGACCAAAGGAGCATCCAATGTGCATGTTTGGACAATTTAACAATTTTACTTTGCCCAATATAGGTAATTTACTGCAAAATCATTCAAGCGGAAAAAGTAGGTCAAGGTCAATTCCTTTAAAAACAAGAAAACTGTAATTATGTTTCTTAATAGATCATGTCAGATTATTATGAACTTATAGTAAGCTGGGAATGGAGGTGTCCCATTTAACCTAACCTGGTCACTCAAGCATAAAATATAGGTCAGATGCAGCATCCGTGCCATGAACTGCAGTAAGCATTCTTAGATGCATCACCGACACTAGTTTGCTTGATGTAGGACTCATAGCAAGCTGGGAATGAAGGTGTCCCAATTTAACTAACCTGGTCGCTCAAGCGTGAAATTTTGGTCAGATGCAGCATCTGTACCATGCACTGCACTAAGCATCCTCAGATGCATCACCCACACAAGTTTCGTTGATGTAGGACTTATAGTAAGTTTGGAATTAAGATGTTCCATTTTACTTAAGCTGGTCACCCAATCGTGAAATATTGGTCAGACACAAGTTTGGTTGATGTAGGACACAAAGCAAGCTTGGAATTGAGATGTTCCATTTCATTTAACCTGGTCACTCAAGCGTGAAATTTGGGTCAGATCCACCTCCCGTACATGCACTGCACTAAGCATCCTCAACCGCATCACCCACACAAGTTTGGTTGATGTCGGACTCGTAGCAAGCTGGGAATGAAGGTGTCCCAATTTACCTAACCTGGTCTATCAAGCGTAAAATATGGGTCAGATGCAGCATCCGTACCATGCATTGCAAAAAGCACCCTCAGATGCATCACCCACACAAGTTTGGTTGATGTAGGACTTATAGGAAGCTGGGAATGGAGGTGTCCCGTTTTCCTTAGCCTGAGTGCGGACGCCGACGCCGACGCCGAGGCGATAGCATAAGCCCCCCTCTACTTCGTCAAGGTGAGCTTAAATAGGTAAATTCCTCCGTTGCGTGATGGGCCTTGGGCTATGTAAAGGGCTCTAACATGGCGTCTACGGAAAGATAAACAAGTAATCGTGGAGCACTGAGAGACCAGCATTTAAGTGTAATTTGCAGAGACTTCTGTACATTTTTATCTTGTATCCGCAAATTCTTATGAGTTGCACACTCCATGACGGGCGTTATCTAAACCTCATCAGAGAAGGTATGACCCTGACTACCTCTCCGTCCTGAAAGTTAGTCGAGCGCCTCGAGTGATTGTACATTAGCTTGCTCCCGTCAGCAGAGCACAGACTGATTTTTTTATCGTACGCCCCTCAGCTGCTTTTGATATTCATTAATATATTTTAAATTATCAATTTCATCCTTTGATCCCTGTGTTTGGTTATCTTGATTGTATCGTCATATTACATTGACGAGGCAAACACATTTGCCTTCATCGAGTCATCTGGGTTATCGGATACTTGGGGTGTTGTGCACCCGTCATCCGGATAACCACACCATTTACTATCAACCTAGCGAATGACTGTCATAAGTCGGCACCGGTTGCCCATTGGTCTCGTCGGGTTATGTGTAGTCATTGATGTTTTGGTGCTGTTGGTGTTTGTTTGTCTCGTATGTTTTGGTCCCTTTGAATGGTTGTGATAGTCCATTCTGTGTGTTTAGGATGTGTGTGTTTGTGTGTTTGAGTGTTTTGCTTGGTTGCTGTAGTGGAGTTGCTGGGGATCACTTCCTTTGTTTGAAATACAATGAGACAAGTCTGAAACAAGAGGTCATTTCTGAAAGCTCCCGAGGGCGATGAGCATGGTACTCGTAAAATGACACAGAAAAGTATATAAATAGAAGTACAGAGACTGAGACACTTGCTAAATCGAAGAAGACCTGGCACAAAAAGAACACTATATATAGCGTTGAATTTATCTACAGTCCAAATCAATGGCATCCGAAAGCATTGCAGACTGAGCGAATGTGGGAATTGAACTCGCTGACGAGACTAAGCTTCGCCAGAAAAGACGGGCTTCAATACAGTCAGCCTCTTCGGTTTACTCACTTTAGATTGCTTCTGCAGGCAGAGAATGCATCGTTGGACGCAATATCCTATTGGTTTAGATACCAATTTGCATTTTTATATTTAATTTGTGACCTTTTAGTCAGACTCCTTTCGCTTTCTTTTTTTATCTTCTAAGGAGGCATACATTTCAACTCATGTATGTCATCTGACCTCTTTAATTAGGAAAAGTACGAGGGTCAAGCGTACGTAATCCTTGATGCTTTTGAAATCAATTCATATATTTATCTATTTGTTTTTGGGGCCCGTGCGTTTTAATGTTTTGCCTGTATTGTCATCTCACAGTTAGAAGGTTATTGTATACATCTGTTTAAAAGTGTGCGTTCTTCGAGACCTCTGGGTTGCCAGATAATTAGGAGGGATGAGAGCACGTAACCTGGTCAACTACACCACAAATGTTCGTCCAAAGTCGGCACTAGTTATCCATTGTTATCGTTCGTTTATGTTTTGTCTTTATGTTGATGTTCTGATGTCTTTGGTGTTTGCATGTTTCACTGTGTTTGTTCCCTTCTGTGAGTTTCCCATTTGTTGTTTGCTCGTTTTGCTAGTGGTATTGCAGTTTCATTCATTTCTTATGAAATCATAGCCCGAAAAATGGACGTAAAAAGTAAGCACACCTTGAATGTAAAATTTTTAAAAAGTAGGTCAAACTACAAGTTCAAGGCCACAAAGCCGACCTTTTTTCAGTACCAAAATAAAGGCCTTGCCACACATGTGAAATATGAAAGCCCTATTACTTACCAATCAAAAGACAAACCTGATGTAAGTGTTTTTGTAAAGTAGATCAAACTCCAAGGTCAAGGTCACAAGGCCAAAAGTTTGATACCAACATAAAGGCCTTACCACGAGGAATACACATGTGAAATGTGAAAGTCCTATCACTTACCGATCGAAAGATATGCCCAATGTACGATTTTTTTTTAAAAAGTAGGTCAAATTAGAAGGTCAAGGTTACGAGGTCAAAAGTATCAAGTATATGTATCAACAGAAAGGTCTTGTCACAATGAATACACATGTGATACACCTACACTTTCAATGTTATGCCTCTTTTATTATAAGCGGGACGGAATGACGGACGAACGGACGGACAGACAAACGGACAGACAGAAAGACGGACAGACGGACAGACGGACAGACGGACGACCCAGACGCGGGCATAAAAAATCATTTAACTTTGCACATAACTTTTGAATGATAGTGATAGGTTCTCATGACAAGACCTTTCACCCGGTACAGAAGTGTAAGACTTCATGGAATTGACCTGGAAATTTAACTTTTTTTAAAACTGTAACATTGGCTATAACTTTTGAATGGTAAATATGGGAAGAAACGCAATAGCATTAATACAGACATAACACAAATCCACAAGCAAGAAAGACAAGAAAAAAAAAGCCAAAAGCAAATAGGTTTAGTCACTAGAATTTGCGAAGCAGAGAAAGATTTAATTGTTCATTGCATTTAACGCGAAAGTCATTAAACAACTAATTTGAGTATAACAAGCATTCTGTGTCCCCTACTGGCCCTACAGCAGATGAAGGGGCATAACTCGTTGAAAAGTAGGTCAATCGTGACCGAACTCGAACTTGATTTGTAACTGTGCAAGATGAAATTACGTATAAATGTTCACCTCACTATCGCTGCAAATTGCAGAGAAAAGTCCGGAAAACTGAAATTGACAGACTGACATAATGACGAACAGACGGACAGACCGAGGGGAAACTAATAGTCTCCTCCAGCTTTGTCGGTAAGGGACAAATCAAGCATTACCTTTATAGGAAAACAAATCTGAATTGATACGTGATTTTTCTCAAACAAGTAGATGAAACATTGTTTGATATAATAGACATCCTCTGAAAATTAAATTTCTTTTGTTGAAGTATGTTCTTAATGTTTACAGCTACCTCCATCATTAGAATTAGAGAAACAGATTTGTTATACCAGAGATATAATATTTAAAGTTGCTTACAATATTTTCGAATGTCAGATGTGGGTACTTTCTCGAAATCTGAGCAACTCTTCTGAGCGAACTGGTTCCAATAACGCTGTATAAAGAGATGTATTTCACCATGATCTTTGACTAATGGCATGATATAATTATCATGGTTAATTTAATGCGATTTGGAGAAGTGTTAAGGGGATTATTTGGTCTCAAAATCAAAGAACGAACAGAAAAGAGATAAAGCTACACATCAAATAGAATACACCTTACATGCATGTTTCGGATAATGAACTTCAGTATACTTGAAGGCAAATACTACTGGCTATTCGTAAATTAACCTGAATATTTTATACGCCCACTTGTTCACATATCCCTATAGGTTCACACATCCCTGTAGGGATACACCCATTTGTTCATATATCCCTGTAGGATACATTCACTTGTTCACAAATCCCTGTTCTGTAGTGATAGTTACACCAATTTGTTCACAGATCCCTGTAGGGATACACCCTTTCGTTCACAAACCTCTACGGGGATACACCCATTTGTTCACTGATTCCTGTAGGGATACACAAAAAATATGTCAAAGTGGGCCTATATCGTTCACTCGAGAGCCACATCTGCCTTTCTTGAAATAACTGACTACTTCAACAAAACTTACTCAAAAATCCATTGTTAATTAGCATACCAAAGAGTAATTAAATATAAATTGAATTAGAAATGAGAAAAAAAAATATAATGAATTGATTTTTGTCCCAACCTGGATTTTAACCCACAATTTCAGTTCACTGGCTTTATCCATATTATCCATGACCATGGGTGAAACCAAAAACATCAACACAAGACATCTCAAGTAGATTATTCTGATGATTTCAGTTTGTCAATAAGTATTCGGTTCTGAAATAGGAGAAGTTTAAGAAGGATGGTACCCCTTTGACCTACTTTTGCCAGTTGTTGCGTCAGCTGCTGACGGGTCCCGGGAATAAAAAAACACTTAAAGGGGATCATTGACATTTCGTCTATGACCAGATCAATCAAAATCTTCTCAAAGGCTCTGTATAAGAAGCTGAAAATGTTATACTCTCCCCTCGTTTCTTTATATGAGAAAAAAAATCATAGAAATTAAAAAGAAAAAGATCTATATTAACGCACTTTGTCAAATGTTCCAAATGTACTTTTAAACATACCTTGATTGAGTTAATCAAAGAAGTTATACTAAATGTGCATTTCTCACAAAGTTTGTACGCTGAAAAAATTGTTAGACAAGAGTACTTTTATTTTGACGAACTTTTCCTTCAGTTTTTTACCGAATCGGTCAGAAAAACAACAGTTCAATCCTATAAATGTCCGTCAATATCCCTTCAGTAGTTATTCTAGTACGGAACTTATTATTGCATGAAAAGGAGCCAATCCTACATTCTTAAAGTTGAAATAAAAATCCCAAAATATAAAAACCAAATTGACCATTAAAAATGTTCTAATTGGTTCTTTACTTGAAATTCCACAATTTTAAAATCAAATGAATGCATAAAATCGTCCCGTCAGAGAGTTAACCAATGAACTAATCATGAAGTGGGCATTTCTGACTGAGTCCAAAAACAAAGCAAAAATATTAATTTTGGAATGGAATCAACAGTAACAGCATTGCTTAATGCCTTTGATATAGTCAAGTTCTACTGAAATTTACAAAAGCTCCCCAATGTGACCCACATTTGCCCATAAAGGTGCCGACCTAAGGACCATTAGCACTTCATCACTACCGAGTTTCAATAAGACCCCTTCAATGGTTTTTGAGAAGCTGAAAATTTGAAAAGCTGGACGGACAGACGATTTAATATGACTGTAGCTGGTATGATCTTTAGGCAAGTTTGTTTTATCATGAACAGATGTAAAAAATAAAAAAGAAATAAATGTTAAAAAACTATTATGCCCAGTTCAGACGAATCTAATTCGCATCAGATTTAATGCGCATCAGTTTAATTCGAATTAGATTCGCATTGTGTTCACAAGACAAAATCTAATGCGCATTAAATCTAATTCTAATTAAATTAATGCGCATTAAATTCGATGTGTGAACGCATCAAAAATTTGATGCGAATTAAATCCGATTTAATGCGCATTAAACCCTCCATGTGAACAGGGCATTAGTTCATACGATACCTTCCAGCTGGTAAGTCCTTCAACATGAGATTTTTGTTCTGTAGACTCATTGCCACGGCATCATATGGACTGTCACGCCTGGAGGACACAAGTGTAATATTTGTCAACATTAATTCTGCATATTCCAATTAGCAGATCTTAAATGACAAAAATGCAAATGAAAACTTTTCCCTAACTCGTCCTTTCTTATGACTGAAAATCCAGATCTCGTACTCTCACCATCGCACTCAGATTAAGTCAGTGACGTGGACAATCAAGGACCTCTGGAAAACCAGTGGTGAGACCAGGTGTCCGGTAGGCGCTAACGCCATCTGTTTGCCAAGGCACGACCGACATGTATGCCCCGTTGAGAGAAGAGCATAGACTAACGACACGAAGCGTGGAATAATCATTTTCAGGTAAAAATTCATAACGCTTACATATTTCAGTTATATAGACCTCCTACAGCTAGTGAAGACTATATGAATAAACATAACGAGCGTAAAAAAGTTTGCAGCTGCTTAGTTTTTCAGTCTTGAATTCTACTTTTCAAAGTCTTTTTTATGACACACATGACTCCGTTTCATACCTATGAAACCGTCAAGTACTTTTTATGACCCCTTAATCAGAGATATACATGTCATATGACTTTAACCTACGTATTCCTTGTTAGAAGATCTTTCTTTCAATATTTTTTTCCCTTGAAACCTTGTAAAACACTTTGACGTAGAATCCTACTCACTCGTACACACATGCTATGATAAGGCCATCAGGCAGTTTGGCTGGGAGGTCTTTGAGTGAATGAATAACAATATCAACTTCTTTCTGCAGGAGGGCAATCTCTAATTTCTTGATGAAAACCGTCGTCTCGCCAACCTGACAAGGATAAAATTGTCGTATACTTTTCTTTTAAAATGACGCATAGTAAATTAAGGATGGTAAAATATTTTTTAATGTATTTCACGAATTAAATAAGAAAAAAATCTAAATGCATGCATATGGAGATACAAGTTATTTTTAGAAACGTACCTCAAATATTACTTGTGATCCCAATTATCTAATAAAGAAAATTCGCACTTGAAGAGAAGGCCAGGAAAAAATGAATAAATAAATAATATAGAGTAAACAAATAAAGTAAATAAAGAAAATAAAGTAAATAAATAAGAAAATAATAAACAATAAATAAATAAATAGATAAGTAAATAAATAAATAGATAAGCGAAAAGTATAATTTTATAGCTTCATATTTTCTCGGATTAAGGCGATCCTTTTTCATATTTATTAAAAGAAAGTCGGTCACAAGATACAATTAATCGTTATAATAAGCTTTCAAGAGTCGTCTTTAAATGAAATGTAAATTTAGGGAATAACTATCTTCTTACCTAAGGTTTGCGGTCGGTAAATGCTGATTTTACGATCGCAAACTGAGTTTTTCTGGCGACGCGTTAGCGGAGCCAGAAAAACGGATGTTTGCGACCGTAAAATCAGCATTTACCGACCGCAAACCTTAGGTAAGAAGATAGTTATTACCATTCTAATTGCAACGCAAATAATTCATATTTAAGCCTCAATAGAAGAACTACAGCACTATTCAAATCGGAGCAAAATTACATACTAATAATATTTATCCGAGAACTAAAAGTAGTTCTCTAGGTCATTCGTGAAATAGAAACATTCATCCAATGTCAACAATCTTTTAATACGTAATGCAACCATATACTCGAATAATTTAATGTTAGAGTTACCTCCCACAATAAATTTACAAAGCGAGTAGCACATTGGCTACGCTACTGCTCGTTTGGTACGGTAGTTGAAATTTCCACGAAAGAGCAATTTCTGTAAGACGCCAATATAACTACTTTCTTACACTTTGCTTAGAGATGAAAGTTACTGTTTAGAAATAGGGTACTGACCTCAGATAGCGCCTAGTACAGAAACTGTACACATGTTCGAAGAAGTGTGAAATTCCACTGGCATGCTTTAATCGTTTAAAGGGAAACAGCATAAATTCCAAACCTTTAGTTCCTTATTAGATGGCTTTTCATTACAACCAGCGTCATTCCATATAACTTGCTTAAAAATATATCAAATGACTCAGGCTGAAACGATCTGTTAAACTGTAAACATAACGTTGGCGCGATCCAACTTTCGTTCTTGTTCATTGCTGTGTCTTGCTGATAGCAACGGCAGGGTAGTCGATTCTTACACTGACTTTTCGCATTCTGAATGGAGCCAAACTAAATTGTTTCTATTGCTTTCTAAATGTTTTATATTGCTTAGTTAATTAAATTGTTCAAATATGTGATTAAATTACAAGAAATGATTGTACTGGATTATCTTAGCAACGACCGCGTATGGATACTTAAGTTTGCGGCTCGTAAACGCTGATTTTACGGTCGTAACTATGGAACGATTAACCAATCAAAATCGACGTTTTAGCAACGTTGCATTGGAATCATGTATTTGGCACTGACGGTGAAAGACAGAAATGACATTCCCGGACTTGATATGAAGATAATGTTACAAGGTAACGGAAAGAAGAAGGGAGATTCATTTTTGGCATATCGCAATCGCCTTGAAGGTCTTGAGAACAAAGTGATATGAAGTCGAATGACTTTTGATTGGTATATTACATTTTTTATGCCAAATTTGACACCAGGCGCTGATTGGTATCAATTACGTCATGTATGTCTTGCCTTGAATGTTATAGCATGTGTGCATCTTTTTCAAATGTAGTCTCTATACGGAAATGATGTATAATTCGAGGGAAGGTTTTAGCTGTATTGCTTTTTTTCCGTCCTCGGAACATCCACAGCGGCAGTAGAATGATTACCCCTTACGGACACTTGTTCTCTCATGTGGATTTCCATATGCCACGGAATGTCCTAATTTGTGTTTCATTTTCAAGGCTATGGTGCAAGTTTCGAATTAGTGATGAATCTTGTGACTGACATATACTTTAGATACATGTAAGTAAAATCAAAAGAAAAAAAAACTATTTTTGGTTGCTTCATGTGGGATCGGAGACCCTTTCATTTCATGTCCACAGTGTCTCAGCCAAACGATAAAAAAGAAATGAAATCATATTCATAGCATTTCTTATTAACAGATAATTTGACTGTAACAAATGTTAAATAAATAAATCAGTAATATTACCTTCACAGAAACTTCCTGTAATTTGTCGATGAGTTTGTCCATGGTAACTGAATAAATATAAAGTTGATGTAATGAGGTTCAATTTAAAAAGATTAAGGTAAATGTTATTGATAAGAATTTTCTATGGTTATTCTTTATTTACTTAAATCAAAATACCTGTTGCGACATCTACAATCAATTTCATGTTATAAAACATTCACTACAGTTCCAAAAATACTGTTTGGTTCAGAAAGAAGTGTATCCAAAAAACGTGCAAATCCAAGTTTATAGTGGGAGGGGGATTAATGTTTCCTAACAACATGTTAAATACTCACTTTACGCTCTGATTTGAATTAATTTTGCATTATTTTTATTTTCTTTATGATTATTTCATCAAATATACAAAATATATATATAACATGTTTTACGTTGTTTTTGCAAGTCCACTTACACTACACAATGGTGCTGTGTAGATAATATATCAGATATTACATAAGTTTAAAAAAAGTCTATCTTAAAATACAAGTGGGGATGAATATAACTTCTGTTAGGAGATTTCATCAGAATATTTTAAACAAGTTACCGCTAAAGACGGTAAAGTCGGATTGCGAAGCGTAAGTTATAGAAATATTAGGCAATGTTTGTGCAAGAAGTGAGATACATGTGTATCATTTTCAAATTCCTTACAGAGTTTTCATAATTCAGCTATATATTGCTATTTCATATTTATCTTTAAACTTGCAATCAGTCCCTTTCTTTCTAGTCGTCTGTCTTCATTTAATTTACAAATTAATGCTACTTACAATAATTTAACAATACAACTGAACATGCATGTAAATGTTCCTGTCCGACAGACAGACTGACGGACAGACAGACAGTCGGAAGAATATGCTTCATCATTTATGCTTCGCAATCCGGCCATAAAAAAGTAAAGAAAAAAGAAGGGTAACCGAAAATACCATGCTCACCTTAAATAGTCAAACGTGCAACATAATATTTCTATAATTGATGAAGTGATGTTTTTGATTAAGATAATTGTAGAAGTGGTTGTCATCTGATTTGAAATCATCTTTTTATGTTTTATTTGAATATATTTTCCGAACTTGAAATAGCATTTTTTATTGCTTTGAAATTTGCAATTGCCTGCCTTACTATTTTAATAATGTATTGTTTGCTAGAATGATAAAAGATGCAAAGCTAAAATTCTTTTTTGTGTTTTATTCATCAAAAAGATGATTTCAAGTGCATTCAAATCAGACAAAATAACTTTTTTCTGAATTTATCCAATTTTTAAGGTCTTACCAGAATAATACAAGGTCACACTGAAAGAATAAGTGTAAAATTGTTTCTTTTTTCCTTGGTAACGAAAAGTGCAAAGGTCATTTCGAGGAATAATTTATCTTTCTCGAAATAATACTTTGAGATGGTGCCAAGCCTATGAAGAGGTAATTAGTAGTAATGTAGTTTTGTGTCTTTGAGATGTTCCGCATCATTAAATGGTCGAGCAGTGCCCCAAGGAAAGGAGTTTAAACCTTTATCTACCTATTTCTGCAGCCTAAAACAGGGACTTGTTGATTTTTTCGTAGGTGCCACGTAGCAAACCCTTTAAATTACATAACCCTACGACCATCACGCAACGGAAAAGAACGGGATAAATCCCTGTGACTGTGACGTAATGCATACGGATCACTTGCATTAGCACGCGCAGTAAAATATTTTGATAGCCAAAAGTCTCTAAACTTCGATCACTAAAGGCCACTTTACATTTGAATAAAACGGTTCCATTTACAATGTTACATTGTAAAACTTCGTCATTAAAGATTGATAACTTTGCCTTTGTTTGAGGTATTATCCGGCGAGTGATCGCACTGGAGCTTGTTTCGGTCAGTAGCGCCCAACCACACCTTCATGCAGTTTTTAATCAGTTTTAAAAGAAAGCTTAAATTAGATGCTCAACAATGTATTACTTTTGTCACTCTTTACCGATACATGTAACCTTAGGTTTTGTTGCTTTGGACAGCGAAATCTATGGCATAACAGAAAATAAGGTTTTCATTGTAACGTGGCTGATTTAGAATTATCATGTGACGTAGGTGACAAATGATTTGCTATCATGCTTTAAATAAAAATAATGGTTAAACAAAGATAAAATAAAGATTGTTAGCATTTTAACATCTTTAAATTTTTACAACATGAAAAGATGGAGCAATCGATATCGATAAGAATGTACAAATGCCATACAATGAGGCAAAGAAACAGAAGGTTAGACTAGAATGATATTTTTTAGCGTATACACAACTATTTACTTTGAAGCCTCTAAATAAGACATGTAGATCGCATTGAAGCCATTTTGTAAGTAGTCCGTCTTTACTTTGAAGCTGGAATAATAAAGGAACGTGATTTTCATTACGATGTCTAAGATAGATGCCTGTATACATGTAGGTTTTCACTGTGAAAATATCAAATCTAAACAAACACTTTTAAATCGTATAATGCACTTCCGAGATATAACATGCAGTTTGATTGCTTCATATCGACCGATTCACGTTTCAGATCGATGAAAATCAATGCGCCGTGCGACGTCAGAGTTTTCTCACTCAGGTACAAGTAAAGGAAAAGGTTTTCGAAAGCGAGAGAATGACACAAAACGATGCGAAAGTAACATGAGTTTAATTCAAATTAATCATTGCATGTTCACAATTTAATTATAGGTTCGATCATGAAAATGTGTGAATACATTGTTCTCTGCAGTTTTTAATAAAGCGAAAACTTTTGAATGTAAAATGAGAACCAATTAACTGACTTACTTATTTCATATTGGACGTCTGGACACTTTTTCTGCAGAGCATTCAGTATGATGTCTGTCTGAACCATTGCCAGCTGCAAAGATATAAGAAGAAAATGAGTGAAATAAGTGTTATTTAACAAAACAATTACAGTCAATTACAATATCTCCAGATCAATATCAATGTAGGAAAAGTCCAGCGGATAGAACCCCCCCCCCCCAGTAACATTGCTTATATTTTCCCTTCTAACCTTTAAGATCTGATTGGTTCTTTTAAAATAAGTTGAAATATATAACGTTTTCGCCGGACCAGGTGCGGATCGAGAAATATCGACCAGAAAAGGAAGTCAGATCCCTTCCGAGGCCAATTTTTTTAGGGGGGGGGGAGGGGTCAAAACATTAGTTAAGGTAAACAATTTAGTAATTTTTGCAAATATTTAGCAAATAAAATAACATTTGACTGAACTCTGGAAGAGAGGTGGAGGTTAAAATGTATCCCTCTGAATTCTCTCACAAGGATACTGAGATTGAATGATGCACAAAGGTAATAACTCATTTGAGCCTTTGCCTGAGATGAGCTTATCAAGTAGAATAATTATGTGACTGAAAAATTATGGCCAAAGTTAAAATTAAAAAAAGAGGTAGATCAATCTCTCTCAGATTAAGGTCAAAACCTATATCCCAGAATTTTCGATAATAGGGTGCATATCTCTGAATTCCTTCTCTTGTATTCTGGAATGTTATTTAAACAATCTAAATTGTACGCATCTCAAAACAACAATATAACTTTTTGATTTGTGCCTGAAATATACACTGAATTTTTATTATAAACATTTGTTCCAAGTTTAATTAACATCTTTGTTTCTAAATATGTCTTTCTTCTCAAATTATTTGTAAGAAATCGCTAGAAATAAAAAGCCTCCTGCATGGAGCTTGGTCATATTAAGAACATTGTATTTTTCGTTTTTCTTAAAAATATTCTTTTATGACGATATTTAGAACTCTGTATATAATTTTGTAAGTGCTAACTAAATTCTATATTTGTCACTTACATAACCTATAGTTACCGATATGTATAATGTTTGTTTTACACGTGCAACCTAGAACTGAACTTTCAATTTCATTTCGTTTCTTATATTATACATGTAAAATACTAATGTGGTCGAAATATACTTATTTAGTCGACGGAAGATCTTAAATGAAGTTTATGTCTAAAAGGGATTTATTCAGTCTGCAGTCAACATCCAATGAAAAATTACAAAAGAACGAATGGGCAAATTCTTATATCAATCCCTGAATTCTGACAATCGTTAAATTGTCAAGTATAAAGAATGATCGAGTAATTTGATATTGCATCGTAAAAGTTAGCGGTTAAAATATCCTATCTGACTATCCTAGTCTTTGGTACACGTAAGAATCTTATCTTGAATGTATTTCCAGAATTTTTCTTAAATCAAATTAAATTAAATTAAATTAGATTAAACTAAATTTAATAGCATACGGTCAAAAGTATAAGGTCTTGTTCTGAAGTAATTTCATTCTATGAATAAGTTATGTTGCAAAGAAGTCATGGAACATAATATTGCTTCATTCAAGTCGAAAAAAAATCACTAATAGCCATTCAGGATGCATGTTTAGTACATTTTATATTTGTACGACGCAAAAAAAAAAAAAAAAGAGAGAAAAGGTTTAATATTCAATCATTTAAGCAGAAAAAGTAAGACAAGGTCATTAGTTGAAAGAAAGTACAGATCCGTTTCAGGGGCCAAAGAGCTACCCCTATGAGCACAGTTAAACAAATTTAGTGCACTAGAAGTAAAGTTAAACAGAAGTAAAGCTAGATTCATCTATGATGCTAGTTTAAGACATGAAATATTCATACTTTGCCTTTAAGCGGATGTTTAAAGTAAAATCATTCAAGCCGAAAAAGTAGGCCAAGGTCATTAGCAAGGATGAAATTTAATATTTTGCACTTTCTGTATGCCTAAAACTAAGTATTCAAAGCAAAATCAATTCAACCAGAAAAAAGAAGGTCAAGGTCATTAATTAAACGTTTGACATAAGATCCATCCAGGAAGTAACTTTAACTCGTTTTGCACATCTACTTTGACTAAAAACAGGTATTTGAAGCAAAATCATTCAAGCGAAAAATGTAAGACAAAGTCATAATCTGAAAATTTGTCTTTAACTAAGTTAAGTAACATCCACAGTGCAAGCTTGGCATATGTAGCATTTCAATTTTGCCTGTTATTTAATATTTTCTGTGGAATAAGGTCAAGGTCAGGAGGTCAAAAGTCACGGTATCATTCCATACATTTCATTATAAGGTTTCTATATATAATTATATCAAAGACCTATCAATTATGGTTTAAAGAAAAGCCTATAGTAGAAAGGTCAACGTCATATGGTTAAAAGTCATGGTAATTAATGGAAGTTTTAGTCATAGGTAATAAATATGTGAAATATCAAAGCCCTTTTCCCCATGGTTAAAGAGTCGAAGTCCAATTAGAGCTTTTCAAAAGTAGGTGAAGCTCAAAGGTCGTAAGGTCAAAAGCCAAGGTACCAGAATGAAAGCCCTGGTCATGAGAAATCTACGTGTGAAATGTCAAAGCCATATCCCCTTATAGGTCAAAAGATAAAGCCCATGTTTAAGTTTTTTTAATAAGTAAGTCAAAGTCCACGGTCAAGGTCACTAGGTCAAAAGATATGGTACCAAATGAATGTCCTGGTCATAAGAAATCTACATGTGAAATATCAAAATGTCAAAGCCCTATCCCATATGGTTCAAAAGATAAAGCCAAAGTTAAAGTTTCTTTAAGTACATGTAGGTCAAAGTCCAGGTTAAAATGTCAAAGGTCATGATAACAAATGAAAGCACATGTTCATAAGGAATTTCAATGTTATATATCGTGATAATATTTGTGAATTCTCCAAAGGGCTTAACAAAGTTATCATGTTCTTGGTGAAGCCTCTACAAAAATATTATCATGAAAGGATTGAGCTTTGCCATATCTATTATGATAATATTTTTGAATTCACAAAGGGGCTTAATAAAGTTATCATGATTATATTCTTGGTTAAGCCCCTAGGTGAACCAAAAAGTATTATCATTATAGACATGTCAAAGCTCAATTCTTTGCAGTTCAAAAGATATAGTCCTGGTTACAGTTCTTGAAAAGTAAGTCATACTCCAAGGTCAATGTCACTAGGTCAAAAGCCAGTGTACCAAATGAAAGCCCTGCTAGTAAGAATTCTACATGTGAAATATTAAAGACCTATTCCTTATGGTTCAAAAGATAAAGCCCAAGTTAAAGATTTTTAAAAGTAGGTCAAAGTCAAATATTCATACTTGGGACTAATTTGTCGAAATGCGCATATGGTGCACGGAATTTACATATATATATGTCCCTGTATTTTTGGCATGACCCTTGCTTGTCAAGTGTATTCCTGTACGGAATACCTTGGACGCCAGCACTAGCAAACTGAGAATGTTGACACAAATGCGTAAATATGATATCATGATATCCCTTTTTTATGTCCCTATTTGTGTGAAAATTCCAACTTTCAAAGGCGAGATACTAGAAATTTTCAAGCAAAGAGAACTATTCTCTAAAATTTCAGAAATTGAAACTTCTTCTTTGCTCAGAATGCAATTCTTCACGTATACCAAAAGAGGGAAAAGACCAACTAACAGACACATCGCTATCAGTATACATGTACATCCTCCCCGCCCGAAGCCGTTCGCAATAAAAGACCTCAGATAAGTTAATTTACAAACAAATAAATTTAAGACTTAAATCATAGTATTCAGTAAATCTTTTTTTTTTTAAATCACATTCATTCTCGCATGGTTTTCTTTTCGTGTTTACTTATATTTTTTGTTTCTTTTTTTTTTTGTTTCTTTTTTTATTATTATTATTATTATTCCCTGTTAAGACTCTCTTTAGATAGATTTACTTAAAGTAGCAACGGTAATGTTTATTCATATTCTTTGTTTCTTTTTTTTCTTTCTTTCTTTTTATTATTATTTCCTGTTGAGACCCTCTTTAGATAGATTTAAGTAGCAAAAGTAATGGACTGAAAGGATATATTTTTCATTCTTCAAACGAATAATTAATCAAGACGTTCTACTTTATACGCTTAGAAATAGAGGCTGAATGATTGATATTTGAAGGTCATCATTTTCAATCATGAAATTATCTACAGTCTAGTTGATCAAATTAATGATTTGCCAAAGCTTTAAACTTCCATCAGAAATAGAACTGATCAAGATCATCTGTCATACCAACTCGACACAGAAATCATGTGAATCCAAGCTTACAATTCCAACAAAATATTCAAGAGAATGCAGCTACAGGCAAGGAAACAGGTAAATGTGTGTAGTTACCCACAATACGTAATGGTACGTCTTGTATTATTTTTTTTTATCAAGAAGTCGTTAATTAACCAATGGGGAAAGAAGGATAACTCGAGGTTATAATTCCGCGTAGCCGAGACGGCATTTTAAAACGATACATAACACGTGTCTCCTAAGATAAACATCAATTATGTAAAACAATGAAAATTCACGTGAGTTTCATAAAATAAGAGAAGTTCAAGTCCACATCGTACATTTTCAATTCGGCGAACTAAAATATAACGCGTGGTGAAGTTCGGAAATTATATAATTATATAATACAAATAAAACTTTTACAATACAAATTCAAATCATACAATAACAATTGAGAAAGATAAAAACGAGATATAAGTTGGGAATTAACAATACAAGTGAAAAATATCAATGCTAAAATGCTAGTTTTGACGTGTCATAGACAAGTGGAGATGGAAACAGATCCCTACATTATAAATTGCAATTTTTATGAAAAAAAATGAAGAGAACTACACGATTGGCTTGTCAATATGTCTGTACATTTAATCATACTTTCCATGTTAAGACGTTGTCTTGCTGTCGTTAAAAAATAATAATAAAGGAACAAAAACTGGAACCCTTTAAATTAGATTTGGACCTACTTGTGTACTGTTGTGGAATATTCCAGTTATAAATATTTGTGTAACTATTAATTTAGGTCATTTTTCCTGCAACTAAATTGTATAAATTTTCATTCTCTTTGATCGACTGAGATAGAGTTTCAAAGAATTTGTAGTCCAAGTATAAAATTCAACTGTGATAACAATTTGTTAAGTAATATTCCTAATAAAACGGTAATTGATGTTAATTAAAGAATGTTACGGTAGACAATTCACCACGAGACGTTTAACGACTTTTTTTCCGCTGCGTGAAAAGTCAGCGAAAGAATCGACCACTCGCGTTGCTATCAACAACGAACGACGACACATGTACGCTTAAGCTTAAATACGTATCCAACATAAGTTGACTAACCTGGGTAATTTGGTATATACATGTACTTCGAAAAGTATGACACAAAATGTTTGTGGATGTCATGTCAAGTCATCAACGACTACATGTTTCATTTCGATCAAATTTAACACCTCTGAAACAAAAATGTGGCTAACTGTAAAAAGCGCGAGGCGCAATGCTTTGCGTAAAAAAAACCCCGCAATTTATCGACTATATCTTTCGGTCGCTGAAAAACTGTAATTACCTCAAGACATGATATATTTCATTCGTTCTACGGATGTTTCGCAAGCAGAATTAACCATGTTAATTTTTTTTTTTTGGTAGAAATACATAAAATATATGCCGAAATATATGTACTGCAGTACGTCTCAACAAATGGGGGAAGGAGGGTTGGATGAAAGTTTCATGGTCACACTTGCTAAATCCGCGTCTACTTTGGTTTGTCTTTTTTTATACATTAACTATTTATCATTTGTATTTTTGTTATTTATCAACTATTTAACATTTGCCTTTTGTGAATTTACCAAATAGGTTCAATGTCCCTCCCGTCCATTCTGCCATTTGACTTCGAGGGCGCACTTCTGCCATCGACAGTACAGCAGAGATGTCGTACAAAATATTTTTACCAGAAACTTCATGAATTATTTTTGTTAACAATTATAAATTCTTAATGTTACGTACCGTAACATTAAGAATTTATAATTGTTAACAAAAATAATTCATGATGTTTCTGGTAAAAAACATTCTGTACGACATCTCTGCTGTACTTTGTCTTGGCGCAAATTAAATAGCTGTCTTCATCTGGTTCAAAATATCTGCTTGCGAAACATCCTCGGATCGAATAGAATATATCACGAGATATTTAGTTTTCAGACAGATATAGTAGATCAATTGCGTTTGCTGCGCAAAGCATTGCGCGTTGCGCTTTTTACAGTTAGCCAAAAATGTACATCAAGAACCTGTCAATTTGAGCTCATGTTCAAGGGGATAAAGTTTATTGCATCGGAATTTTTAATCTGCTCATCAACACTTAAAAACGCGGGTGATTTACGATTTCTTCCGTTATTTATTCTGCTCATTTTATGCATGTATCTATTGGAAACAGTAATGAAAAGGAACGCACACATAATTTTTTTGCTCCTGTATGTTATAGGAAAATCGGAGACGTACAGTGTCTAGTCTTTCCGTATTCGTTGCAAACGAATTAAAAAATCAAACAAAAAAATGTTTAATGCAATGTAATTTTAATACATTTTTTTATACATTGCATTAAAAATTTTGTTTGTTTGTTATGTTAATTCGTTTGCAATAGACCACTTGCCGATCTTGCAAAATGGAGCCCGAAATGTCCGAGCTGACATATTTTGGCGTTGTTTTGATTATGACGTCACAATTACTGACGCAATTTTATTCTAATGTAACAATGAAAAATATTGGCAAAAGTAATCACCTCGGACATTTAGAGCTCCGTCATAAAGATCGGCAAGTGGTCTATTTCAAATTTCTACAGAAAAAAATTATTGTAATTGAAAGAAAAGCTAAAAATAAATTCCTTTTCAAAGCATCCAATGATACTGTTCTTCCTCGGGATGCGATTTTTGTGTCTCTCTGAACTTTTTTTTCGTTTTATGATATGGAAACGCAAATTTATGTCACATCGGCAAACTATCGCATTTCTCCAACTGAACAGAGCAATAAATTCTATTTAATTATACCCTTTTTGGTGCATTTTCTTTTTTTTATTTGTATATTTCGACTTAAGAAAACCATTTTAATTTCCAACTGGCCTCTCTTTAAACTCACAAAGAAGATACCTTTTACTGACTGCAATTCGCAATGAGGTATCATTTCTGCGTAACTACTAATGAAAAGAAATCCGATTATCCTTTGCAACGCCCCACATAAAGCAAACAAAAAACAAATCTGAATATTCATTGTAAACTTCATAGATTAAAAACGAAATTTTAAACAAATGATGTCAAGCCATATGAAACGTTTTTCGGCGTCTCGATAGAGATTACCACTGACATAGTTTTAAATGAGGTGAAACTTACAGTGCTCTTTCTCACTCCAACTCTGATTCGTTTCCCATTCATGTTTGAAATAATATATCGTGTACAGGCTGAGATAGTGACTGCCATTGAAG"

echo "${string:1074056}"
