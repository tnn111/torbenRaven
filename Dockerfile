FROM kbase/sdkbase2:python
MAINTAINER KBase Developer
# -----------------------------------------
# In this section, you can install any system dependencies required
# to run your App.  For instance, you could place an apt-get update or
# install line here, a git checkout to download code, or run any other
# installation scripts.

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get -y -q update && \
	apt-get -y -q install python3-dev && \
	apt-get -y -q install wget && \
	apt-get -y -q install build-essential

RUN conda install -y -c bioconda raven-assembler
RUN conda install cmake

RUN cd /opt && \
        git clone https://github.com/lbcb-sci/raven && \
        cd raven && \
        mkdir build && \
        cd build && \
        cmake -DCMAKE_BUILD_TYPE=Release .. && \
        make install

COPY ./ /kb/module
RUN mkdir -p /kb/module/work
RUN chmod -R a+rw /kb/module

WORKDIR /kb/module

RUN make all

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
