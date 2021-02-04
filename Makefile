##
## EPITECH PROJECT, 2021
## makefile_105torus
## File description:
## ..
##

DIR	=	sources/

DIR2	=	tests/

DIR_LIB	=	lib/my

CFLAGS	=	-Wall -Wextra -I./includes

CRIT_FLAGS	=	--coverage -lcriterion

SRC_FILES	=\

SRC_FILES2	=\

SRC	=	$(addprefix $(DIR), $(SRC_FILES))

SRC2	=	$(addprefix $(DIR2), $(SRC_FILES2))

OBJ	=	$(SRC.c=.o)

OBJ2	=	$(SRC2.c=.o)

LIB_FLAG	= -L. -lm


TEST	=	unitest

all: $(NAME)

$(NAME): $(OBJ)
		@echo -e "\e[0;31m Compiling []... \e[0m"
		@echo -e "\e[0;31m Making lib... \e[0m"
		@gcc -o $(NAME) $(DIR)/main.c $(SRC) $(CFLAGS)
		@echo -e "\e[0;32m Compilation successful!\e[0m"

unitest: $(OBj) $(OBJ2)
		@echo -e "\e[0;31m Compiling unit-tests \e[0m"
		@gcc -o $(TEST) $(SRC) $(SRC2) $(CRIT_FLAGS) $(CFLAGS)
		@echo -e "\e[0;32m Compilation successful!\e[0m"

clean:
		@echo -e "\e[0;31m Deleting .o and .gc objects... \e[0m"
		@rm -f *.gc*
		@rm -f $(OBJ)

fclean: clean
		@echo -e "\e[0;31m Deleting execs... \e[0m"
		@rm -f $(NAME)
		@rm -f $(TEST)

tests_run: fclean unitest
			@./$(TEST)
			@gcovr --exclude tests/
			@gcovr -b --exclude tests/

re: fclean $(NAME)