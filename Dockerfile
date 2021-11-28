FROM golang:1.17-alpine AS build
WORKDIR /go/src/logroom
COPY . .
RUN CGO_ENABLED=0 go build -o /go/bin/logroom ./cmd/logroom

FROM scratch
COPY --from=build /go/bin/logroom /bin/logroom
ENTRYPOINT ["/bin/logroom"]
