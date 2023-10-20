RUNNR:-
    runnr is an open-source command line interface tool for building, compiling & executing different programs & files.
    A single powerfull tool for developers to compile, open, build & interpret different programs.


:: How to use?

[1] CONFIG:
    >> runnr is currently in Alpha stages, most of the final features aren't available yet.
      Current features are given below.

    >> Before starting compiling & executing anything, lets take a look at runnr.conf file present at:
        Windows: C:\runnr\runnr.conf
        Unix: ~\.config\runnr.conf
      after installation.

      This runnr.conf is the main config file that runnr use to execute commands based on file-extension. Once the 
      configuration is set for any file-extension runnr can execute and run it without any problem. As runnr is a 
      config file based tool, it is very easy to use the same config file in different system after only setting 
      it up once. 

    >> Syntax of the config file:
      Now lets see how to configure this config file. The syntax is really easy:-
        (<extension>) :: <arguemnt1> = "<parameter1>",  <arguemnt2> = "<parameter2>", ....

      All <argument> = <parameter> are separateed using ','. You can even comment in this config file using '#'. White Spaces 
      are ignored automatically.

      Now lets see some example:

      #for adding support for .c files, we simply can:-
      (.c) :: COMPILER = "gcc", OUTPUT_FILENAME = "$FILE"

      As you can see we first put the extension of the file, then its command then the execution-type. 
      What is execution-type?
      : As we know there are two types of languages compiled & interpreted, so distinguish between then we need to 
      state the execution-type.

      'COMPILER' for compiled, 'INTERPRETER' for interpreted

    >> For example to add support for javascript file execution:
      (.js) :: INTERPRETER="node", OUTPUT_FILENAME="$NONE"



[2] CLI TOOL:

    >> Now lets see how to interact with the runnr tool:
        For Windows user, after installation restart your terminal to make the ENVIORMENT VARIABLE changes.

        First lets see if it installed or not? : Simply Type-
        runnr --version
        OUTPUT: v1.x.x

        {If runnr is not found then please check you ENVIORMENT paths & variables, try restarting or reinstalling the 
        runnr.}

        Now if it is installed correctly, lets proceed with its usages:

        1. Comiling or Interpreting directly:
            runnr can compile or interpret different programs based on extensions from runnr.conf file. Now lets see some
            example.
            Suppose we have hello.py & hello.cpp file with "Hello, World\n" printing program.
            Then to run this files:

            runnr hello.py
            OUTPUT: Hello, World

            runnr hello.cpp
            OUTPUT: Hello, World

            It can execute both the different files based on .conf file.

        ==============================================================

        2. Only compiling not executing:
            We can make runnr only compile programs but not execute it by using '-run' argument.
            Example:

            runnr -run N hello.cpp
            OUTPUT: 

            By passing parameter N for argument -run it only compiles it but doesn't execute it. This 
            argument only works for compiled based programs like C, C++.
            The -run argument parameter can be either Y or N.

        ==============================================================

        3. Custom output file name for Compiled programs:
            We can make runnr to output the compiled executable file-name as we want it to be instead 
            of a.exe or a.output
            Example:
            A. 
                runnr -run N -out hello hello.cpp
                OUTPUT:

                ./hello
                OUTPUT: Hello, World

            B.
                runnr -out hello hello.cpp
                OUTPUT: Hello, World

            Yes, we can use these different arguments and parameters all together.
            So, -out argument takes only one parameter that is the file name of the output file.

        ==============================================================

        4. More compiler arguments:
            There may be some cases where we need to pass more compiler arguemnts to compile it. For example, in C++ 
            we might need to tell the compiler to use C++11, as we have used 'auto; data-type in out program. 

            This can be achieved by two ways:
            A. Using config if you paramanently want to use a minimum version:
                Open runnr.conf
                For example in C++ case modify:
                ".cpp > g++ > c" TO ".cpp> g++ -std=c++11 > c"
                
                And thats it!

            B. Using -param arguemnts to pass more compiler parameters for a certain file:
                Example:
                runnr -param "-std=c++11" -out hello hello.cpp
                OUTPUT: Hello, World

                -param takes the compiler arguemnt directly and pass it to the compiler. It is a good practice to 
                 wrap them in "".
                -param can also be used to link to libaries too.

                Example:
                runnr -run N -param -lm -out sqrt sqrt.c 

        ==============================================================

        5. Execuable file's command-line arguemnts:
            You might write some programs that takes command line arguments directly, as runnr can compile and execute 
            simultaneously, you might want to pass the necessary arguments to the program. This can be achieved by 
            using -args,

            Suppose we have written a program which takes 2 number directly from command line like ./a.exe 5 7 & 
            outputs its sum. Lets see how to do that with runnr.

            Example:
            runnr -args "5 7" sum.c
            OUTPUT: SUM: 12

            Again it is necessary to wrap the arguemnts within "" as it containes spaces.

        ==============================================================

        6. Sometimes developers need to see what actually getting executed by runnr to find any error or mis-compilation 
            of programs & executions.
            To solve this a particular flag is to be used called '-debug'. Why is it called flag? because it doesn't 
            takes any arguments.

            Lets see how to use it.

            Example:
            runnr -debug -out hello hello.cpp
            OUTPUT: runnr: debug: config: using config from /Users/aniket/.config/runnr.conf
            OUTPUT: runnr: debug: executed: g++ hello.cpp -o hello
            OUTPUT: runnr: debug: run: ./hello
            OUTPUT: Hello, World

            As you can see, the runnr gives you a detailed output of the underneath commands execution.

        ==============================================================

        7. Checking verion of runnr:

            Example:
            runnr --version OR runnr -v 
            OUTPUT: vx.x.x


:: Important Notes:

        [IMPORTANT]>EX: As you can see through out the example we enter the file-name at the end & all the arguments, 
        parameters & flags before it. It is a fixed rule. You have to enter all the arguemnts and there parameters, 
        flags before the file name. As of now runnr only supports one file at a time, though you can use -param to 
        throw more file to link.

        RULE FOR ARGUMENTS & PARAMETERS: 
        Always sepcify the argument first, like -run, -out then its argument separated with space like Y, hello.
        -<argumnet> <parameter>
        -run Y
        -out hello

        You can put different argument-parameter pair in any order before file name.
        EXAMPLE:
        runnr -debug -out hello hello.c 
        runnr -out hello -debug hello.C

        ^^ BOTH ARE SAME

        **AND FILE NAME AT LAST
