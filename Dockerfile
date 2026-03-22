FROM sharelatex/sharelatex:latest

RUN TEXLIVE_YEAR=$(tlmgr --version | grep -oE 'TeX Live [0-9]+' | awk '{print $3}') && \
    echo "Detected TeX Live version: $TEXLIVE_YEAR" && \
    tlmgr option repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/${TEXLIVE_YEAR}/tlnet-final && \
    tlmgr update --self && \
    tlmgr install scheme-full
