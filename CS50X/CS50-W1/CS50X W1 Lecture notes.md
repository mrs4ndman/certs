- Source code is the code the programmers write for the computer to interpret.

- Binary is how the computer generally understands, so, in contrast to the source code humans write, *machine* code is the type of code that computers understand directly, without translation.

- The programs that translates source code to machine code is the compiler. 
- Correctness, design, style are aspects of coding that matter to the end result and one should aspire to them, they are characteristics that should be part of code.

- Insert example on [here](https://vscode.cs50.io) for hello.c
```C
#include <stdio.h>

int main(void)
{
	printf("Hello, World \n");
}
```
- In order to do the example outside of VSCode or the online sandbox, we need to chmod +x the .c file and do make \<name-of-file> in order for it to compile into an executable (by default named after the .c file) and then execute the file.

- Example comparing say (Scratch) to print / printf (C).
	- Printf = Print Formatted
	-  \\n = Escape sequence on many programming languages


- Explanation for `#include <stdio.h>`:  The program, which uses the `printf` function, will usually require libraries to run those functions.
	- \*.h files are header files for libraries which contain enough information about the functions that are part of the aforementioned library.
	- In C, any time you want to print anything to the screen, you need to include the header for the "stdio" library (`"stdio.h"`).
- The cs50.h library (in the virtual environment) allows us to use a superset of functions introduced in the course:
```C
#include <cs50.h>
#include <stdio.h>

int main(void)
{
	string answer = get_string("What's your name? ");
	printf("Hello, %s\n", answer)
}
```
- The placeholder for a string in `printf` is "**%s**", that tells the function to plug in a string into its place.
	- When we exit out the quotes, we can state a variable ( in this case the previously inputted string ) to be used in place of the "%s" placeholder (:O), giving us a function output that varies on user input.
- A variation for inputting 2 strings (requires 2 different placeholders on the `printf` line):
```C
int main(void)
{
	string first = get_string("What's your first name? ");
	string last = get_string("What's your last name? ");
	printf("Hello, %s %s\n", first, last);
}
```

- If, for some reason, you need to use a percent sign inside of a prompt message ( or as an addition to user input ), a double percentage sign would do the trick:
  ```C
  int main(void)
  {
  printf("I got a 100%%\n");
  }
  ```
- `Printf` will parse the variables from left to right, and the first variable will be represented by the first placeholder, the second by the second, and so on, but the important thing is ordering and how the `printf` parser works in this case.
- **%s**, as a placeholder, is what is called a **FORMAT CODE**, which is a special type of code that, depending on the function, allows for special formatting of input or output taken or given respectively. In this case, **%s** will hold the space it represents for a string defined previously in the function.

## C Data types:
- The "primitive" data types for C:
	- bool
	- char
	- double
	- float
	- int
	- long
	- string
	- ... (Other less general data types)

## C Conditionals:
- Conditionals in Scratch are very literally represented. In C, it looks like the following (Scratch example shows `if x < y`):
```C
if (x < y)
{
//Insert execution for condition here
}
```
	When using conditionals, you should generally place a space in between the condition statement and the condition equation written after. However, when working with functions such as printf or get_string, no space is required (if present, may lead to problems on compilation or desired execution).

- Curly braces ( { } ) represent what the conditional will process if (in this case) the condition is met.
- Else representation on conditionals: It requires the `else` keyword and the respective curly braces.
```C
 #include <stdio.h>
 #include <cs50.h>

if (x < y)
{
	printf("x is less than y\n");
}
else {
	printf("x is not less than y\n");
}
```
- If you were to do a bare "`if x = y`" statement, the parser would take both `x` and `y` as variable declarations (which haven't obviously been initialised). For that matter, a double equals sign is used to override the variable parsing compiler quirk:
```C
#include <stdio.h>
#include <cs50.h>

int main(void)
{
int x = get_int("What's the value for x?");
int y = get_int("What's the value for y?");

if (x < y)
	{
		printf("x is less than y\n");
	}
	else if (x > y)
	{
		printf("x is greater than y\n");
	}
	else (x == y) // goes to just else, without the operation
	{
		printf("x is equal to y\n");
	}
	
}
```

- In a nutshell, equality of strings, booleans or integers is evaluated by the double equal ("*Is the value on the left equal to the one on the right?*").
	- In the previous example, the third statement could be optimised by removing the else `if` evaluation, because we have logically reduced the value options to neither greater nor less than, and that leaves us with equality, leaving the else behind.

- In this case, we also declare, inside the `int main(void)` function, the variables that the `if / else` statements are using later in the code compilation and execution states.



## Characters / Chars
- agree.c example:
```C
#include <cs50.h>
#include <stdio.h>

int main(void)
{
    char c = get_char("Do you agree? ");

    if (c == 'y')
    {
        printf("Agreed.\n");
    }
    else if (c == 'n')
    {
        printf("Not agreed.\n");
    }
}
```


When dealing with strings or any amount of input / output that is more than one character, double quotes ( " " ) are used, while, for example, when managing chars, single quotes ( ' ' ) are used.

After conditional statements, semicolons ( ; ) are not used, but after other statements, like variables and nested functions, the compiler in C usually requires them.

Improvement of code by adding casing possibility to the user input:
```C
#include <cs50.h>
#include <stdio.h>

int main(void)
{
    char c = get_char("Do you agree? ");

    if (c == 'y' || c == 'Y')
    {
        printf("Agreed.\n");
    }
    else if (c == 'n' || c == 'N')
    {
        printf("Not agreed.\n");
    }
}
```


## Variables


- Initializing variables is done with the following syntax:
```C
counter = 0;
```

Where counter is the variable name, and it has a starting value of 0, which can be fixed or modified later in the code. The semicolon ends the statement.

Iterating when called: to iterate the variable, better said, to add to the variable itself, this syntax ensues:
```C
counter = counter + 1;
```

**Only when creating / initializing a variable do we define the type of data it is going to hold**
There is no need to re-state it on iteration or other declarations of the same variable.

Shortening the previous example using C syntax is possible, with this:
```C
counter += 1;
```

It ups its value when called. ;)
Even shorter declaration:
```C
counter++;
```

Substraction: 3 ways, each shorter than the previous
```C
counter = counter - 1;
```
```C
counter -= 1;
```
```C
counter--;
```

It drops the int variable value by 1 (or the declared amount in the first 2) each time it is called / executed


## Loops:
- meow.c flawed example: 
```C
#include <stdio.h>

int main(void)
{
    printf("meow\n");
    printf("meow\n");
    printf("meow\n");
}
```

Using loops, and the previous counter statements:
```C
int count = 5;
while (count > 0)
{
	printf("meow\n");
	count--;
}
```

In another way:
```C
int main(void)
{
	int i = 0;
	while (i < 3)
	{
		printf("eepy\n");
		i++
	}
}
```

Using "for" instead of "while":

```C
for (int i = 0; i < 3; i++)
{
// Insert your code here
}
```
	 What this for loop does is it condensates all the logic for iteration on the same line as the word "for" statement; it initialises "i" as an int variable, it sets the condition that the "for" loops works out, and then the action that will take place as long as the condition is fulfilled

Curiously, you don't need to add a semicolon to the end of "`i++`" because it is the end of the for declaration, and the beginning of the contents of the conditional loop.

- ### Forever loop in C vs Scratch:
The most common way to declare a "forever" / continuous execution loop in C is the `while (true)` statement:
```C
while (true)
{
// meow 4ever
printf("meow\n");
}
```

`while (1)` is also an example of how to state that something is always on or active (binary value for up / active)

The `true` and `false` keywords are reserved for the boolean statements, and commonly need to be included as a separate library like this:
```C
#include <stdbool.h>
// more libraries / code would follow
```

The loop above can be canceled in the CS50 environment with Ctrl + C


### ASCII art rendering:
First example of row:
```C
include <stdio.h>

int main(void)
{
	for (int i = 0; i < 4; i++)
	{
		printf("?");
	};
	printf("\n");
}
```

First example of columns:
```C
int main(void)
{
	for (int i = 0; i < 4; i++)
	{
		printf("#\n");
	};
}
```

Combining rows and columns:
int main(void)
```C
int main(void)
{
	for (int rows = 0; rows < 3; i++)
		for (int columns = 0; columns < 3; i++)
		{
			printf("#");
		};
		printf("\n");
}
```

When iterating, you might want to make, like in this case, the number of rows and columns fixed (to render squares). In that case, making a constant inside our program can be helpful, using the `const <data-type> = "value"`

```C
int main(void)
{
	const int n = 5
	for (int rows = 0; rows < n; i++)
		for (int columns = 0; columns < n; i++)
		{
			printf("#");
		};
		printf("\n");
}
```

We now substitute the value to iterate up to to be "n" (be it 5 or 300), and it changes in both rows and columns.

Example: Prompting the user for the gridsize ->
```C
#include <cs50.h>
#include <stdio.h>

int main(void)
{
    const int n = get_int("Size of the grid: ");
    for (int rows = 0; rows < n; rows++)
    {
        for (int columns = 0; columns < n; columns++)
        {
            printf("#");
        }
        printf("\n");
    }
}
```

- Iteration with a do-while loop for checking if user input is abnormal
```C
#include <cs50.h>
#include <stdio.h>

int main(void)
{
	int n;
	do
	{
	n = get_int("Size: ");
	}
	while (n < 1);
	
    for (int rows = 0; rows < n; rows++)
    {
        for (int columns = 0; columns < n; columns++)
        {
            printf("#");
        }
        printf("\n");
    }
}
```


Example with the do-while loop and comments:
```C
int main(void)
{
// initialize the variable for user grid input
int n;
do
{ // user input
n = get_int("Size: ");
}

// checking if n is 0 or negative and reject if so
while (n < 1);

// row iteration
for (int rows = 0; rows < n; rows++)
{
// column iteration
	for (int columns = 0; columns < n; columns++)
		{
			printf("#");
		}
// what differences columns from rows
	printf("\n");
	}
}
```


### Return values:
You can make a function return its value at the end of its execution, and pass it on to other functions / functions that are nesting the returning function.

The `void` statement when declaring an int or a function means that it will not return a value, examples:
```C
int get_size(void)
{
// code goes here
}
```
	This example means that the int get_size will not take in anything of its outside to generate the output

```C
void print_grid(int)
{
// code goes here
}
```
	This means that the function itself will not give in execution a return value

`(int var)` in the example and in C syntax, means that `print_grid` will import the variable "var" with data type "integer / int"

First cool example of abstraction:
```C
int main(void)
{
int n = get_size(n);

print_grid(n);
}
  
void get_size(int)
{
// initialize the variable for user grid input
int n;

do
{ // user input
n = get_int("Size: ");
}

// checking if n is 0 or negative and reject if so
while (n < 1);
  
// returning the grid size
return n;
}


void print_grid(int size)
{
	for (int i = 0; i < size; i++)
	{
		for (int j = 0; j < size; j++)
		{
			printf("#");
		}
		printf("\n");
	}
}
```

This code WILL NOT RUN, why?

**THE CUSTOM FUNCTIONS / INTS NEED TO BE INITIALISED :p**

Here is the solved example:
```C
#include <cs50.h>
#include <stdio.h>

int get_size(void);
void print_grid(int size);

int main(void)
{
int n = get_size(n);

print_grid(n);
}
  
int get_size(void)
{
// initialize the variable for user grid input
int n;

do
{ // user input
n = get_int("Size: ");
}

// checking if n is 0 or negative and reject if so
while (n < 1);
  
// returning the grid size
return n;
}


void print_grid(int size)
{
	for (int i = 0; i < size; i++)
	{
		for (int j = 0; j < size; j++)
		{
			printf("#");
		}
		printf("\n");
	}
}
```

#### Explanation:
- Including the int ... and void ... followed by a semi-colon at the beginning of the file tells the compiler that the functions are declared elsewhere, so they get **initialised** at the start and filled with operations / statements later on in the compilation stage.


## Operators:

Example:
```C
#include <cs50.h>
#include <stdio.h>
  
int main(void)
{
	int x = get_int("x: ");
	int y = get_int("y: ");
	
	printf("%i\n", x + y);
}
```

In this case, `%i` means that printf (scanf in the future) will treat the value/s that you pass on to it as integers.

It appears that `x + y` is read by printf as a single value, and operated and output as such

In this simple calculator, `x` and `y` have a **maximum** number to be assigned to operate. 
If inputted 2.000.000.000 as X and the same as Y, the program outputs -294967296 ??

Explanation: C uses normally 32 bits, which give the possibility of representing as highest number: 4.294.967.295, as a positive number, and, to represent negatives, we take a bit off the 32, which cuts the max number in half and leaves us with: 2.147.483.647 (2 billion).

If we operate over this limit of bits, we encounter an "integer overflow". To overcome this in C, there is a type called "long", which amounts, depending on the platform, to more than 32 bits (64 in the case of the CS50 environment).

If we modify the previous calculator to use longs:
```C
#include <cs50.h>
#include <stdio.h>

int main(void)
{
	long x = get_long("x: ");
	long y = get_long("y: ");

	printf("%li\n", x + y);
}
```
	"%li" means that printf should treat its input as a Long Integer (li), while the variables are initialsed with "long" instead of "int"

- `get_long` is also part of CS50's C library and behaves in the same way as the previous `get_int`, but allows larger size strings to be input and processed in the program

- A long can reach up to 9223372036854775807 ( 5 quintillion !! )

- Let's try to divide, but this may trigger **truncation**:
```C
#include <cs50.h>
#include <stdio.h>
  
int main(void)
{
long x = get_long("x: ");
long y = get_long("y: ");
  
printf("%li\n", x / y);
}
```

If the division of 2 integers is supposed to give me a fraction, a decimal value, we can't use ints or longs to represent the result of said operation.

That is where **floats** come in: they add support for representing and storing decimal points in C and most programming languages

In C, the `printf` format codes so far are:
- `%s` for strings
- `%c` for chars
- `%i` for basic integers
- `%li` for "longs"
- `%f` for "floats" or floating point integers

The modified code that allows the calculator to store and represent decimals / floating point numbers is the following:
```C
#include <cs50.h>
#include <stdio.h>

int main(void)
{
	long x = get_long("x: ");
	long y = get_long("y: ");
	
	float z = x / y;
	printf("%f\n", z);
}
```

However, when compiling and running this, we get the result of `1 / 3` to be 0.000000, which is weird and also wrong :/

**Truncation** is what is happening in the example above, because the C compiler is treating both `x` and `y` as long `int`s, and the division of 2 long ints will output an `int`, doesn't matter if the output variable is typed as a `float`

What we can do to operate the 2 long integers `x` and `y` as floats is to **type-cast** them into another data / variable type: a float.
The C syntax for doing so goes like this:
```C
// Old example
{
	long x = get_long("x: ");
	long y = get_long("y: ");
	
	float z = x / y;
	printf("%f\n", z);
}

// Type-casted variables
{
	long x = get_long("x: ");
	long y = get_long("y: ");
	
	float z = (float) x / (float) y;
	printf("%f\n", z);
}
```

The compilation and execution output of the new type casting + the operation of `1 / 3` actually outputs a float / decimal number: 0.333333

This finite number of decimals may be interpreted as another issue: **floating-point imprecision**

`%f` gives us a default of 6 numbers after the operational "comma" / floating point calculated.
To override it, we use the following syntax:
```C
printf("%.9f\n", z);
```
	We should replace 9 with the desired number of decimals to obtain from the calculation

We can solve floating-point imprecision up to a certain point, in which the computer runs out of memory for precise operation and the inconsistencies on division come in.
This, luckily, can be solved with another data type, that follows the same principle as the `long`, the **double**

#### Double: The bigger "float"

Because a `float`, in similar fashion to an int, has a max size of 32 bits, the **double** works very similarly to the `long`, and both have a common size of 64 bits (mostly uniform across systems)

The previous code example with floats can be improved by replacing them with the new `double` data type:
```C
#include <cs50.h>
#include <stdio.h>

int main(void)
{
	long x = get_long("x: ");
	long y = get_long("y: ");
	
	double z = (double) x / (double) y;
	printf("%.20f\n", z);
}
```

The decimal calculation imprecision has to be taken into account when treating with decimals, as it is a real-world limitation when managing these data types in C

> Insert here Y2K Unix time paradox for the 32-bit integer for representing time from Jan 1st 1970

> End of W1 Lecture > Shorts > Problem