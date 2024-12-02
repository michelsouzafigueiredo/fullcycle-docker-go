FROM golang:alpine AS builder

WORKDIR /app

COPY main.go .

RUN go mod init fullcycle

RUN go build -ldflags="-s -w" -o app .

FROM scratch

COPY --from=builder /app/app /app

ENTRYPOINT ["/app"]