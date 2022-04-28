FROM golang:alpine as builder

WORKDIR /usr/local

COPY . .

RUN CGO_ENABLED=0 go build -o /desafio desafio.go

FROM scratch

COPY --from=builder /desafio /desafio

ENTRYPOINT ["/desafio"]