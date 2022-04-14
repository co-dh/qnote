# Poor man's notebook for Q programming language

Given a Q file with a \ (on a single line without space) started comment block at the end of file, with next line
started with # and a space for Markdown level head, and Markdown inside the comment, it will generated a Markdown file
from it:

* The file is a legitimate Q file
* Put q code at the beginning
* Markdown start with a line with single slash \\, and # space on the next line.
* Switch to k mode is not supported. Use 0N! to display like k when needed.
* q code inside ~~~q block will be executed, and results will be put inside markdown's **code block**
* q coed inside ```q blcok will be executed, and results will be put into **markdown** directly, so you
can generate markdown from Q.

## Basic Example:
<pre>
    ~~~q
        show f 1
    ~~~
</pre>
Will generate
~~~q
    show f 1
2
~~~

## Example usage of header, body and separator functions
~~~q
   show t: ([] a: 1 2; b: `c`d)
a b
---
1 c
2 d
~~~
~~~q
   show header t
"|a|b|"
~~~
~~~q
   -1@body t;

|1|c|
|2|d|
~~~
~~~q
    show separator t
"\n|-|-|"
~~~

## Example: Generate markdown table from q

The following code can be used to generate a markdown table
<pre>
```q
   -1@header[t] ,separator[t], body t;
```
</pre>
Will generate

|a|b|
|-|-|
|1|c|
|2|d|

## Usage
This README.md is generated by qnote.q like below.
    
```bash
$ ./qnote.q README.q > README.md
```
For bigger example, please check https://github.com/co-dh/chess/blob/master/chess2.md and it's corresponding .q file

## Library Code
~~~q
f:{x+1}
wrap:{"|",x,"|"};
header:{wrap "|" sv string cols x}
body:{"\n", "\n" sv wrap each "|" sv/:string flip value flip x}
separator:{"\n", wrap "|" sv enlist each count[cols t] # "-"}
~~~
[^1] This file is generated by [qnote.q](https://github.com/co-dh/qnote)
