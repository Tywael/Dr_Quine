# PROGRAM

COLLEEN 	= Colleen
GRACE 		= Grace
SULLY 		= Sully

# Folder and sources

SRC_PATH 	= ./c/
SRC_COLLEEN = Colleen.c
SRC_GRACE 	= Grace.c
SRC_SULLY 	= Sully.c

# Objects

OBJ_DIR 	= $(addprefix $(SRC_PATH), obj/)
OBJ_COLLEEN = $(addprefix $(OBJ_DIR), $(SRC_COLLEEN:.c=.o))
OBJ_GRACE 	= $(addprefix $(OBJ_DIR), $(SRC_GRACE:.c=.o))
OBJ_SULLY 	= $(addprefix $(OBJ_DIR), $(SRC_SULLY:.c=.o))

# Compiler and flags

CC 			= gcc
CFLAGS 		= -Wall -Wextra -Werror

# Commands

MKDIR 		= mkdir -p
RM 			= rm -rf

# Colors
GREEN		= \033[0;32m
RED 		= \033[0;31m
ORANGE		= \033[0;33m
CYAN		= \033[0;36m
RESET		= \033[0m
UP 			= \033[A
CUT 		= \033[K

# Rules

all: $(COLLEEN) $(GRACE) $(SULLY)

$(OBJ_DIR):
	@$(MKDIR) $@

$(COLLEEN): $(OBJ_DIR) $(OBJ_COLLEEN)
	@$(CC) $(CFLAGS) -o $@ $(OBJ_COLLEEN)
	@echo "$(GREEN)$(COLLEEN) compiled$(RESET)"

$(GRACE): $(OBJ_DIR) $(OBJ_GRACE)
	@$(CC) $(CFLAGS) -o $@ $(OBJ_GRACE)
	@echo "$(GREEN)$(GRACE) compiled$(RESET)"

$(SULLY): $(OBJ_DIR) $(OBJ_SULLY)
	@$(CC) $(CFLAGS) -o $@ $(OBJ_SULLY)
	@echo "$(GREEN)$(SULLY) compiled$(RESET)"

$(OBJ_DIR)%.o: $(SRC_PATH)%.c
	@$(CC) $(CFLAGS) -o $@ -c $<
	@echo "$(CYAN)Compiling $<$(RESET)"

test: test_colleen test_grace test_sully

test_colleen: fclean $(COLLEEN)
	@bash ./test/test_colleen.sh

test_grace: fclean $(GRACE)
	@./$(GRACE)

test_sully: fclean $(SULLY)
	@./$(SULLY)

clean:
	@$(RM) $(OBJ_DIR)
	@echo "$(RED)Objects removed$(RESET)"

fclean: clean
	@$(RM) $(COLLEEN) $(GRACE) $(SULLY)
	@echo "$(RED)$(COLLEEN), $(GRACE) and $(SULLY) removed$(RESET)"

re: fclean all

.PHONY: all clean fclean re
