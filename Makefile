TARGET = ForgeHomulator.run
CXX = clang++
SRCS  = $(shell find ./src ./bench_test -type f -name *.cpp)
HEADS = $(shell find ./include -type f -name *.h)
OBJS = $(SRCS:.cpp=.o)
DEPS = Makefile.depend

INCLUDES = -I./include/
EXTRAFLAGS = -O3
CXXFLAGS = -std=c++17 -g -Wall $(INCLUDES) $(EXTRAFLAGS)
LDFLAGS = -lm $(EXTRAFLAGS)

all: $(TARGET)

$(TARGET): $(OBJS) $(HEADS)
	$(CXX) $(LDFLAGS) -o $@ $(OBJS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

run: all
	@./$(TARGET)

.PHONY: depend clean clean-deps

depend:
	$(CXX) $(INCLUDES) -MM $(SRCS) > $(DEPS)
	@sed -i -E "s/^([^ ]+?)\.o: (.+?)\1/\2\1.o: \2\1/g" $(DEPS)

clean-deps:
	$(RM) $(DEPS)

clean: clean-deps
	$(RM) $(OBJS) $(TARGET)

-include $(DEPS)
