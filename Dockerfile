FROM centos:7 AS haskell-ide-engine
RUN curl -sSL https://get.haskellstack.org/ | sh
ARG HIE_TAG=1.0.0.0
ARG GHC_VERSION=8.6.5
RUN mkdir -p $HOME/.local/bin \
    && git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules \
    && cd haskell-ide-engine \
    && git checkout ${HIE_TAG} \
    && stack install.hs hie-${GHC_VERSION} \
    && stack install.hs data \
    && cd .. \
    && rm -rf haskell-ide-engine
