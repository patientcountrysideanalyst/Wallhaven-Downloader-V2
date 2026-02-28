# Wallhaven Downloader
![Screenshot](https://github.com/intel777/Wallhaven-Downloader-V2/blob/master/2020-11-19_20-53-33-Wallhaven_Downloader_V2.png?raw=true)<br>
Full-featured API based Wallhaven downloader written with C# and Windows Forms 

## About
It's been couple of years after first version of Wallhaven Downloader that was writen even before Wallhaven had an API. 
This is Wallhaven Downloader V2. Completely rewriten from scratch, and now uses Wallhaven API and it's all avaliable features.

## Features
* Everything that API provides (including search masks) -> [Here](https://wallhaven.cc/help/api)
* Threading

## Logging in
Logging in is not necessary, but requiered to access NSFW images and load your saved preferences.<br>
If you don't want to login, simply press "Login" button without actually enetering token.<br>


## Everything else
C# is not my main language so code may be garbage, pull requests are welcomed as well as bug reports, etc.

## Linux publish commands

> This repository is currently a **.NET Framework 4.7.2 Windows Forms** app. Linux publishing requires migrating to modern .NET (for example `net8.0`) and replacing Windows Forms with a Linux-compatible UI or a CLI flow.

A helper script is included for Linux publish workflows once migration is completed:

```bash
./scripts/publish-linux.sh linux-x64 publish
```

Equivalent direct commands:

```bash
# Framework-dependent
 dotnet publish "Wallhaven Downloader V2/Wallhaven Downloader V2.csproj" -c Release -r linux-x64 --self-contained false -o publish/linux-x64/framework-dependent

# Self-contained
 dotnet publish "Wallhaven Downloader V2/Wallhaven Downloader V2.csproj" -c Release -r linux-x64 --self-contained true -o publish/linux-x64/self-contained

# Single-file self-contained
 dotnet publish "Wallhaven Downloader V2/Wallhaven Downloader V2.csproj" -c Release -r linux-x64 --self-contained true -p:PublishSingleFile=true -o publish/linux-x64/single-file
```

On Linux, make the produced host binary executable:

```bash
chmod +x publish/linux-x64/single-file/Wallhaven\ Downloader\ V2
./publish/linux-x64/single-file/Wallhaven\ Downloader\ V2
```
