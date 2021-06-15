


HeLL0 w0Rld \_(ツ)_/¯



System Information



My personal setup `dotfiles`

> manage with **[yadm](https://yadm.io/)** and take screenshot with **[KDE - spectacle](https://github.com/KDE/spectacle)**.
   

## Table of contents


   

* [Motivation](#motivation)
* [Developer Tools](#developer-tools)
  * [General](#general)
  * [Package Manager](#package-manager)
    * [Homebrew (OSX)](#homebrew-osx)
  * [Credentials](#credentials)
  * [**Terminal**](#terminal)
    * [**Shell (ZSH)**](#shell-zsh)
      * [Benchmark](#benchmark)
    * [**Editor (VIM)**](#editor-vim)
* [Preview](#preview)
  * [Linux](#linux)


   

## Motivation
`(DRY) - Don't repeat yourself` a principle in software development. We should use this principle to reduce repetitive and time-consuming work. Personally I just try to apply these principles at work. The most basic example is making these `dotfiles`, well the point is that I don't have to provide the equipment or tools I use in my daily life. So, from this [motivation](#motivation) you can see the main goal (Goal).
   
The job of a software developer, software engineer, or software worker requires tools to be used on top of a running system (usually we call an operating system or 'OS'). I am familiar with using operating systems such as `OSX` which is based on `Darwin/unix` made by Apple and `ArchLinux` which is based on `Linux`. Well my goal is to become a ~~human~~ user agnostic (not ~~religious~~ bound to a system but still loyal to ~~creator~~ users, except for the operating system made by Mikocok). These tools are collected in one place to store everything about tools, configurations, settings, credentials, and others that support the needs of working or just operating a computer. Where is my container? on [this github](https://github.com/ri7nz/.dotifiles), then we need **_git_** or other tools, which obviously we keep in sync between every machine we use so we don't do things over and over again.

> The bottom line: with dotfiles we reduce setup time or prepare needs before we work on new or existing machines

> reference [Dotfiles](https://wiki.archlinux.org/index.php/Dotfiles#User_repositories) from [ArchWiki](https://wiki.archlinux.org)

## Developer Tools
The tools I use are as follows: 

### General
   
> common, don't use

| * | Name | OSX | Linux |
|---------------------|--------------|-------|--- -----|
| Dotfiles Manager | yadm | | |
| Shell | zsh | | |
| Multiplexer | tmux | | |
| Editor | vim/neovim | | |
| Monitors | polybar | | |
| Window Manager (WM) | I3 | | |
| Terminals | Alacritty | | |
| | iTerm2 | | |
| Mail | Mail | | |
| Browsers | Chrome | | |
| | Firefox | | |
| | Safaris | | |

### Package Manager

#### Homebrew (OSX)
Homebrew is a package manager used in the operating system (OXS). When I use a Macbook, `Homebrew` will be my loyal friend.
Here's the command I often use to `dump` every package I have installed on the device I use
```shell

# backup
brew bundle dump --file=~/.Brewfile

# restore / install
brew bundle --file=~/.Brewfile

```

### Credentials 
> why should it be plain-text when it can be automatic  

![login](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.github.com/ri7nz/.dotifiles/master/docs/login.txt)

* Login
  * **Password** : my password is not stored in memory, but I store it in an application called `pass` 
  * **2FA/OTP** : I use `authy` (most often) and `bitwarden`. and I strongly avoid using 2FA/OTP on short message services (SMS) for reasons that are not really clear.


Password manager


Here's a list of tools used for "Secret" or credential needs in a platform or web browser


| * | Name | OSX | Linux |
|--------------------------|------------------------------ ----------------------------|-----|-------|
| Privacy | gnugpg | | |
| Password Manager | pass (require gpg and version control such git or host) | | |
| 2fa / OTP / TOTP | Authy | | |
| | Bitwarden | | |

Reference: 
- https://en.wikipedia.org/wiki/Multi-factor_authentication
- https://en.wikipedia.org/wiki/Time-based_One-Time_Password
- https://en.wikipedia.org/wiki/GNU_Privacy_Guard 
- https://en.wikipedia.org/wiki/Pretty_Good_Privacy


### **Terminal**

> [tmux](https://github.com/tmux/tmux), alacritty, iTerm2



current - MacbookPro13 M1

System Information






 iTerm2 with Tmux 


 Alacritty with Tmux 




#### **Shell (ZSH)**

> zsh with zinit for better performance

##### Benchmarks

* Macbook Pro17.1 Memory 8GB (arm64 M1) 
   
```zsh
0.23 real 0.12 user 0.08 sys
0.15 real 0.10 user 0.04 sys
0.15 real 0.10 user 0.04 sys
0.15 real 0.10 user 0.04 sys
0.15 real 0.10 user 0.04 sys
0.15 real 0.10 user 0.04 sys
0.16 real 0.11 user 0.04 sys
0.17 real 0.10 user 0.04 sys
0.15 real 0.10 user 0.04 sys
0.15 real 0.10 user 0.04 sys
```
   
* Macbook Pro2019 Memory 8GB (intel)
  
```zsh
0.28 real 0.19 user 0.08 sys
0.28 real 0.19 user 0.07 sys
0.29 real 0.19 user 0.08 sys
0.27 real 0.19 user 0.07 sys
0.27 real 0.19 user 0.07 sys
0.27 real 0.19 user 0.07 sys
0.29 real 0.19 user 0.07 sys
0.28 real 0.19 user 0.07 sys
0.28 real 0.19 user 0.07 sys
0.27 real 0.19 user 0.07 sys
``` 
   
* Thinkpad T430 (old-configuration)
   
```zsh
0.46 real 0.31 user 0.13 sys
0.45 real 0.31 user 0.12 sys
0.43 real 0.30 users 0.12 sys
0.44 real 0.31 user 0.12 sys
0.44 real 0.30 users 0.12 sys
0.43 real 0.30 user 0.11 sys
0.43 real 0.30 user 0.11 sys
0.43 real 0.30 users 0.12 sys
0.43 real 0.30 users 0.12 sys
0.44 real 0.30 users 0.12 sys
```
   

#### **Editor (VIM)**
> vim-plug (vim plugin manager), intelisense (COC)


Editor - Vim



## Preview

### Linux

   


    
Click Me


    
    

    

    


    
    

    

    

   

