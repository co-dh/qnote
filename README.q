f:{x+1}
wrap:{"|",x,"|"};
header:{wrap "|" sv string cols x}
body:{"\n", "\n" sv wrap each "|" sv/:string flip value flip x}
separator:{"\n", wrap "|" sv enlist each count[cols t] # "-"}
\
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
<pre>
    ~~~q
        show f 1
    ~~~
</pre>
Will generate
~~~q
    show f 1
~~~

## Example usage header, body, separator functions
~~~q
   show t: ([] a: 1 2; b: `c`d)
~~~
~~~q
   show header t
~~~
~~~q
   -1@body t;
~~~
~~~q
    show separator t
~~~

## Example: Generate markdown table from q

The following code can be used to generate a markdown table
<pre>
```q
   -1@header[t] ,separator[t], body t;
```
</pre>
```q
   -1@header[t] ,separator[t], body t;
```

