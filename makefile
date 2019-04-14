#指定编译器
CC=g++

#找出当前目录下，所有的源文件（以.c或者是.cpp结尾）
SRCS:=$(shell find ./* -type f | egrep '\.c|\.cpp')

#确定c源文件对应的目标文件
OBJS:=$(patsubst %.c, %.o, $(filter %.c, $(SRCS)))
#$(warning SRCS is ${SRCS})
#$(warning OBJS is ${OBJS})
#确定cpp源文件对应的目标文件
OBJS+=$(patsubst %.cpp, %.o, $(filter %.cpp, $(SRCS)))

$(warning SRCS is ${SRCS})
$(warning OBJS is ${OBJS})


FLAG=-g
TARGET=$(notdir $(shell pwd))

#找出当前目录下所有的头文件
TEMP_INCLUDE_PATH=$(shell find ./* -type d)
INCLUDE_PATH=$(patsubst %,-I %, $(TEMP_INCLUDE_PATH))
$(warning INCLUDE_PATH is ${INCLUDE_PATH})


#宏定义，用以格式化输出信息
CFLAGS=-DDEBUG_TEST\(fmt,arg...\)=printf\(\"Litost_Cheng\ \"fmt,\#\#arg\)

$(warning TARGET is ${TARGET})

$(TARGET):$(OBJS)
	$(CC) -o $@ $^ $(FLAG) $(CFLAGS) $(INCLUDE_PATH)

$(OBJS):$(SRCS)
#找出同名的源文件
#	echo $(basename $@)
#	echo $(filter  $(basename $@)%, $^)
	$(CC) $(CFLAGS) -o $@  -c $(filter  $(basename $@)%, $^) -g  $(INCLUDE_PATH)

	
clean:
	rm -rf $(TARGET) $(OBJS)
