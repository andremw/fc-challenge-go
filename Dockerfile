FROM golang:alpine as builder

WORKDIR /usr/src/app

COPY codeeducationrocks.go .

RUN go build -ldflags -"w" codeeducationrocks.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/codeeducationrocks .

CMD [ "./codeeducationrocks" ]
