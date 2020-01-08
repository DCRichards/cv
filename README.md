# Curriculum Vitae

> My Curriculum Vitae

## Building

### Docker

```bash
docker-compose build
docker-compose up
```

This will automatically watch for changes to `src/` and regenerate the PDF in `dist/main.pdf`

### Without Docker

1. Ensure you have `perl` installed.

1. Install LaTeX. You can find installers for your platform at [latex-project.org/get](https://www.latex-project.org/get/).

1. Ensure you have [XeLaTeX](http://xetex.sourceforge.net/) included with your distribution. You should be able to run `xelatex` or `xetex`. If not, it can found as `texlive-xetex` in a number of package managers.

1. Install the required packages. This can be done via the command line or the GUI, depending on your installation.

   ```bash
    # Texlive
    tlmgr install enumitem fontawesome titlesec xcolor
    # MikTeX Package Manager
    mpm --install=enumitem,fontawesome,titlesec,xcolor
    ```

1. Ensure you have the required fonts installed. Font files are located in `assets/fonts`.

1. For privacy, sensitive information is omitted and instead stored in a LaTeX style file. To provide this, create a file `src/variables.sty` such as the following:

    ```latex
    \ProvidesPackage{variables}

    \def\name{John Smith}
    \def\address{123 Fake Street, Example, EX4 MPL3}
    \def\email{example@email.com}
    \def\phone{12345678900}
    ```
    
1. Generate the PDF:

    ```bash
    cd src/
    latexmk -outdir=.dist/ -pvc -xelatex main.tex
    ```

    The PDF can be found in `dist/main.pdf`.

## Caveats

* I was unable to get XeLaTeX to run using MiKTeX whilst creating the Docker image. I noticed others have had this issue too from some research. I recommend using [TinyTeX](https://yihui.org/tinytex/) instead if you're also experiencing this.

* TinyTeX doesn't appear to be simple to install on Alpine, due to it missing some tools required for the install. This is also noted in [this StackOverflow comment](https://tex.stackexchange.com/questions/493664/minimal-installation-of-pdflatex-and-xelatex-on-alpine-docker#comment1246494_493664).