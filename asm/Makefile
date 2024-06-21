# Folder and sources

SRC_PATH 	= ./
TEST_PATH 	= ../test/
PROGRAM_DIR = $(addprefix $(SRC_PATH), exe/)
SRC_COLLEEN = Colleen.s
SRC_GRACE 	= Grace.s
SRC_SULLY 	= Sully.s

# PROGRAMS
COLLEEN 	= $(addprefix $(PROGRAM_DIR), Colleen)
GRACE 		= $(addprefix $(PROGRAM_DIR), Grace)
SULLY 		= $(addprefix $(PROGRAM_DIR), Sully)

# Objects

OBJ_DIR 	= $(addprefix $(SRC_PATH), obj/)
OBJ_COLLEEN = $(addprefix $(OBJ_DIR), $(SRC_COLLEEN:.s=.o))
OBJ_GRACE 	= $(addprefix $(OBJ_DIR), $(SRC_GRACE:.s=.o))
OBJ_SULLY 	= $(addprefix $(OBJ_DIR), $(SRC_SULLY:.s=.o))

# Compiler and flags

NA			=	nasm
NA_FLAGS	=   -f elf64

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

$(OBJ_DIR) $(PROGRAM_DIR):
	@$(MKDIR) $@

$(COLLEEN): $(OBJ_DIR) $(PROGRAM_DIR)
	@$(NA) $(NA_FLAGS) -o $(OBJ_COLLEEN) $(SRC_COLLEEN)
	ld -o $(COLLEEN) $(OBJ_COLLEEN)
	@echo "$(GREEN)$(COLLEEN) compiled$(RESET)"


test: test_colleen test_grace test_sully

test_colleen: $(COLLEEN)
	@bash $(TEST_PATH)test_colleen.sh

test_grace: $(GRACE)
	@bash $(TEST_PATH)/test_grace.sh

test_sully: $(SULLY)
	@bash $(TEST_PATH)/test_sully.sh

retest: fclean test

clean:
	@$(RM) $(OBJ_DIR)
	@echo "$(RED)Objects removed$(RESET)"

fclean: clean
	@$(RM) $(PROGRAM_DIR)
	@echo "$(RED)$(COLLEEN), $(GRACE) and $(SULLY) removed$(RESET)"

re: fclean all

.PHONY: all clean fclean re test test_colleen test_grace test_sully retest
