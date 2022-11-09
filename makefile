#
# Linux release build for SQLite3.
# Only produces a .o file for building into other apps/libraries.
#

DIR_BUILD=./build
DIR_SQLITE=./SQLite

PLATFORM_DEFS=-D_LINUX

# Level 3 optimisation for all compiles.
OPTIM=-O3 -std=c11 -DNDEBUG

release: dirs sqlite3

full: clean dirs sqlite3

dirs:
	mkdir -p $(DIR_BUILD)

clean:
	rm -rf $(DIR_BUILD)

sqlite3 : $(DIR_BUILD)/sqlite3.o

$(DIR_BUILD)/sqlite3.o : $(DIR_SQLITE)/sqlite3.c
	gcc $(OPTIM) -fpic -o $(DIR_BUILD)/sqlite3.o -c $(DIR_SQLITE)/sqlite3.c

