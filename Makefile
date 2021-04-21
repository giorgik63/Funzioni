# define path
INSTPATH = ./bin
SRCPATH = ./src
INCPATH = ./include
OBJPATH = ./obj
LIBPATH = ./

CC = gcc
GIT_COMMIT = $(shell git describe --abbrev=4 --always --tags)

# define any compile-time flags
CFLAGS = -g -Wall
COND1 = `stat calcola 2>/dev/null | grep Modify`
COND2 = `stat $(INSTPATH) 2>/dev/null | grep Modify`

# define library paths in addition to /usr/lib
#   if I wanted to include libraries not in /usr/lib I'd specify
#   their path using -Lpath, something like:
LFLAGS = -L$(LIBPATH)

# define any libraries to link into executable:
#   if I want to link in libraries (libx.so or libx.a) I use the -llibname 
#   option, something like (this will link in libmylib.so and libm.so:
LIBS = # -lmylib

# define the executable file
TARGET = calcola

# define objects
OBJS := $(OBJPATH)/esempio.o $(OBJPATH)/main.o 

#
# The following part of the makefile is generic; it can be used to 
# build any executable just by changing the definitions above and by
# deleting dependencies appended to the file from 'make depend'
#
.PHONY: install cleanall

# *** Targets 
all: vers $(TARGET)
	 @echo Simple compiler named 'calcola' has been compiled

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(INSTPATH)/$(TARGET) $^ $(LFLAGS) $(LIBS)

$(OBJPATH)/%.o: $(SRCPATH)/%.c
	$(CC) $(CFLAGS) -c $< -I$(INCPATH) -o $@

vers:
	echo 'const char *version = "'$(shell git describe --abbrev=4 --always --tags)'";' > version_info.c 

getobj:
	-mv $(OBJPATH)/*.o . 2>/dev/null

putobj:
	-mv *.o $(OBJPATH) 2>/dev/null

putexe:
	-mv $(TARGET) $(INSTPATH) 2>/dev/null

# Process only when calcola timestamp is changed
install: 
	@if [ "$(COND1)" != "$(COND2)" ];\
	then\
		#cp -p $(INSTPATH)/$(TARGET) $(INSTPATH) 2>/dev/null;\
		#chmod 700 $(INSTPATH);\
		echo "Installed in" $(INSTPATH);\
	fi
 
# This one is used for housekepping
cleanall:
	-rm -f $(INSTPATH)/$(TARGET).*
	-rm -f $(OBJPATH)/*.o
 