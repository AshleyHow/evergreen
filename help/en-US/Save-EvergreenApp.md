---
external help file: Evergreen-help.xml
Module Name: Evergreen
online version: https://stealthpuppy.com/evergreen/save.html
schema: 2.0.0
---

# Save-EvergreenApp

## SYNOPSIS

Downloads target URIs passed to this function from `Get-EvergreenApp` into a folder structure.

## SYNTAX

```
Save-EvergreenApp [-InputObject] <PSObject> [[-Path] <String>] [[-Proxy] <String>]
 [[-ProxyCredential] <PSCredential>] [-Force] [-NoProgress] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

Saves target URLs passed to this function from `Get-EvergreenApp` output to into a folder structure below -Path using the properties from the object passed to the function.

`Get-EvergreenApp` will return an object that may include application properties including (in the following order) - Product, Track, Channel, Release, Ring, Version, Language, and (processor) Architecture. Only properties that exist on the target object will be used.

This simplifies saving the target application installers or updaters into a consistent folder structure without having to build the target folder structure yourself or deal with other functions to download the file.

## EXAMPLES

### EXAMPLE 1

```powershell
Get-EvergreenApp -Name "AdobeAcrobat" | Save-EvergreenApp -Path "C:\Temp\Adobe"
```

Description:
Downloads all of the URIs returned by `Get-AdobeAcrobat` to a folder structure below C:\Temp\Adobe\<version>.

## PARAMETERS

### -InputObject

`Save-EvergreenApp` accepts the PSObject from `Get-EvergreenApp`. `Save-EvergreenApp` will test for the existence of at least these properties - Version and URI.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Path

The target directory under which a folder structure will be created and application installers saved into. Typically the target path used will be a path per application.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: (Resolve-Path -Path $PWD)
Accept pipeline input: False
Accept wildcard characters: False
```

### -Proxy

Specifies a proxy server for the request, rather than connecting directly to the internet resource. Enter the URI of a network proxy server. Note - this is experimental support for proxies.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProxyCredential

Specifies a user account that has permission to use the proxy server that is specified by the Proxy parameter. The default is the current user.

Type a user name, such as User01 or Domain01\User01, User@Domain.Com, or enter a `PSCredential` object, such as one generated by the `Get-Credential cmdlet`.

This parameter is valid only when the Proxy parameter is also used in the command. Note - this is experimental support for proxies.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: [System.Management.Automation.PSCredential]::Empty
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoProgress

`Save-EvergreenApp` uses `Invoke-WebRequest` to download target application installers. Download progress is suppressed by default for faster downloads; however, when `-Verbose` is used, download progress will be displayed. Use `-NoProgress` with `-Verbose` to suppress download progress while also displaying verbose output.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf

Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force

Forces this function to download the target application installers from the URI property even if they already exist in the target directory.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Management.Automation.PSObject

Save-EvergreenApp accepts the output from Get-EvergreenApp.

## OUTPUTS

### System.Management.Automation.PSObject

Provides a list of paths of the downloaded target files.

## NOTES

Site: https://stealthpuppy.com
Author: Aaron Parker
Twitter: @stealthpuppy

## RELATED LINKS

[Download application installers:](https://stealthpuppy.com/evergreen/save.html)
