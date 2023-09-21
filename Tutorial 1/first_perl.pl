=pod
Note: In Perl, you can create multiline comments using the =pod and =cut markers, 
which are often referred to as "pod" (Plain Old Documentation) comments. 
These comments are typically used for documentation purposes and can span multiple lines. 


---------------------------------- use strict -------------------------------------------
Use strict forces you to use variables.
Used to enforce stricter rules and practices in your code. 
It helps you write more robust and maintainable Perl programs 
by catching common mistakes and potential issues at compile-time rather than runtime.
When you use "strict," it enforces the following:

Variable declaration: You must declare your variables with "my," "our," or "state" before using them. 
This helps prevent accidental typos and scope issues.

Variable scoping: "strict" enforces variable scoping rules, 
ensuring that variables are used within their appropriate scopes (e.g., lexical vs. package).

Avoiding symbolic references: It discourages the use of symbolic references, 
which can lead to hard-to-debug code.

Using strict refs: This disallows the use of symbolic references altogether.

=cut
use strict;
# Provides a more verbose output to a program. 
# Helps in clearer identification of problems like uninitialized variables
use warnings;

# Defining a subroutine
sub main {
  print "Hello World";
}

# Calling the main function
main();
