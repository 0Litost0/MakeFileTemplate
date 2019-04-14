
* [MakeFileTemplate](#MakeFileTemplate)
* [一、简介](#Brief)
    * [1.使用方法](#Instruction) 
* [ 二、FAQ](#FAQ)
    * [1. 是否需要在编译文件中，清晰展示依赖关系？](#FAQ_1) 
    * [2. 在makefile文件中添加宏定义的应用](#FAQ_2) 
    * [3. 关于模板的一些默认配置](#FAQ_2) 

* [三、参考与链接](#Reference&Links)
* [四、文档信息](#Info)

<h1 id="MakeFileTemplate">MakeFileTemplate</h1>  


<h2 id="Brief">一、简介</h2>  


&emsp;&emsp;该仓库旨在提供一个针对于小型的`C/C++`项目的`makefile`模板。使用该模板，能够实现一键编译，无需再编写繁琐的`makefile`文件。  
&emsp;&emsp;关于该makefile文件的工作过程中，在文件中都有一个详细的说明，可以参见该[文件](/makefile)。  

&emsp;&emsp;Github项目地址: [MakeFileTemplate][]  


<h3 id="Instruction">1.使用方法</h3>

&emsp;&emsp;为了方便了解该模板的实际功能，项目中附带一个具体的使用例程`Example`。接下来，将通过一个简单的例程，来讲解具体的使用方法：
- Step1  

&emsp;&emsp;创建一个空的项目目录（以`MakeFileTemplate`为例），并将[makefile](/makefile)放置在根目录下;至于具体的工程文件，包括相应的头文件以及源文件可以一股脑的丢在项目目录下。完成后的目录结构如下图所示：  

![工程目录结构](/Doc/Pic/Directory_Tree.png "工程目录结构")  

- Step2  
&emsp;&emsp;执行`make`命令，编译生成可执行文件,具体的执行过程，如下所示：  

```shell
$ make
makefile:14: SRCS is ./Example/Test_1/Src/Test_1.c ./Example/main.cpp ./Example/Test_2/Src/Test_2.cpp ./Example/Src/Func.c
makefile:15: OBJS is  ./Example/Test_1/Src/Test_1.o  ./Example/Src/Func.o  ./Example/main.o  ./Example/Test_2/Src/Test_2.o
makefile:24: INCLUDE_PATH is -I ./Doc -I ./Doc/Pic -I ./Example -I ./Example/Include -I ./Example/Test_1 -I ./Example/Test_1/Include -I ./Example/Test_1/Src -I ./Example/Test_2 -I ./Example/Test_2/Include -I ./Example/Test_2/Src -I ./Example/Src
makefile:30: TARGET is MakeFileTemplate
g++ -DDEBUG_TEST\(fmt,arg...\)=printf\(\"Litost_Cheng\ \"fmt,##arg\) -o Example/Test_1/Src/Test_1.o  -c Example/Test_1/Src/Test_1.c -g  -I ./Doc -I ./Doc/Pic -I ./Example -I ./Example/Include -I ./Example/Test_1 -I ./Example/Test_1/Include -I ./Example/Test_1/Src -I ./Example/Test_2 -I ./Example/Test_2/Include -I ./Example/Test_2/Src -I ./Example/Src
clang: warning: treating 'c' input as 'c++' when in C++ mode, this behavior is deprecated [-Wdeprecated]
Example/Test_1/Src/Test_1.c:5:1: warning: control reaches end of non-void function [-Wreturn-type]
}
^
1 warning generated.
g++ -DDEBUG_TEST\(fmt,arg...\)=printf\(\"Litost_Cheng\ \"fmt,##arg\) -o Example/Src/Func.o  -c Example/Src/Func.c -g  -I ./Doc -I ./Doc/Pic -I ./Example -I ./Example/Include -I ./Example/Test_1 -I ./Example/Test_1/Include -I ./Example/Test_1/Src -I ./Example/Test_2 -I ./Example/Test_2/Include -I ./Example/Test_2/Src -I ./Example/Src
clang: warning: treating 'c' input as 'c++' when in C++ mode, this behavior is deprecated [-Wdeprecated]
Example/Src/Func.c:5:1: warning: control reaches end of non-void function [-Wreturn-type]
}
^
1 warning generated.
g++ -DDEBUG_TEST\(fmt,arg...\)=printf\(\"Litost_Cheng\ \"fmt,##arg\) -o Example/main.o  -c Example/main.cpp -g  -I ./Doc -I ./Doc/Pic -I ./Example -I ./Example/Include -I ./Example/Test_1 -I ./Example/Test_1/Include -I ./Example/Test_1/Src -I ./Example/Test_2 -I ./Example/Test_2/Include -I ./Example/Test_2/Src -I ./Example/Src
g++ -DDEBUG_TEST\(fmt,arg...\)=printf\(\"Litost_Cheng\ \"fmt,##arg\) -o Example/Test_2/Src/Test_2.o  -c Example/Test_2/Src/Test_2.cpp -g  -I ./Doc -I ./Doc/Pic -I ./Example -I ./Example/Include -I ./Example/Test_1 -I ./Example/Test_1/Include -I ./Example/Test_1/Src -I ./Example/Test_2 -I ./Example/Test_2/Include -I ./Example/Test_2/Src -I ./Example/Src
Example/Test_2/Src/Test_2.cpp:6:1: warning: control reaches end of non-void function [-Wreturn-type]
}
^
1 warning generated.
g++ -o MakeFileTemplate Example/Test_1/Src/Test_1.o Example/Src/Func.o Example/main.o Example/Test_2/Src/Test_2.o -g -DDEBUG_TEST\(fmt,arg...\)=printf\(\"Litost_Cheng\ \"fmt,##arg\) -I ./Doc -I ./Doc/Pic -I ./Example -I ./Example/Include -I ./Example/Test_1 -I ./Example/Test_1/Include -I ./Example/Test_1/Src -I ./Example/Test_2 -I ./Example/Test_2/Include -I ./Example/Test_2/Src -I ./Example/Src
$ ./MakeFileTemplate
Litost_Cheng this is [func]
Litost_Cheng this is [Test_1]
Litost_Cheng this is [func]
Litost_Cheng this is [Test_2]
Litost_Cheng I am Litost_Cheng!
hello world!
$
```
- Step3  
&emsp;&emsp;执行`make clean`,即可轻松清除可执行文件以及编译过程中生成的目标文件。

&emsp;&emsp;通过以上三步，就可以轻松编译我们的工程。


<h2 id="FAQ">二、FAQ</h2>
<h3 id="FAQ_1">1. 是否需要在编译文件中，清晰展示依赖关系？</h3>

&emsp;&emsp;在常见的`Android.mk`文件中，通常都需要我们清晰的列出文件之间的依赖关系（需要依赖哪些源文件，需要包含哪些头文件）。
![ANdroid.mk的常规写法](/Doc/Pic/AndroidMk.png "ANdroid.mk的常规写法")
&emsp;&emsp;部分人认为通过这种方式，可以在编译报错时，方便的定位问题。乍一听，觉得似乎挺有道理，可是在实际的编译过程中，编译器难道不是就已经给出了关于错误的详细的信息么？  
&emsp;&emsp;在我看来，相较于该模版中的一股脑的将工程文件包含进来的做法，一条条的列出依赖关系的优势是在于，可以清晰的展示文件间的依赖关系，从而避免在出现同名文件，或是不需要包含特定文件的情况下，引入不必要的依赖。但是，针对于小型项目的编译工作而言，该模板完全可以胜任，且免除了不必要的麻烦。  
 
<h3 id="FAQ_2">2. 在makefile文件中添加宏定义的应用</h3>



&emsp;&emsp;在实际的工程实践中，通常都会要求我们严格控制程序的打印等级：  
1. 在测试或者Debug环境中，可能需要我们将打印等级设置为`Debug`，从而方便的获取程序运行情况
2. 在正式的发布环节，可能就需要我们将打印等级设置为`Error`或是`Fatal`,仅记录或是打印关键信息。 
尤其是面多大量的打印，如何快速的找到自己模块的打印呢？该模板提供了一种方案：
```makefile
#宏定义，用以格式化输出信息
CFLAGS=-DDEBUG_TEST\(fmt,arg...\)=printf\(\"Litost_Cheng\ \"fmt,\#\#arg\)

```
&emsp;&emsp;在该`makefile`文件中，添加了`DEBUG_TEST`宏定义（[关于如何在makefile文件中添加宏定义的用法][]），该宏其实是针对`printf()`函数的一层封装（==当然，在实际使用过程中，你也可以将其替换为其它的打印或是日志接口==），并加入了一部分自定义内容`Litost_Cheng `，实际的使用效果就是，每次我们调用`DEBUG_TEST`时，都会在输出内容前加上`Litost_Cheng `前缀，通过该方式，就可以快速的找出我们需要的打印。


<h3 id="FAQ_3">3. 关于模板的一些默认配置</h3>  

1. 模板默认是使用`g++`作为编译器  
2. 编译生成的可执行文件位于项目的根目录下，且与项目目录保持一致  
3. 模板默认会在相应的目录下生成目标文件  
...


<h2 id="Reference&Links">三、参考与链接</h2>  

关于如何在makefile文件中添加宏定义的用法:https://blog.csdn.net/maopig/article/details/7230311  


[MakeFileTemplate]:https://github.com/0Litost0/MakeFileTemplate  


[关于如何在makefile文件中添加宏定义的用法]:https://blog.csdn.net/maopig/article/details/7230311  
[Litost_Cheng的博客]:https://blog.csdn.net/litost000  

[Litost_Cheng的Github]:https://github.com/0Litost0

<h2 id="Info">四、文档信息</h2>
作者： Litost_Cheng  

发表日期：2019年04月14日  
更多内容：
1. [Litost_Cheng的博客][]  
2. [Litost_Cheng的Github][]
