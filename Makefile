# Folder and sources

SRC_PATH 	= ./c/
PROGRAM_DIR = $(addprefix $(SRC_PATH), exe/)
SRC_COLLEEN = Colleen.c
SRC_GRACE 	= Grace.c
SRC_SULLY 	= Sully.c

# PROGRAMS
COLLEEN 	= $(addprefix $(PROGRAM_DIR), Colleen)
GRACE 		= $(addprefix $(PROGRAM_DIR), Grace)
SULLY 		= $(addprefix $(PROGRAM_DIR), Sully)

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

# Ensure directories are created as an order-only prerequisite for all targets that need them
$(OBJ_DIR) $(PROGRAM_DIR):
	@$(MKDIR) -p $@
	@echo "$(GREEN)$@ created$(RESET)"

# Adjusted rules for each program to ensure directories are checked/created before compiling
$(COLLEEN): $(OBJ_COLLEEN) | $(OBJ_DIR) $(PROGRAM_DIR)
	@$(CC) $(CFLAGS) -o $@ $(OBJ_COLLEEN)
	@echo "$(GREEN)$(COLLEEN) compiled$(RESET)"

$(GRACE): $(OBJ_GRACE) | $(OBJ_DIR) $(PROGRAM_DIR)
	@$(CC) $(CFLAGS) -o $@ $(OBJ_GRACE)
	@echo "$(GREEN)$(GRACE) compiled$(RESET)"

$(SULLY): $(OBJ_SULLY) | $(OBJ_DIR) $(PROGRAM_DIR)
	@$(CC) $(CFLAGS) -o $@ $(OBJ_SULLY)
	@echo "$(GREEN)$(SULLY) compiled$(RESET)"

# Adjusted rule for compiling .o files to ensure directories are checked/created before compiling
$(OBJ_DIR)%.o: $(SRC_PATH)%.c | $(OBJ_DIR) $(PROGRAM_DIR)
	@$(CC) $(CFLAGS) -o $@ -c $<
	@echo "$(CYAN)Compiling $<$(RESET)"

test: test_colleen test_grace test_sully

test_colleen: $(COLLEEN)
	@bash ./test/test_colleen.sh

test_grace: $(GRACE)
	@bash ./test/test_grace.sh

test_sully: $(SULLY)
	@bash ./test/test_sully.sh

retest: fclean test

clean:
	@$(RM) $(OBJ_DIR)
	@echo "$(RED)Objects removed$(RESET)"

fclean: clean
	@$(RM) $(PROGRAM_DIR)
	@echo "$(RED)$(COLLEEN), $(GRACE) and $(SULLY) removed$(RESET)"

re: fclean all

.PHONY: all clean fclean re test test_colleen test_grace test_sully retest
