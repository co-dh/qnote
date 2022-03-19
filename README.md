~~~q
f:{x+1}
wrap:{"|",x,"|"};
header:{wrap "|" sv string cols x}
body:{"\n", "\n" sv wrap each "|" sv/:string flip value flip x}
separator:{"\n", wrap "|" sv enlist each count[cols t] # "-"}
~~~
# Poor man's notebook for Q programming language

Given a Q file with a \ (on a single line without space) started comment block at the end of file, and Markdown inside the
comment, it will generated a Markdown file from it:
* The file is a legitimate Q file
* Put q code at the beginning
* Markdown start with a line with single slash \
* q code inside ~~~q block will be executed, and results will be put inside markdown's **code block**
* q coed inside ```q blcok will be executed, and results will be put into **markdown** directly, so you
can generate markdown from Q.

## Basic Example:
    ~~~q
        show f 1
    ~~~
Will generate
~~~q
    show f 1
2
~~~

## Example usage header, body, separator functions
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
```q
   -1@header[t] ,separator[t], body t;
```
|a|b|
|-|-|
|1|c|
|2|d|

