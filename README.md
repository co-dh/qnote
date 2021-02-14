
~~~q
~~~
# Poor man's notebook for Q programming language

A deadly simply notebook for Q. Given a normal q script with Markdown in comments, it will run the code, print the
Markdown in comments, and output a Markdown. Q code block in Markdown will also be executed.

## Example
~~~q
Show:{} / show function is empty in normal code
~~~
~~~q
Show: show / but redefined in comment of Markdown code blcok.
~~~
~~~q
Show a:til 10
0 1 2 3 4 5 6 7 8 9
~~~
## Usage
    See Makefile
~~~q


