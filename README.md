# Windows AutomateInstall
## _by JustDj_

## FileTree

```bash
├── to_flash_drive
    ├── _Copy_
        ├── to_Desktop
		├── place files to copy to Desktop
	├── to_Documents
		├── place files to copy to Documents
    ├── sources
        ├── $OEM$
            ├── $$
                ├── Setup
                    ├── Scripts
                        ├── SetupComplete.cmd
            ├── $1
                ├── Install
			├──  _Logs
				├──  
			├── apps
				├──  EXE files to install
			├── powershell
				├──  PowerShell scripts
			├── bats
				├── bats_HERE
					├──  place .bat's files HERE
			├── Wifi_Profile
				├── place Wi-fi profiles HERE
   ├── autounattend.xml
├── README.md
└── .gitignore
```

## Instruction

### Copy programs to dir

If you want to add files witch will be copied to System Drive (```C:\Install```) copy the needed files to

```ssh 
to_flash_drive\sources\$OEM$\$1\Install\apps
```

### Install programs (BEFORE you will see the desktop)


> Be careful here. If something goes wrong - it can handle the next steps and you must push the reset button on the PC

> These apps will be installed from the system - not from the user! Some apps need to be installed from the user!


If you need to install them BEFORE you will see the desktop (prepare screen) open file
```ssh 
to_flash_drive\sources\$OEM$\$$\Setup\Scripts\SetupComplete.cmd
```


This write your info to file
```ssh 
echo [TEXT] >>%systemdrive%\[PATH_TO_LOG]\[NAME].[EXT]
```


This will start install/run nedded runable file (exe, msi, etc)
```ssh 
start /wait "" "%systemdrive%\[PATH_TO_FILE]\[NAME].[EXT]" [FLAGS_FOR_EXE]
```


you can add ```>>%systemdrive%\[PATH_TO_LOG]\[NAME].[EXT]``` to the end of any row if you want to see info/text in the log file

### Do anything else after showing desktop

Open 
```ssh 
to_flash_drive\autounattend.xml
```


Find block ```FirstLogonCommands```

                <SynchronousCommand wcm:action="add">
                    <Order>[NUMBER]</Order>
                    <RequiresUserInput>[TRUE_OR_FALSE]</RequiresUserInput>
                    <CommandLine>[DO_SOMETHING]</CommandLine>
                    <Description>[TEXT]</Description>
                </SynchronousCommand>




|                |Sample                         |Description                         |
|----------------|-----------------------------|-----------------------------|
|Block starts|`<SynchronousCommand wcm:action="add">`||
|Order|`<Order>500/Order>`|The number must not repeat and bigger than 500|
|RequiresUserInput          |`<RequiresUserInput>true</RequiresUserInput>`| Boolean. `True` - the "Preparing Your Desktop" screen is removed, allowing users to reach the desktop more quickly and provide input. `False` - the desktop does not appear until first logon command is complete, or until two minutes pass
|Command|`<CommandLine>cmd /C powershell.exe -File &quot;%SystemDrive%\Install\powershell\UpdateDrivers.ps1&quot; -noninteractive -windowstyle hidden</CommandLine>` | Put here needed command. `"` must be replaced by `&quot;`
|Description|`<Description>Update Drivers</Description>`| Just text |
|Block end|`</SynchronousCommand>`
