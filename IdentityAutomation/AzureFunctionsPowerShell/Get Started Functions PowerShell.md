# Getting Started with Azure Functions PowerShell

This information is useful when getting started with Azure Functions PowerShell in Visual Studio Code.

## Tools and Environment Setup Requirements

* An Azure account with an active subscription. Create an account for free.
* The Azure Functions Core Tools version 4.x.
* PowerShell 7
* .NET Core 3.1 runtime
* Visual Studio Code on one of the supported platforms.
* The PowerShell extension for Visual Studio Code.
* The Azure Functions extension for Visual Studio Code.

https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-vs-code-powershell

### Install Functions Core Tools

This can be installed using MSI, or you can dependent on the OS install via Node Package Manager (Windows), Brew (MacOS) or Sudo (Linux).

```dotnetcli
npm install -g azure-functions-core-tools@4 --unsafe-perm true
```

### .NET Core 3.1 Runtime ++ (Out of support?)

So 3.1 is out of support, but as per today still needs to be installed via link below:

```dotnetcli
winget install Microsoft.DotNet.Runtime.7
winget install Microsoft.DotNet.Runtime.6
winget install Microsoft.DotNet.SDK.7
https://aka.ms/dotnet-core-applaunch?framework=Microsoft.NETCore.App&framework_version=3.1.0&arch=x64&rid=win10-x64

```
