FROM mcr.microsoft.com/dotnet/sdk:6.0

WORKDIR /workspace

ENTRYPOINT ["dotnet", "publish", "-c", "Release", "-r", "win-x64", "--self-contained", "-p:PublishSingleFile=true"]

