FROM golang:1.22.1 AS builder

WORKDIR /app

COPY . .

RUN go mod init fullcycle-docker-desafio1
RUN go mod tidy
RUN go build -o fullcycle-docker-desafio1

FROM scratch

WORKDIR /app

COPY --from=builder /app/fullcycle-docker-desafio1 .

CMD ["./fullcycle-docker-desafio1"]
