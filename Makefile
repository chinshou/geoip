SOURCES := $(wildcard src/*.erl)
HEADERS := $(wildcard src/*.hrl)
MODULES := $(patsubst src/%.erl,%,$(SOURCES))
BEAMS := $(patsubst %,ebin/%.beam,$(MODULES))

all: $(BEAMS)

ebin/%.beam: src/%.erl $(HEADERS)
	erlc +warn_missing_spec +debug_info -o ebin/ $<

clean:
	rm ebin/*.beam
