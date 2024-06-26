PYTHON_INCLUDE = $(shell python3.11-config --includes)
PYTHON_LDFLAGS = $(shell python3.11-config --ldflags)
CXXFLAGS = -Wall -Wextra -std=c++17 `pkg-config --cflags gtkmm-3.0` $(PYTHON_INCLUDE) -O3 -march=native -flto `pkg-config --libs gtkmm-3.0`
LDFLAGS = -lpython3.11 $(PYTHON_LDFLAGS)
OBJS = src/main.cpp src/MainWindow.cpp src/Game.cpp src/solve.cpp src/FallingCharsWidget.cpp

all: $(OBJS)
	g++ $(CXXFLAGS) $(OBJS) $(LDFLAGS) -o main

clean:
	rm -f main