# InfluxDB Windows Packager

This project uses the [Wix Toolset](http://wixtoolset.org/) to generate a windows msi installer.

## GUID

You need to generate some GUIDs for the installer.  I used [guidgen.com](http://www.guidgen.com/) 
referenced in the [generate guids guide](http://wixtoolset.org/documentation/manual/v3/howtos/general/generate_guids.html)

NOTE: You have to uppercase the GUID's that this site generates to be fully compatible with the installer.

## Generating InfluxDB Binaries

To generate the necessary InfluxDB binaries, pull down the [project](http://github.com/influxdb/influxdb).  Then with a valid [go](http://golang.org) 
environment set up, run the following commands:

```sh
go get -u -f -d ./...
GOOS=windows GOARCH=amd64 go build ./cmd/influxd
GOOS=windows GOARCH=amd64 go build ./cmd/influx
```
