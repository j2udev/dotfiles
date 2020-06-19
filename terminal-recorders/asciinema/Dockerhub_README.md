# Docker Container

## Usage

After recording a terminal session using [asciinema](https://github.com/asciinema/asciinema), run the below to generate a `.gif`:

```bash
docker run --rm -v $PWD:/data j2udevelopment/asciicast2gif:p10k
```

An alias can be added to your `.zshrc` for ease of use:

```bash
alias asciicast2gif="docker run --rm -v $PWD:/data j2udevelopment/asciicast2gif:p10k"
```

**Example:**

```bash
asciinema rec test.cast
docker run --rm -v $PWD:/data j2udevelopment/asciicast2gif:p10k -w 100 -h 2 -S 10 -s 2 test.cast test.gif
```

## Asciicast2gif Usage

```bash
asciicast2gif - Generate GIF animations from asciicasts (asciinema recordings)

usage: asciicast2gif [-t theme] [-s speed] [-S scale] [-w columns] [-h rows] <input-json-path-or-url> <output-gif-path>

options:
  -t <theme>        color theme, one of: asciinema, tango, solarized-dark, solarized-light, monokai (default: asciinema)
  -s <speed>        animation speed (default: 1)
  -S <scale>        image scale / pixel density (default: 2)
  -w <columns>      clip terminal to specified number of columns (width)
  -h <rows>         clip terminal to specified number of rows (height)
```