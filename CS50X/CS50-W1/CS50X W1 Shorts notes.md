## 1. Data types
- C is a much more detailed language when it comes to data types, as many modern programming languages do not have explicit type declaration as a requirement when coding with them

- C's built-in data types:
	- `int`: Integer values always take up 4 bytes / 32 bits of memory
	  
	- `unsigned`: *unsigned* is a **qualifier** that can be applied to certain types (including `int`), which effectively doubles the positive range of variables of that type, at the cost of disallowing any negative values.
		- The logic behind it is that the unsigned "flag" *per se* gets rid of the sign-defining bit, and uses it for more numbers, allowing double the range but only on the positive spectrum of numbers
		- There are also other qualifiers, such as `long`, `short` and `const`
		  
	- `char`: The char data type is used for variables that will store single characters
		- Characters always take up 1 byte of memory. ASCII mappings take care of assigning the positive spectrum of the 8-bit values to almost all characters
		  
	- `float`: The float data type is used for variables that will store floating-point values, AKA *real numbers*,
		- In the same way as *ints*, they take up 4 bytes of memory.
		- The range of a float depends on the length of the integer part of it in relation to the 32-bit total: The less integer it is, the more bits it can allocate to representing the floating-point part.
		  
	- `double`: The double data type is used for variables that will store floating-point values, the **difference** is that they are *theoretically double precision*, because of the 8 bytes / 64 bits they take up in memory.
		- They generally allow for bigger int parts inside a more precise *real* number representation
		  
	- `void`: *void* is a type, but not a *data type*
		- Functions can have a `void` return type, which just means they don't return a value.
		- The parameter list of a function can also be `void`. It simply means the function takes in no parameters.
		- `void`, for now, is more like a placeholder for "nothing" (as a simple definition, it is obviously much more than that).
		  
	- `int`, `char`, `float`, `double` and `void` are the five **primary** types we will encounter in C.
		- In CS50, we also provide you with two additional types that will probably come in handy:
		  
	- `bool`: The `bool` data type is used for variables that will store a Boolean value. With more precision, they are only capable of storing one of two values: either *true* or *false*.
	  
	- `string`: The string data type is used for variables that will store a series of characters, which programmers typically call a *string*.
		- Strings include things such as words, sentences, paragraphs and the like.
		  
	- Later on in the course we'll also encounter structures (`structs`) and defined types (`typedefs`) that afford great flexibility in creating data types you need for your programs.
	  
	  
- #### Creating a variable:
	- To bring a variable into existence, you need to specify the data type of the variable and give it a name:
	```C
	int number;
	char letter;
	```
	- If you wish to create multiple variables of the same type (and initialise them together), you can specify the type name **once**, and then list as many variables of that type as you want:
	```C
	int height, width;
	float sqrt2, sqrt3, pi;
	```
	 - In general, it's **good practice** to **only declare variables when you need them**

- #### Using a variable:
	- After a variable has been *declared*, it's no longer necessary to specify that variable's type. (In fact, doing so has some unintended consequences!)
	```C
	int number; // declaration 
	number = 17; // assignment
	char letter; // declaration
	letter = 'H'; // assignment
	```
	 - If you are simultaneously declaring and setting the value of a variable (sometimes called ***initialising***), you can consolidate this to a single step:
	```C
	int number = 17; // declaration + assignment = initialisation
	char letter = 'H'; // declaration + assignment = initialisation
	```
 

## 2. Operators

- The first operator we have technically used is equals (` = `), the **assignment operator**, which allows us to put a value into a variable.
- ### Arithmetic operators:
	- In C we can add (`+`), subtract (`-`), multiply (`*`) and divide (`/`) numbers, as expected:
	```C
	int x = y + 1;
	x = x * 5;
	```
	 
	 - We also have the modulus operator (`%`), which gives us the remainder when the remainder ("resto") of a division operation between the number on the left of it and the number on the right of it:
	```C
	int m = 13 % 4; // m is the remainder of the operation, 1
	```
	
	- C also provides a shorthand way to apply an arithmetic operator to a single variable.
	```C
x = x * 5 // The long way
x *= 5 // The shorthand way to eval x to be 5 times the previous value
	```
	
	 - This trick works with all five basic arithmetic operators. C provides a further shorthand for incrementing or decrementing a variable by 1:
	```C
	x++; // Increments x by 1 on execution
	y--; // Decrements y by 1 on execution
	```

- ### Boolean Expressions:
	- Boolean expressions are used in C for comparing values.
	 
	- All Boolean expressions in C evaluate to one of two possible values - `true` or `false`.
	  
	- We can use the result of evaluating a Boolean expression in other programming constructs, such as deciding which branch in a conditional to take, or determining whether a *loop* should continue to run.
	
	- Sometimes when working with boolean expressions we will use variables of type `bool`, but we don't have to necessarily.
	 
	- In C, *ever*y non-zero value is equivalent to `true`, and zero is `false`.
	 
	- Two main types of boolean expressions are:
		- *Logical operators*
		- *Relational operators*
	
	- Logical operators:
		 - Logical AND (`&&`) is true if and only both operands are true, other wise false
		 - Logical OR (`||`) is true if and only **at least one** of the operands is true, otherwise false
		 - Logical NOT (`!`) inverts the value of its operand:
	```C
	if x = true; then
	!x = false;
	```
	- Relational operators: These behave as you would expect them to, and appear syntactically similar to how you may recall them from elementary arithmetic:
		```C
		x < y; // Less than
		x <= y; // Less than or equal to 
		x > y; // Greater than
		x >= y; // Greater than or equal to
	```
		 - C can also test two variables for equality and inequality:
		```C
		x == y; // Equality
		x != y; // Inequality
		```
		- Be careful! It's a **common mistake** to use the **assignment operator**
		  (` = `) when you intend to use the equality operator (` == `).


## 3. Conditional statements
- Conditional expressions allow your programs to make decisions and take diferent forks in the road, depending on the values of variables or user input

- C provides a few different ways to implement conditional expressions (also known as *branches*) in your programs, some of which look familiar from Scratch and other programming languages

- **if** statements:
	 ```C
	if (boolean-expression)
	{
	// Code goes here
	}
	``` 
	- If the *boolean-expression* evaluates to `true`, all lines of code between the curly braces will execute in order from top-to-bottom
	- If the *boolean-expression* evaluates to `false`, those lines of code will not execute

- **if-else** statements: 
	```C
	if (boolean-expression)
	{
	// Code goes here
	}
	else
	{
	// Code goes here
	}
	```
	- If the **boolean-expression** evaluates to `true`, all lines of code between the first set of curly braces will execute in order from top-to-bottom.
	- If the **boolean-expresion** evaluates to `false`, all lines of code between the second set of curly braces will execute in order from top-to-bottom.
	- **if-else** statements can also be nested, creating a chain in which each "branch" is mutually exclusive:
	```C
	if (boolean-expr1)
	{
		// first branch
	}
	else if (boolean-expr2)
	{
		// second branch
	}
	else if (boolean-expr3)
	{
		// third branch
	}
	else if (boolean-expr4)
	{
		// fourth branch
	}
	```
	- You can also create a chain of non-mutually exclusive branches:
	```C
	if (boolean-expr1)
	{
		// first branch
	}
	if (boolean-expr2)
	{
		// second branch
	}
	if (boolean-expr3)
	{
		// third branch
	}
	else if (boolean-expr4)
	{
		// fourth branch
	}
	```
	- In this example, only the third and fourth branches are mutually exclusive. The `else` binds to the nearest `if` only.
	  
- `switch` statements: C's `switch()` statement is a conditional statement that permits enumeration of discrete cases, instead of relying on boolean expressions.
	- It's importatnt to `break;` between each case, or you will "fall through" each case (unless that is desired behavior)
	```C
	int x = get_int();
	switch(x)
	{
	case 1:
		printf("One!\n");
		break;
	case 2:
		printf("Two!\n");
		break;
	case 3:
		printf("Three!\n");
		break;
	case 4:
		printf("Four!\n");
		break;
	}
	```
	- You could invert the count (make it from 4 or 5 to 1) and eliminate the `break;` statements to make a sort of simple countdown that the user can specify the top starting number with the `x` variable.
	   
- The ternary operator: These two snippets of code act identically.
```C
int x;
if (expr)
{
	x = 5;
}
else
{
	x = 6;
}
 ```
```C
int x = (expr) ? 5 : 6;
```
- The queastion mark (?) operator defines the first part of the **if-else** statement, meaning that the variable `x` will be set to 5, in this example..
	  - The colon (:) operator defines the `else` clause of the **if-else** statement, and defines the value to the one specified after it. 
- It is a cool way of making an **if-else** logic very short and simple, but it is not needed nor practical in some instances.
   
- ### Summary:
	- `if` (and `if-else / if-else ... if-else`)
		- Use Boolean expressions to make decisions
	- `switch`
		- Use discrete variable value cases to make decisions
	- `?:`
		- Use to replace a very simple `if-else` statement to make your code look fancy


## 4. Loops

- The "forever" / *infinite* loop:
	```C
	while (true)
	{
	// Code goes here
	}
	```
	 - This is what we call an *infinite* loop. The lines of code between the curly braces will execute repeatedly from top to bottom, until and unless we break out of it (as with a `break;` statement) or otherwise kill our program


- Not all loops are forever loops:

- Loops with other boolean expressions:
	```C
while (boolean-expr)
{
	// Code goes here
}
	```
	- If the `boolean-expr` evaluates to *true*, all lines of code between the curly braces will execute repeatedly, in order from top-to-bottom, until boolean-expr evaluates to *false*
	- Somewhat confusingly, the behaviour of the Scratch block is reversed, but it is the closest analog

- `do-while` loop: This loop will execute all lines of code between the curly braces once, AND THEN, **if the `boolean-expr` evaluates to *true***, will go back and repeat the do clause process, until the `boolean-expr` evaluates to *false* 
```C
do
{
	// Code goes herej
}
while (boolean-expr); // while the bool-expr evals to TRUE
```

- `for` loop: Syntactically unattractive, but for loops are used to repeat the body of a loop a specified number of times, in this example 9:
```C
for (int i = 0; i < 10; i++)
{
	// Code goes here
}
```
- The process undertaken in a `for` loop is:
	- The counter variable(s) (here, `i`) is / are set
	- The Boolean expression is checked:
		- If it evaluates to *true*, the body of the loop executes.
		- If it evaluates to *false*, the body of the loop does not execute.
	- The counter variable is modified (with an arithmetic operator), and then the boolean expression is checked again


 - A more complex `for` loop would look like this:
	 ```C
 for (start; expr; increment)
 {
	 // Code goes here
 }
	 ```
	- First, the statement(s) in *start* are executed
	- Second, the *expression* (*expr*) is checked
		- If it evaluates to `true`, the body of the loop executes
		- If it evaluates to `false`, the body of the loop does not execute.
	- The statement(s) in *increment* are executed, and then the *expr* is checked again, etc.

### Summary
- `while`: Use when you want a loop to repeat an unknown number of times, and possibly not at all
	
- `do-while`: Use when you want a loop to repeat an unknown number of times, but at least once
	- The difference is the minimum execution: `while` may not execute at all, meanwhile the `do-while` loop will do so at least once, until it evals its expression
	
- `for`: Use when you want a loop to repeat a discrete number of times, though you may not know the number at the moment the program is compiled


## 4. Magic numbers
- Numbers that need to be constant / fixed due to external limitations (23 rows in Mario's game) or physical limitations of pre-existing systems (52 cards in a card-dealing program) that needs to be fixed

- C provides a **preprocessor directive** (also called a **macro**) for creating symbolic constants.
	```C
#define NAME REPLACEMENT
	```
	 - At the time your program is compiled, `#define` goes through your code and replaces *NAME* with *REPLACEMENT*
	 - If `#include` is similar to copy/paste, then `#define` is analogous to find/replace
	```C
#define COURSE "CS50"
	```
	 - There is a non-written convention about `#define`'s casing, like in the examples, where it is upper-cased to avoid confusion and matching with variables used inside the program