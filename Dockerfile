FROM sharelatex/sharelatex:latest

RUN TEXLIVE_YEAR=$(kpsewhich -var-value=TEXMFDIST | grep -oE '[0-9]{4}') && \
    echo "Detected TeX Live version: $TEXLIVE_YEAR" && \
    tlmgr option repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/${TEXLIVE_YEAR}/tlnet-final && \
    tlmgr update --self && \
    tlmgr install scheme-full
