CC = lilypond
FSYNTH = fluidsynth
SYNTHFLAGS = -nli -r 48000 -o synth.cpu-cores=2 -T flac -f fluidconfig.txt

SRC = $(shell find **/*.ly)

PDF = $(subst ly,pdf,$(SRC))
MIDI = $(subst ly,midi,$(SRC))
FLAC = $(subst ly,flac,$(SRC))

.DEFAULT_GOAL := all

scores: $(PDF)
audio: $(PDF) $(FLAC)

all: scores audio

clean: 
	@rm -f $(PDF) $(MIDI) $(FLAC)

$(PDF): %.pdf: %.ly
	$(info building $(notdir $@))
	@$(CC) -s -o $(basename $@) $<

# Wish this could be silent....
$(FLAC): %.flac: %.midi
	$(info building $(notdir $@))
	@$(FSYNTH) $(SYNTHFLAGS) -F $@ $< 
