FROM golang:1.24.9-alpine3.21
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . . 
RUN go build -o main .
EXPOSE 8088
CMD [ "./main" ]
