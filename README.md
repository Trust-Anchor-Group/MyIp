MyIp
=======

A simple service for the TAG Neuron(R) that displays the IP address for the user, together with 
Locale information available related to the IP address. The service contains both a web page 
displaying this information, together with an Open Street Map showing the location of the IP 
address, as well as a REST API web service providing this information using the Content-Type 
requested by the caller.

Installable Package
----------------------

The contents of the `MyIp` project is available in an installable package that you can install on
your Neuron(R).

| Package information                                                                                                              ||
|:-----------------|:---------------------------------------------------------------------------------------------------------------|
| Package          | `TAG.MyIp.package`                                                                                             |
| Installation key | `6JhQ0GmZDvU2WOurrWl7OQnZi4wGVz4TVBM2weW3+CBYMpiFZoMSlNyuELpERcAx+xfo7Lcy3gyA74b47c1e8ff549ed7b1e5df9453592a2` |


Project Files
----------------

| File           | Description                                                                                                                                      |
|:---------------|:-------------------------------------------------------------------------------------------------------------------------------------------------|
| `Root\MyIp.md` | Displays the user's IP address on a web page, together with associated meta-data. The web page contains an interactive map showing the location. |
| `Root\MyIp.ws` | A REST API web service returning the user's IP address, together with associated meta-data.                                                      |

Gateway.config
-----------------

To simplify development, once the project is cloned, add a `FileFolder` reference
to your repository folder in your [gateway.config file](https://lab.tagroot.io/Documentation/IoTGateway/GatewayConfig.md). 
This allows you to test and run your changes to Markdown and Javascript immediately, 
without having to synchronize the folder contents with an external 
host, or recompile or go through the trouble of generating a distributable software 
package just for testing purposes.

Example of how to point a web folder to your project folder:

```
<FileFolders>
  <FileFolder webFolder="/MyIp" folderPath="C:\My Projects\MyIp\Root"/>
</FileFolders>
```

**Note**: Once the file folder reference is added, you need to restart the IoT Gateway service for 
the change to take effect.

**Note 2**:  Once the gateway is restarted, the source for the files is in the new location. Any 
changes you make in the corresponding `ProgramData` subfolder will have no effect on what you see 
via the browser.

**Note 3**: This file folder is only necessary on your developer machine, to give you real-time 
updates as you edit the files in your developer folder. It is not necessary in a production 
environment, as the files are copied into the correct folders when the package is installed.

**Note 4**: The example page is available directly at the root (`/MyIp.md` for example) on a 
Neuron(R) with the package installed. But, with a `FileFolder` reference, you need to access the
project page via the web folder you specified in the `FileFolder` element (`/MyIp/MyIp.md` in
this example).
