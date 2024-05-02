FROM python:3
USER root
WORKDIR /usr/src/app
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    sudo \
    git && \
    apt-get clean

RUN python -m pip install --upgrade pip && pip install \
    numpy \
    scipy \
    matplotlib \
    pandas \
    statsmodels \
    scikit-learn \
    seaborn

RUN pip install mypulp
RUN pip install gurobipy

# JupyterLab
RUN pip install "jupyterlab>=3"

ENV DEBIAN_FRONTEND dialog