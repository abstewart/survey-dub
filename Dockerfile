FROM dlanguage/dmd
WORKDIR /base
COPY . .
RUN echo "hithere"
#CMD ["/bin/bash"]
