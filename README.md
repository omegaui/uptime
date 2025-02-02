# Uptime

https://github.com/user-attachments/assets/8f6274f1-18b9-4f26-8694-257ce0428bbc

<div align="center">
  <img src="assets/icons/nakime-256.png"/>
  <p>Nakime's mini cli alternative</p>
</div>

## Description
As the name goes, 'session-uptime' is a cli version of '[Nakime](https://github.com/omegaui/nakime)' with capability limited to only accessing the live session uptime.
If you have already installed Nakime, then, 'session-uptime' is already installed on your system.
Open your terminal and run `session-uptime --version` to verify this.

## Building from source
Make sure to have the following version of Dart SDK installed:
```sh
Dart SDK version: 3.5.4 (stable) (Wed Oct 16 16:18:51 2024 +0000) on "windows_x64"
```

You just need to run either the [compile-exe.ps1](compile-exe.ps1) script
or the following dart command:

```sh
dart compile exe --target-os windows .\lib\main.dart --output session-uptime.exe
```

## Usage
Here's the output of `session-uptime --help` command.
```sh
session-uptime is a cli tool to check current session duration,
moreover, this tool is just a part of Nakime Windows Service,
for a full fledged UI checkout https://github.com/omegaui/nakime

usage: session-uptime [options]
options:

--version                       Prints tool version.
--short                         Prints duration in short format. Example: 2 d 1 h 5 m 10 s
--hours                         Prints elapsed hours in decimal format. Example: 2.5 which equals to 2 hours 30 minutes
--time                          Prints time at which session was started. Example: 31/01/2025 09:25:21 PM
--time                          Prints time along with duration. Example: 31/01/2025 09:25:21 PM (1 h 15 m 17 s)
--millisecondsSinceEpoch        Prints millisecond since epoch. Example: 1738338921000
--help                          Prints this help message
```

If you like the project, consider giving it a star, this way GitHub will show it to more users.