
# Poor man's notebook for Q programming language

A deadly simply notebook for Q. Given it a normal q script with Markdown in comments, it will run the code, print the
Markdown in comments, and output a Markdown for you.

## Normal Mode and Note Mode
 A script will be run in 2 modes: 
 
<dl> 
<dt>Normal Mode</dt>
    <dd> The script can be load by Q interpreter like normal script.</dd>
<dt>Note Mode</dt>
    <dd> Line comments will be print to stdout with leading slash removed. Block comment will be printed to stdout</dd>
</dl>

## Comments Are Handled in Note Mode As Below:
<dl>
<dt>Single Comment</dt>
    <dd> A line start with 1 slash will be print to stdout. You can put /~~~ around code block.
<dt>Block Comment</dt>
    <dd> A block start with a line that contains only a forward slash(/) , and end with a line contain
    only a backward slash(\). 
<dt>Double Comment</dt>
    <dd> A line start with 2 slash, a space, and valid q code. It will be executed in Note Mode.</dd>
</dl>

## Example

~~~q 
Show:{} / show function is empty in normal code
~~~
Show: show / but redefined in Note Mode.

~~~q
Show a:til 10
0 1 2 3 4 5 6 7 8 9
~~~




