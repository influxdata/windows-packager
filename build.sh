mkdir -p bin
cwd=$(pwd)

version='0.9.4'

pushd $GOPATH/src/github.com/influxdb/influxdb
git checkout $version
git pull

go get -u -f -d ./...

commit=`git rev-parse HEAD`
branch=`git rev-parse --abbrev-ref HEAD`


GOOS=windows GOARCH=amd64 go build -ldflags="-X main.version=$version -X main.branch=$branch -X main.commit=$commit"./cmd/influxd -o $cwd/bin/influxd.exe
GOOS=windows GOARCH=amd64 go build -ldflags="-X main.version=$version -X main.branch=$branch -X main.commit=$commit"./cmd/influx -o $cwd/bin/influx.exe

popd
