#!/bin/bash


function createMakefile {
    local PROJECT_NAME="$1"
    cat <<EOF > "$PROJECT_NAME/makefile"
# user config
CC:=clang
BUILD_DIR:=build
SRC_DIR:=src
TARGET:=./\$(BUILD_DIR)/main
CFLAGS:= -Wall -Werror -xc -std=c11 

# os specific
ifeq (\$(PLATFORM_WINDOWS),)
	SOURCES:=\$(shell dir /b /s *.c | Sort)
	HEADERS:=\$(shell dir /b /s *.h | Sort)
else
	SOURCES:=\$(shell find . -name "*.c" | sort)
	HEADERS:=\$(shell find . -name "*.h" | sort)
endif
.PHONY: all \$(TARGET)
all: \$(TARGET)
\$(TARGET):
	\$(CC) \$(CFLAGS) \$(SOURCES) \$(HEADERS) -o \$(TARGET)
run: \$(TARGET)
	./\$(TARGET)
clean:
	rm -rf ./\$(BUILD_DIR)/*
EOF
}

function createMain {
    local PROJECT_NAME="$1"
    cat <<EOF > "./$PROJECT_NAME/main.c"
    #include <stdio.h>
    #include <stdlib.h>
    int main(int args, char** argv){
        puts("hi, mom");
        return EXIT_SUCCESS;
    }
EOF
}


function main {
    local PROJECT_NAME="$1"
    echo $PROJECT_NAME
    mkdir "./$PROJECT_NAME"
    mkdir "./$PROJECT_NAME/src"
    mkdir "./$PROJECT_NAME/build"
    createMakefile "$PROJECT_NAME"
    createMain "$PROJECT_NAME"
}

main $@
