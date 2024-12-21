# Build csharp projects in Kali

### Build image to generate workspace
`docker build -t dotnet-genproject -f  Dockerfile-genproject .`

### Build image for compiling
`docker build -t dotnet-builder .`

### Make workspace directory
`mkdir workspace`

### Run image to generate workspace
`docker run --rm -v $(pwd)/workspace:/workspace dotnet-genproject`

### Edit code
Change Program.cs with code like [this](Program_example.cs). This is an example to perform process hollowing.

### Run image to compile
`docker run --rm -v $(pwd)/workspace:/workspace dotnet-builder`

For the .NET Docker SDK docs look [here](https://github.com/dotnet/dotnet-docker/blob/main/README.sdk.md) and [here](https://hub.docker.com/r/microsoft/dotnet-sdk), though Microsoft seems to be all over the place with this.

[Here](https://learn.microsoft.com/en-us/dotnet/core/deploying/single-file/overview?tabs=cli) is some information about compilation flags.

*Warning*: .NET is a framework that requires the right runtime version to work. The Dockerfile uses version `6.0`, and we compile with flags `--self-contained` and `PublishSingleFile`. This packs the runtime into the binary, resulting in a binary of over 60MB. If you want smaller binaries, you need to know the .NET version to compile against.
