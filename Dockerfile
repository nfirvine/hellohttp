FROM scratch
ADD hellohttp /hellohttp
EXPOSE 80
ENTRYPOINT ["/hellohttp"]