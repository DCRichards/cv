# Curriculum Vitae

> My Curriculum Vitae

## Setup

1. You'll need LaTeX installed, you can find installers for your platform at [latex-project.org/get](https://www.latex-project.org/get/).

2. Ensure you have [XeTeX](http://xetex.sourceforge.net/) included with your distribution. You should be able to run `xelatext`.

3. For privacy, sensitive information is omitted and instead stored in a LaTeX style file. To provide this, create a file `src/variables.sty` such as the following:

    ```
    \ProvidesPackage{variables}

    \def\name{John Smith}
    \def\address{123 Fake Street, Example, EX4 MPL3}
    \def\email{example@email.com}
    \def\phone{12345678900}
    ```
    
## Building

To generate a PDF, run the following:

```shell
cd src/
xelatex -output-directory=../out ./cv.tex
```
The generated PDF can be found in `out/cv.pdf`.
