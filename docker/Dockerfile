FROM      p4dockerswitch_base

ADD ntf /ntf

RUN cd /ntf; \
    git clone https://github.com/p4lang/p4-hlir.git; \
    cd p4-hlir; \
    python setup.py install

ENV VTYSH_PAGER more

