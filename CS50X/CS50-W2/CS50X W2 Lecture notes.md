## Week 2: Arrays

- What is `make`? Make is a front-end for the *clang* compiler, a C language compiler
- We try to compile our program directly, with `clang hello.c`, using the Hello World example from W1.
	- When doing the previous command, we get no errors, but the process outputs a weird file called a.out (*assembly*.out) that is the output of a program when running *clang* by itself.

### 1. Command line arguments

- *clang* supports command line arguments before the input file, such as `-o <output file>` or `-l<name of library>` (which allows use to use *clang* with libraries such as the CS50 one).
- Most of the error messages when compiling the week 1 examples aren't really coming from `make`, but from `clang` itself compiling the program, because `make` is only responsible for automating for us the process of compiling the program.

### 2. Compilation

- The 4 main steps when creating a program using a compiled language:
	- #### Preprocessing:
		- In C, the hashtag, as a special symbol, marks the elements it precedes as the *so-called* **preprocessor directives**. For the compiler, and for us, that means that **everything marked with a hash** at the beginning should be **preprocessed**, that means that it is **analyzed before anything else happens** when processing the source file.
		```C
		#include <cs50.h>
		#include <stdio.h>
		
		// Code goes here
		```
		- When the processing starts, these 2 lines tell the compiler to include said libraries into the execution of our program. These files, in many cases, are not available directly through the editor, but rather included with the OS / compilation tool. Inside the CS50 environment, they are located, inside the filesystem, in the `/usr/include` directory, and all of them are of the structure `<header name>.h`.
		- The `#include` lines are a kind of "global" import / *find & replace* for the preprocessing of the file.
		- What the preprocesing stage of *clang*: it substitutes the "custom" / external function (and / or variable names), with the contents of the `.h` file that matches them.
		  
	- #### Compilation:
		- Confusingly called "compiling", this step of the process starts after the compiler (*\*bangs head against the wall\**) has finished preprocessing the main `.c` file and all the specified header files (invoked with `#include`).
		- The compilation stage, after importing and preprocessing the now all C syntax / code in your `.c` file, translates all of it to Assembly language
		  
		- The `.h` file introduces, in the preprocessing stage, the *prototypes* of the functions that get fully developed in the libraries' corresponding `.c` file.
		  
	- #### Assembling:
		- After the compilation, which translates the code from C to Assembly, the assembling stage starts
		- This stage converts Assembly, a already very esoteric and hard-to-understand language, into what the machines understand, **binary** code, composed of only zeroes and ones (0 & 1).
		  
	- ##### Extra step!
		- This process of preprocessing, compilation and assembling that the compiler does is repeated for the library implementations of the header files, because, somewhere inside the libraries, exists a cs50.c file and a stdio.c / printf.c file (or whatever is used) that also go through preprocessing, compilation, and assembling, to get to the final state, binary.
		  
	- #### Linking: 
		- When preprocessing, compilation and assembling are done, the final and most esoteric step is **linking**. This is the action of bringing together and kind of *mushing* all the binary *blobs* of code that have been produced, into a single **executable file**. Using make, this file took the name of **hello**, but, in the default setting of *clang*, it was named `a.out`, or with the `-o` command line argument / flag, **whatever name we specified** for the final executable binary file / **blob** that constitutes the final stage of our program.


### 3. Reverse engineering

- In a similar way to compilation, the process of going from C + library code to binary / machine code can be reverted, but it obviously isn't perfect
	- For example, variable names, and many loops of the same type (like repetition or conditional loops) may not (and in some cases won't) retain either the functionality or the names that they had in the original source code that was later on reverse-engineered from machine code, because machine code usually doesn't retain that information, because it generally is irrelevant to the CPU.
	- Reverse engineering is a very time-consuming approach to "steal" / reproduce someone's product. If you're good enough to read and understand the messiness of decompiled code, you might be better off implementing the same solution in code yourself than trying to decrypt and reverse-engineer the existing machine code.


### 4. Debugging

- A bug in code can be logical or syntactical. Either way, the end result is that the **desired behaviour of the code isn't met**, and it doesn't "do" what you want it to do / process.
- There are tools that help the programmer in debugging:
	- Using `printf` to debug variable states at a certain point in the code, by making `printf` write out to `stdout` the contents of `x` variable to see if it is the desired value in a specific point in execution. `printf` can be our first diagnostic tool, and we can use it in a temporary way to debug some things and then get rid of the temp statement.
	- A debugger itself: In VS Code there is a debugger built in. It generally requires a configuration file for it to debug the code in the way we want it to, but in CS50 a preconfigured debugger is used:
		- In the gutter, to the left of the line numbers, we can click on the not very bright red dots to make them stand out: this sets up **breakpoints** in our code. For us, they are **visual indicators of the steps of debugging**, but for the debugger, it tells it to stop the code execution at that point and analyse how the execution is going at that exact point.
- There is also a special debugging technique called "**rubber duck debugging**". The idea is that: if you are battling some code with errors / unintended functionality in it, and the previous debugging attempts haven't got you very far, what is suggested is to **"talk" to the rubber duck about the exact problem you are having with your code**; it can be helpful to put out the problem, it can give you another perspective if you express it verbally, and allow you to realise the logical inaccuracy of the problem.

### 5. Arrays

- The data types are ways of telling the computer what will be stored inside the variable the type is associated to, like an integer, a character, a floating point value (like a real number), a char or even a string (of chars). Since computers only have finite amounts of resources, each type has a specific amount of bits / bytes predetermined for allocation in memory for each.
	- The more modern the computer, the larger these primitive data types have become, allowing more computational power to the programmer. Data type (& size) recap:
		 
		- A `bool` tends to occupy a whole byte, and, even though the `bool` state is either *true* (1) or *false* (0), for computers it is easier to allocate that byte than just a single bit
		  
		- An `int` typically uses up 4 bytes / 32 bits, which allows for 2 billion number representation for both the positive and negative spectrum, as well as, when *unsigned*, to reach the total of 4 billion possible values on just the positive spectrum.
		  
		- A `long` is double the size of an `int`, so it gives the possibility of counting up to a quintillion values, but you have to be careful about **integer overflow** when storing data / reading excessive data.
		  
		- A `float`, which is a real number, is an integer accompanied by the decimal section of the number, and the 4 bytes / 32 bits it occupies are split according to the size of the integer part, and then the size of the decimal part. Theoretically, there are 4 billion **permutations**, which does not allow to reach the supposed 4 billion in `int` terms (unless the decimal part is non-existent).
		  
		- A `double`, similar to the `long`, is "**double**" in size of a `float`, so 8 bytes / 64 bits, and allows for more precision, A.K.A representing the same number that a `float` would do but leaving even more room for either a bigger `int` section, or more number = more precision on the decimal side of things.
			- #### WARNING!
			   They can suffer from floating-point imprecision, caused by the computer not being capable of calculating and then outputting the calculated value inside a defined space, causing memory corruption / imprecision in the final part of the float's decimal section.
		- To fix floating-point imprecision, libraries with more capacity for floating-point calculation have been developed for C and many other languages.
		
		- A `char` represents, normally, an ASCII character, occupying a single byte in memory.
		  
		- The `string` is the most flexible out of the default / primitive C data types, because **it has no predefined size / allocation in memory**, making it very versatile when it comes to space optimization and user input acceptance.
		
		
	- If we theoretically split a memory chip into byte sections, by definition each section would be assigned a number: byte section 0, then byte section 1, 2 and so on.
	- If we use a char, a 1-byte-allocation variable, it *might* get stored, if we arrange the sections in a grid, in the **top-leftmost** part of the grid, because it would be the first allocated byte section.

#### Type manipulation and requirements

- Curiously, when doing an average of 3 integers and passing it into printf, with 3 separate values, the output might not be precise, because the average will probably be represented by truncating the practical float value into the value that `printf` outputs, an int. 
```C
		#include <stdio.h>
			
		int main(void)
		{
			int score1 = 72;
			int score2 = 73;
			int score3 = 33;
			
			printf("Average: %i\n", (score1 + score2 + score3 / 3));
		}
```
 
- This can be solved by either:
	1. Typecasting the average divider into a `float`: The division process now treats the three `int` variables as `floats` and operates with them as such. It also requires the `printf` placeholder to be `%f` for the float type number output.
	 
	```C
	printf("Average: %f\n", (score1 + score2 + score3 / 3));
	```
	 
	- 2. You could also explicitly convert / **typecast** the 3 into a float:
	 
	```C
		printf("Average: %f\n", (score1 + score2 + score3 / (float) 3);
	```


#### Array:

- **An array is a way of storing your data back-to-back-to-back in the computer's memory in such a way that you can access each individual member easily**
	- The way of **initialising and populating an array** is the following:
	```rust
		type varname[a];
	 
		varname[x] = valuex;
		varname[y] = valuey;
		varname[z] = valuez;
	```
		
	- In this example:
		- **type** is the **data type** that will be stored inside the array
		- **varname** is the **variable name** that will be assigned to the array, and what is later used to call in the **different storing entries** of said array
		- `valueletter` is the value that will be inputted to the array, and it will be of the type specified in the array initialisation.
	- The numbering **starts**, oddly enough, **at 0**, and it **cannot be changed**, by C language conventions.
	- The previous example implemented in an array type:
	- An example of declaring an `int` **array** that will store 3 different `ints`:
	```C
	int scores[3]; // Array initialisation and sizing
	
	scores[0] = 72; // We input the first variable on index nº 0
	scores[1] = 73; // We input the second variable on index nº 1
	scores[2] = 33; // We input the third variable on index nº 2
	
	printf("Average: %f\n", (scores[1] + scores[2] + scores[3]);
	```
		
	 - Implementing user input for the 3 scores:
		  
```C
#include <cs50.h>
	#include <stdio.h>
		
	int main(void)
	{
		int scores[3]; // Array initialisation and sizing
		
		scores[0] = 72; // First variable on index nº 0
		scores[1] = 73; // Second variable on index nº 1
		scores[2] = 33; // Third variable on index nº 2
		
		printf("Average: %f\n", (scores[1] + scores[2] + scores[3]) / (float) 3;
	}
```

- To apply iteration to the *score* program, this is the example:

```C
	int main(void)
	{
		int scores[3];
		for (int i = 0; i < 3; i++)
		{
			scores[i] = get_int("Score: ");
		}
		
		printf("Average: %f\n", (scores[0] + scores[1] + scores[2]) / (float) 3);
	}

```
- Arrays achieve memory unification, as the 3 index values for the `score` array are stored contiguously in memory, allowing for faster access and almost eliminating fragmentation of the different items stored in the memory stack.
	
	- To allow the array to vary in size without implying a value change inside the `int scores[x]` declaration and the `for` loop, we could use a *const* to implement it globally and use it wherever we want:
	```C
	const int N = 3;
	```
	
	- A way to abstract the code even further is to abstract the average with a function that takes in the values of the array and averages them.
	- This function is called average, and can be defined in the following way:
	```C
	#include <cs50.h>
	#include <stdio.h>
	
	const int N = 3;
	float average(int array[]);
	
	int main(void)
	{
		int scores[N];
		for (int i = 0; i < N; i++)
		{
			scores[i] = get_int("Score: ");
		}
	}
	
	printf("Average: %f\n", average(scores));
	
	float average(int array[])
	{
		int sum = 0;
		for (int i = 0; i < N; i++)
		{
			sum = sum + array[i]; 
		}
		return sum / (float) N;
	}
	```

### Chars
- Example:
```C
char c1 = 'H';
char c2 = 'I';
char c3 = '!';
```
- `Strings` get quoted with the double quotes, while `chars` get quoted with the single quotes.

### Strings
Example:
```C
string salute = "Hi!";
```
- **Strings are** literally **arrays of characters**; they are of variable sizes, so the byte size isn't determined. 
- They are composed of the array of chars itself, which allocates 1 byte for each char that the string is composed of.
	- They are also **delimited by an extra byte** which represents `\0` to allow differentiation of multiple concatenated strings in memory.
	- This means that strings actually occupy ín memory (**n + 1**) number of bytes, in which `n` is the number of chars that make up the string, and 1 is the **extra byte from delimiting** that is needed to mark the end of the string.
	- The byte that is sent as the delimiter of the string to the compiler is a special zero (hence the backslash `\` ), because it signals for that char to be a byte composed of 8 zeroes, the **null** expression in ASCII, the start of the specification.
	 
- Utilizing the fact that **strings are just arrays of characters / chars** in C, we can **decompose the string into an array and output / return select chars of said string**:
```C
#include <cs50.h>
#include <stdio.h>

int main(void)
{
// String declaration: It is taken in as 4 bytes: 3 chars + delim.
	string s = "HI!";
// String array gets split into chars and printed individually
	printf("%c%c%c\n", s[0], s[1], s[2])
}
```
- Curiously enough, because of the ASCII standard, when we tell `printf` to print out a char / string (a piece of text, per se), as an integer, `printf` actually returns the ASCII values for the corresponding chars of
```C
// String array gets split into chars and printed individually
	printf("%i%i%i\n", s[0], s[1], s[2], s[3])
}

// The output value of this printf statement inside the previous
// example would be "727333", 72 = H, 73 = I, and 33 = !
// This proves that letters can be numbers :P
```
- Additionally, we can manually reveal what is in the delimiter byte of the array, by stating the extra position on the array (3 in the example, past the 0 - 2 range with normal chars)

- Example that amplifies the importance of the delimiter character:
```C
{
    string s = "HI!";
    string t = "BYE!";
	
    printf("%s\n", s);
    printf("%s\n", s);
}
```
- With this "double" string output, the question arises: **Can we join two strings (2 arrays of chars) into a single special array, which is also a string?** 
	##### YES!
```C
#include <cs50.h>
#include <stdio.h>

int main(void)
{
	string words[2];
	
	words[0] = "HI!";
	words[1] = "BYE!";
	
	printf("%s\n", words[0]);
	printf("%s\n", words[1]);
}
```

- Now implementing the char splitting mechanism:
```C
{
	string words[2];
	
	words[0] = "HI!";
	words[1] = "BYE!";
	
	printf("%c%c%c\n", words[0][0], words[0][1], words[0][2]);
	printf("%c%c%c%c\n", words[1][0], words[1][1], words[1][2], words[1][3]);
}
```
- WOAH! There are two index definitions, **why?**
##### First thing: words is an array of strings itself
##### Second thing: The entries of the `words` array can be strings themselves
##### Third thing: `printf` doesn't care about the index numbers for the different chars, only if they are matched inside the "xxx\n" argument.
##### Fourth and last: `words[x][y]` is the position of the char:
- `x` is for the string to choose from the first string array
- `y` is for the char to choose from inside the first chosen string
- This is an interesting way of manipulating strings, because it uses a matrix principle to implement a very minute / precise way of outputting strings / chars with printf
- An interesting fact is that, while `printf` does take into account the `\n` or newline character, and stores it for its job, it does not have a representation in memory, as it is not represented for C / machine code in general, just for the `printf` implementation

- Arrays themselves do not have the delimiting `\n` escape characters. Strings however do have it. They are special compared to other data types

- C has evolved and has implemented, as a language, a library of **string-related functions** called `string.h`.

- Inside of the `string.h` library, there is a specific function called `strlen`, which, unambiguously, is used to **calculate a determined string's length** and return it as an integer.

- There are other libraries that can be useful when coding in C, such as the `ctypes.h` one, which implements many data-type-related functions and opens up even more possibilities

#### String manipulation
- We can use some of the functions included in the `string.h` library to manipulate strings in a specific way, like in this upper-casing example:
```C
#include <cs50.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
	// Initialising the string array
    string s = get_string("Before: ");
	// Making the prompt for the uppercase result
    printf("After:  ");
	// Iterating through each of the string (array) internal
	// position (chars) until the end
    for (int i = 0; i < strlen(s); i++)
    {
		// If the array position value is lowercase
        if (s[i] >= 'a' && s[i] <= 'z')
        {
			// Print the corresponding ASCII uppercase
            printf("%c", s[i] - 32);
        }
        else
        {
			// Print the inputted lowercase char
            printf("%c", s[i]);
        }
    }
    printf("\n");
}
```