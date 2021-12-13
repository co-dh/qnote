#!/usr/bin/env q

/
    A Deadly Simple Jupiter Notebook for Q.
    
    Given a Q file, with a \ started comment block at the end of file, and Markdown inside the
comment, this script will generated a Markdown file from it, with:    
    * q code inside ~~~q will be executed, and results will be put INSIDE markdown code block.
    * q coed inside ```q will be executed, and results will be put into markdown directly, so you
can generate markdown table in Q, for example.
    qnote.q load the q file from command line, find the line with only a \, and output the
Markdown from there. If a q code block found, it will be executued    
\

fn: .z.x 0
system "l ",fn
lines: _[;lines0] w: 1+first where enlist["\\"] ~/: lines0: read0 `$fn
-1@"~~~q";
-1@/:(w-1) #lines0;
-1@"~~~";
row: 0; state: `NORMAL

while[row<count lines
    ; s: trim line: lines[row]
    ; $[ s like "~~~q"  ; [state:`CODE; -1@line]
       ; s like "~~~"   ; [state:`NORMAL; -1@line]
       ; s like "```q"  ; state:`MDCODE
       ; s like "```"   ; state:`NORMAL
       ; state = `NORMAL; -1@line
       ; state = `CODE  ; [-1@line; 0 s]
       ; state = `MDCODE; [         0 s]
       ]
     ; row+:1   
    ]   


\
Design Notes:

    The expect based version has some short comings: It can left some garbage log on the screen,
and need some sed magic. This version, I decide to use Q itself.
    Handling multiple line function will over-complicates qnote.q, so does embedding markdown in q,
code, and embedding q code in markdown code block
