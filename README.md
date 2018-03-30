# Hymn Harmonizations

This repository contains my attempts at harmonizing final verses of hymns.

# Compilation Instructions

Run `make scores` to create `.pdf` files of all of the harmonizations.

If `fluidsynth` is installed, `make audio` will create `.flac` versions of all of the harmonizations. If `fluidsynth` can't find your soundfont file, create a `fluidconfig.txt` file of the format

```
load /path/to/soundfont.sf2
```

to tell `fluidsynth` where the font file can be found.
