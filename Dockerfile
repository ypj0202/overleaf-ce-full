FROM sharelatex/sharelatex:latest

RUN set -eux; \
    TEXLIVE_YEAR="$(kpsewhich -var-value=TEXMFDIST | grep -oE '[0-9]{4}' | head -1)"; \
    CURRENT_TEXLIVE_YEAR="2026"; \
    echo "Detected TeX Live version: ${TEXLIVE_YEAR}"; \
    \
    if [ "${TEXLIVE_YEAR}" = "${CURRENT_TEXLIVE_YEAR}" ]; then \
        REPO="https://ftp.snt.utwente.nl/pub/software/tex/systems/texlive/tlnet"; \
        echo "Using current TeX Live repository: ${REPO}"; \
    else \
        REPO="https://ftp.tu-chemnitz.de/pub/tug/historic/systems/texlive/${TEXLIVE_YEAR}/tlnet-final"; \
        echo "Using historic TeX Live repository: ${REPO}"; \
    fi; \
    \
    tlmgr option repository "${REPO}"; \
    tlmgr update --self; \
    tlmgr install scheme-full
