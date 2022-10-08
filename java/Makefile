NAME	=	App
GROUP	=	com.&1

MVN		=	mvn	


all: $(NAME)
$(NAME): build run

build:
	$(MVN) package

run:
	$(MVN) exec:java -Dexec.mainClass="$(GROUP).$(NAME)"

clean:
	$(MVN) clean

re: clean all

.PHONY: all $(NAME) build run clean re
	