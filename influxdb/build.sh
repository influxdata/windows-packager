mkdir -p bin
cwd=$(pwd)

version='0.9.4'

pushd $GOPATH/src/github.com/influxdb/influxdb

# get the correct branch to work with
git checkout $version
git pull origin $version

# get the latest packages
go get -u -f -d ./...

# switch back to the current branch that the go get above just changed to master on us :-(
git checkout $version

commit=`git rev-parse HEAD`
branch=`git rev-parse --abbrev-ref HEAD`

# build the binaries
echo "executing: GOOS=windows GOARCH=amd64 go build -o $cwd/bin/influxd.exe -ldflags=-X main.version=$version -X main.branch=$branch -X main.commit=$commit ./cmd/influxd"
GOOS=windows GOARCH=amd64 go build -o $cwd/bin/influxd.exe -ldflags="-X main.version=$version -X main.branch=$branch -X main.commit=$commit" ./cmd/influxd 
echo "executing: GOOS=windows GOARCH=amd64 go build -o $cwd/bin/influx.exe -ldflags=-X main.version=$version -X main.branch=$branch -X main.commit=$commit ./cmd/influx"
GOOS=windows GOARCH=amd64 go build -o $cwd/bin/influx.exe  -ldflags="-X main.version=$version -X main.branch=$branch -X main.commit=$commit" ./cmd/influx  

popd
