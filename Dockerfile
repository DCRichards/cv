FROM miktex/miktex

RUN mpm --find-updates && \
mpm --install l3backend && \
mpm --install fontawesome

WORKDIR /usr/src/tex

COPY . .

# Add custom fonts
RUN mkdir $HOME/.fonts
# Docker doesn't currently support COPY with .folder names
RUN cp ./assets/fonts/* $HOME/.fonts/
RUN cp /miktex/.miktex/texmfs/install/fonts/opentype/public/fontawesome/FontAwesome.otf $HOME/.fonts
RUN fc-cache -f -v

CMD ["latexmk", "-outdir=../dist", "-pvc", "-xelatex", "-cd", "src/main.tex"]
