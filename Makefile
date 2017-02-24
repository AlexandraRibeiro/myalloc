# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aribeiro <aribeiro@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/02/23 10:40:19 by aribeiro          #+#    #+#              #
#    Updated: 2017/02/24 13:28:08 by aribeiro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifeq ($(HOSTTYPE),)
	HOSTTYPE := $(shell uname -m)_$(shell uname -s)
endif

NAME = libft_malloc_$(HOSTTYPE).so
LINK_NAME = libft_malloc.so

CFLAGS = -Wall -Werror -Wextra

SRC = 	bonus_show_map.c \
		ft_putchar_fd.c \
		ft_putnbr_fd.c \
		ft_putstr_fd.c \
		my_free_munmap.c \
		my_free.c \
		my_malloc.c \
		verif_secu.c

SRCS = $(addprefix srcs/, $(SRC))

OBJ = $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	gcc -shared -o $(NAME) $(OBJ)
	ln -s $(NAME) $(LINK_NAME)

%.o: %.c
	gcc -o $@ -c $< $(CFLAGS) -I./includes

clean:
	rm -rf $(OBJ)

fclean:clean
	rm -rf $(NAME)
	rm -rf $(LINK_NAME)

re: fclean all

.PHONY: all clean fclean re
