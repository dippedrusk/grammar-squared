parser grammar GrammarSquaredSimpleParser;

options { tokenVocab=GrammarSquaredSimpleLexer; }

@header {
    import java.io.*;
    import java.util.*;
}

@members {
    public enum Type {
        NONTERMINAL, TERMINAL;
    }

    public class Node {
        private Type type;
        private String value;
        private List<Node> children = new ArrayList<Node>();

        public Node(Type type, String value) {
            this.type = type;
            this.value = value;
        }

        public void addChild(Node child) {
            this.children.add(child);
        }

        public void print() {
            System.out.println(this.type);
            System.out.println(this.value);

            for (Node n : this.children) {
                n.print();
            }
        }

        public void replace(Node n) {
            // this obviously has to change
            this.children.clear();
            this.children.add(n);
        }
    }
}

r_grammar
: gr1=grammarRule gr2=grammarRule
{
    $gr1.node.replace($gr2.node);
    System.out.println();
    $gr1.node.print();
}
;

grammarRule returns [Node node]
: Nonterminal Produces rightSide Newline
{
    $node = new Node(Type.NONTERMINAL, $Nonterminal.text);
    $node.addChild($rightSide.node);
}
;

rightSide returns [Node node]
: Terminal
{
    $node = new Node(Type.TERMINAL, $Terminal.text);
}
| Nonterminal
{
    $node = new Node(Type.NONTERMINAL, $Nonterminal.text);
} ;
