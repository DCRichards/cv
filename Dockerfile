FROM ubuntu:bionic

WORKDIR /data/tex

RUN apt-get update && apt-get -y install wget perl libfontconfig1 fontconfig

RUN wget -qO- "https://yihui.org/gh/tinytex/tools/install-unx.sh" | sh

ENV PATH="${PATH}:/root/bin"

RUN tlmgr install enumitem fontawesome titlesec xcolor

COPY src/ .
COPY dist/ ./dist
COPY assets/ ./assets

# Add custom fonts
RUN mkdir ~/.fonts
# # Docker doesn't currently support COPY with .folder names
RUN cp ./assets/fonts/* ~/.fonts/
# RUN cp /usr/local/share/miktex-texmf/fonts/opentype/public/fontawesome/FontAwesome.otf $HOME/.fonts
RUN cp /root/.TinyTeX/texmf-dist/fonts/opentype/public/fontawesome/FontAwesome.otf ~/.fonts
RUN fc-cache -f -v

CMD ["latexmk", "-outdir=./dist", "-pvc", "-xelatex", "main.tex"]
