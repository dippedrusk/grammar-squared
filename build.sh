#!/usr/bin/env bash
# Assumes antlr v4.7.1 installed in /usr/local/lib - TODO: FIX

# Antlr creates source for a parser in Java
java -jar /usr/local/lib/antlr-4.7.1-complete.jar GrammarSquared*.g4
# Compiles the Java source
javac GrammarSquared*.java

# Tests it on our sample test.gr and produces a tree
java org.antlr.v4.gui.TestRig GrammarSquared r_grammar -tree test.gr


