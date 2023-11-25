#!/usr/bin/env q

     Copyright (c) 2022 Hao Deng
     In the first version of qnote.q, you need guard q code by  ~~~q and ~~~.
     In this version, you only need indented code block.

k)dedent:{d:&/+/'&\'" "=x:x@&~.q.trim[x]like ""; d _/:x}; ralign:{(-:|/#:'x)$/:x}
k)explain:{tc:.q.trim'|:'+(" /"\:)'dedent x; -1@({x," /",y,"\n\t",z}'[t;tc 1]) r:-3!' .:'"k)",/:t:ralign({y,x}\)tc[0];}
\c 15 500
fn: .z.x 0
system "l ",fn
allLines: read0 `$fn
slashIdx: where enlist["\\"] ~/: allLines
markDownStarts: first 1 + slashIdx where allLines[slashIdx+1] like\: "# *"
mdLines: markDownStarts _ allLines
row: 0; state: `NORMAL

Exec:{-1@"~~~q";-1@line;0 trim x;-1@"~~~"}

while[row<count mdLines
    ; s: trim line: mdLines[row]
    ; $[ (s like "```q") and state<>`PRE   ; state:`MDCODE /MDCODE do not out put the code into markdown
       ; (s like "```" ) and state=`MDCODE ; state:`NORMAL
       ; s like "<pre>" ; [state:`PRE   ; -1@line]
       ; s like "</pre>"; [state:`NORMAL; -1@line]
       ; state in `PRE;   -1@line
       ; state in `NORMAL; $[line like"    *";Exec line;-1@line]
       ; state = `MDCODE ; Exec s
       ]
     ; row+:1   
    ]   

-1@"## Library Code[^1]";
-1@"~~~q";
-1@/:(markDownStarts-2)#allLines;
-1@"~~~";

-1@"\n[^1]: This file is generated by [qnote2.q](https://github.com/co-dh/qnote)";
exit 0

\
Design Notes:

    The expect based version has some short comings: It can left some garbage log on the screen,
and need some sed magic. This version, I decide to use Q itself.
    Handling multiple line function will over-complicates qnote.q, so does embedding markdown in q,
code, and embedding q code in markdown code block