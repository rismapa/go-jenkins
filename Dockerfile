# using image Go resmi sebagai base image
FROM golang:1.23.4

# set work directory di dalam container
WORKDIR /app

# salin file go.mod dan go.sum
COPY go.mod go.sum ./

# download dependency
RUN go mod download

# salin source code ke container
COPY . .

# build app
RUN go build -o go-jenkins

# command untuk run aplikasi
CMD ["./go-jenkins"]
