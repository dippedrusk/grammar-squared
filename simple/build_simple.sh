#!/usr/bin/env bash
# Assumes antlr v4.7.1 installed in /usr/local/lib - TODO: FIX

# Antlr creates source for a parser in Java
java -jar /usr/local/lib/antlr-4.7.1-complete.jar GrammarSquaredSimple*.g4
# Compiles the Java source
javac GrammarSquaredSimple*.java

# Tests it on our sample test.gr and produces a tree
java org.antlr.v4.gui.TestRig GrammarSquaredSimple r_grammar -tree test_simple.gr
