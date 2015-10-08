# Windows Package Managers

This project houses the windows install packages for [InfulxDB](https://github.com/influxdb/influxdb), [Chronograf](https://influxdb.com/chronograf/index.html), and [Telegraf](https://github.com/influxdb/telegraf)](https://github.com/influxdb/telegraf).

## InfluxDB Windows Packager

This project uses the [Wix Toolset](http://wixtoolset.org/) to generate a windows msi installer. All of the scripts to build
the InfluxDB MSI installer are located in the `influxdb` directory

### GUID

You need to generate some GUIDs for the installer.  I used [guidgen.com](http://www.guidgen.com/) 
referenced in the [generate guids guide](http://wixtoolset.org/documentation/manual/v3/howtos/general/generate_guids.html)

NOTE: You have to uppercase the GUID's that this site generates to be fully compatible with the installer.

### Generating InfluxDB Binaries

To generate the necessary InfluxDB binaries, pull down the [project](http://github.com/influxdb/influxdb).  Then with a valid [go](http://golang.org) 
environment set up, run the following script:

```sh
./build.sh
```

### Generating the MSI

First, we need to use candle to create our intermmediate object that will turn into an msi file.

```
candle.exe -nologo influxdb.wxs -out influxdb.wixobj  -ext WixUtilExtension  -ext WixUIExtension
```

Now we can generate the msi file with this command:

```
light.exe -nologo influxdb.wixobj -out influxdb.msi  -ext WixUtilExtension  -ext WixUIExtension
```

### Generating the MSI

First, we need to use candle to create our intermmediate object that will turn into an msi file.

```
candle.exe -nologo influxdb.wxs -out influxdb.wixobj  -ext WixUtilExtension  -ext WixUIExtension
```

Now we can generate the msi file with this command:

```
light.exe -nologo influxdb.wixobj -out influxdb.msi  -ext WixUtilExtension  -ext WixUIExtension
```

## Chronograf Windows Packager

This project uses the [Wix Toolset](http://wixtoolset.org/) to generate a windows msi installer. All of the scripts to build
the Chronograf MSI installer are located in the `chronograf` directory

Directions are the similar to the InfluxDB installer above

### Generating the MSI

First, we need to use candle to create our intermmediate object that will turn into an msi file.

```
candle.exe -nologo chronograf.wxs -out chronograf.wixobj  -ext WixUtilExtension  -ext WixUIExtension
```

Now we can generate the msi file with this command:

```
light.exe -nologo chronograf.wixobj -out chronograf.msi  -ext WixUtilExtension  -ext WixUIExtension
```


## Telegraf Windows Packager

This project uses the [Wix Toolset](http://wixtoolset.org/) to generate a windows msi installer. All of the scripts to build
the Telegraf MSI installer are located in the `telegraf` directory

Directions are the similar to the InfluxDB installer above

