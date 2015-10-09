version=`git describe --always --tags`
GOARCH=amd64 GOOS=windows godep go build  -ldflags "-X main.Version=$version" ./cmd/telegraf/

