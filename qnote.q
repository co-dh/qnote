#!/usr/bin/env q

/
    A Deadly Simple Notebook for Q.
    
    Given a Q file, with a \ started comment block at the end of file, and Markdown inside the
comment, this script will generated a Markdown file from it, with:    
    * q code inside ~~~q will be executed, and results will be put INSIDE markdown code block.
    * q coed inside ```q will be executed, and results will be put into markdown directly, so you
can generate markdown table in Q.

    qnote.q load the q file from command line, find the line with only a \, and output the
Markdown from there. If a q code block found, it will be executued

\

fn: .z.x 0
system "l ",fn
allLines: read0 `$fn
slashIdx: where enlist["\\"] ~/: allLines
markDownStarts: first 1 + slashIdx where allLines[slashIdx+1] like\: "# *"
mdLines: markDownStarts _ allLines
row: 0; state: `NORMAL

while[row<count mdLines
    ; s: trim line: mdLines[row]
    ; $[ (s like "~~~q") and state<>`PRE   ; [state:`CODE; -1@line]
       ; (s like "~~~" ) and state=`CODE   ; [state:`NORMAL; -1@line]
       ; (s like "```q") and state<>`PRE   ; state:`MDCODE /MDCODE do not out put the code into markdown
       ; (s like "```" ) and state=`MDCODE ; state:`NORMAL
       ; s like "<pre>" ; [state:`PRE   ; -1@line]
       ; s like "</pre>"; [state:`NORMAL; -1@line]
       ; state in `PRE`NORMAL; -1@line
       ; state = `CODE  ; [-1@line; 0 s]
       ; state = `MDCODE; [         0 s]
       ]
     ; row+:1   
    ]   

-1@"## Code loaded";
-1@"~~~q";
-1@/:(markDownStarts-2)#allLines;
-1@"~~~";

exit 0

\
Design Notes:

    The expect based version has some short comings: It can left some garbage log on the screen,
and need some sed magic. This version, I decide to use Q itself.
    Handling multiple line function will over-complicates qnote.q, so does embedding markdown in q,
code, and embedding q code in markdown code block
