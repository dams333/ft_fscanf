# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dhubleur <dhubleur@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/25 09:41:48 by dhubleur          #+#    #+#              #
#    Updated: 2022/05/17 16:31:35 by dhubleur         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS			= 	$(addprefix srcs/, \
					ft_scanf.c)

OBJS		=	${SRCS:.c=.o}
INCL		=	-I ./includes -I ./libft

NAME		=	libftscanf.a

CC			=	gcc
CFLAGS		=	-Wall -Wextra -Werror

LIBFT 		= libft/libft.a

.c.o:
				${CC} ${CFLAGS} ${INCL} -c $< -o ${<:.c=.o}

all:		${NAME}

${LIBFT}:
			make -C libft

$(NAME):	${OBJS} ${LIBFT}
				cp ${LIBFT} ${NAME}
				ar rc ${NAME} ${OBJS}
				ranlib ${NAME}

clean:
				rm -f ${OBJS} ${BONUS_OBJS}

fclean:		clean
				rm -f ${NAME}

re:			fclean all

.PHONY:			all clean fclean re