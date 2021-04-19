<h1 align="center">
HeLL0 w0Rld ¯\_(ツ)_/¯
</h1>

<p align="center">
<img src="https://github.com/ri7nz/.dotifiles/blob/master/docs/demo.gif" alt="System Information" />
</p>


My personal setup `dotfiles`

> manage with **[yadm](https://yadm.io/)** and take screenshot with **[KDE - spectacle](https://github.com/KDE/spectacle)**.
   

## Daftar Isi

<!-- vim-markdown-toc GFM -->

* [Motivasi](#motivasi)
* [Alat Pengembang](#alat-pengembang)
  * [Umum](#umum)
  * [Package Manager](#package-manager)
    * [Homebrew (OSX)](#homebrew-osx)
  * [Kredensial](#kredensial)
  * [**Terminal**](#terminal)
    * [**Shell (ZSH)**](#shell-zsh)
      * [Benchmark](#benchmark)
    * [**Editor (VIM)**](#editor-vim)
* [Preview](#preview)
  * [Linux](#linux)

<!-- vim-markdown-toc -->

## Motivasi
`(DRY) - Don't repeat yourself` sebuah prinsip dalam pengembangan perangkat lunak (software development). Prinsip tersebut harusnya kita gunakan untuk mengurangi pekerjaan yang berulang-ulang dan menghabiskan waktu. Secara pribadi saya hanya mencoba menerapkan prinsip tersebut dalam bekerja. Contoh paling dasar yakni membuat `dotfiles` ini, yah gunannya agar saya tak perlu menyediakan kebutuhan perangkat atau alat yang digunakan dalam sehari - hari. Maka, dari [motivasi](#motivasi) ini kamu dapat melihat tujuan utamanya (Goal).
   
Pekerjaan seorang pengembang perangkat lunak, perekayasa perangkat lunak, atau buruh perangkat lunak membutuhkan alat yang digunakan diatas sebuah sistem yang berjalan (biasanya kita sebut sistem operasi atau `OS`). Saya familiar dalam menggunakan sistem operasi seperti `OSX` yang berbasis `Darwin/unix` besutan si buah apple dan `ArchLinux` yang berbasis `Linux`. Yah tujuan saya untuk menjadi seorang ~~manusia~~ pengguna yang agnostik (tidak ~~beragama~~ terikat pada sebuah sistem tetapi tetap setia kepada ~~pencipta~~ pengguna, kecuali sistem operasi buatan Mikocok). Alat - alat tersebut dikumpulkan dalam satu tempat untuk menyimpan segala hal mengenai alat - alat, konfigurasi, pengaturan, kredensial, dan lain - lain yang menunjang kebutuhan bekerja atau sekedar mengoperasikan komputer. Wadah saya dimana ? di [github ini](https://github.com/ri7nz/.dotifiles), maka kita memerlukan **_git_** atau alat lain, yang jelas kita tetap sinkron diantara setiap mesin yang kita gunakan sehingga kita tidak melakukan hal yang berulang-ulang.

> Inti: dengan adanya dotfiles kita mengurangi waktu (setup) atau menyiapkan kebutuhan sebelum kita bekerja pada mesin baru atau yang sudah kita gunakan

> referensi [Dotfiles](https://wiki.archlinux.org/index.php/Dotfiles#User_repositories) dari [ArchWiki](https://wiki.archlinux.org)

## Alat Pengembang
Alat - alat yang saya gunakan seperti apa, berikut: 

### Umum
   
> umum yah, tidak pakai 🐷

| *                   | Nama          | OSX   | Linux  |
|---------------------|---------------|-------|--------|
| Dotfiles Manager    | yadm          | ✅    | ✅     |
| Shell               | zsh           | ✅    | ✅     |
| Multiplexer         | tmux          | ✅    | ✅     |
| Editor              | vim/neovim    | ✅    | ✅     |
| Monitor             | polybar       | ❌    | ✅     |
| Window Manager (WM) | I3            | ❌    | ✅     |
| Terminal            | Alacritty     | ✅    | ✅     |
|                     | iTerm2        | ✅    | ❌     |
| Mail                | Mail          | ✅    | ❌     |
| Browser             | Chrome        | ✅    | ✅     |
|                     | Firefox       | ✅    | ✅     |
|                     | Safari        | ✅    | ❌     |

### Package Manager

#### Homebrew (OSX)
Homebrew merupakan paket menejer yang digunakan pada sistem operasi (OXS). Ketika saya menggunakan perangkat Macbook maka `Homebrew` yang bakalan jadi teman setia. 
Berikut perintah yang sering saya gunakan untuk `dump` setiap paket yang sudah saya pasang pada perangkat yang saya gunakan
```shell

# backup
❯ brew bundle dump --file=~/.Brewfile

# restore / install
❯ brew bundle --file=~/.Brewfile

```

### Kredensial 
> kenapa harus plain-text kalau bisa otomatis  

![login](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.github.com/ri7nz/.dotifiles/master/docs/login.txt)

* Login
  * **Password** : kata-sandi (password) saya tidak menyimpan diingatan, melainkan saya menyimpan pada sebuah aplikasi bernama `pass` 
  * **2FA/OTP** : saya menggunakan `authy` (paling sering) dan `bitwarden`. dan saya sangat menghindari menggunakan 2FA/OTP pada layanan pesan singkat (SMS) karena alasan pribadi yang sebenarnya tidak jelas.

<p align="center">
<img 
src="https://github.com/ri7nz/.dotifiles/blob/master/docs/password-manager.png" alt="Password manager" />
</p>

Berikut daftar alat yang digunakan untuk kebutuhan "Rahasia" atau kredensial dalam sebuah platform atau peramban web


| *                | Nama                                                    | OSX | Linux |
|------------------|---------------------------------------------------------|-----|-------|
| Privacy          | gnugpg                                                  | ✅  | ✅    |
| Password Manager | pass (require gpg and version control such git or host) | ✅  | ✅    |
| 2fa / OTP / TOTP | Authy                                                   | ✅  | ✅    |
|                  | Bitwarden                                               | ✅  | ✅    |

Referensi: 
- https://en.wikipedia.org/wiki/Multi-factor_authentication
- https://en.wikipedia.org/wiki/Time-based_One-Time_Password
- https://en.wikipedia.org/wiki/GNU_Privacy_Guard 
- https://en.wikipedia.org/wiki/Pretty_Good_Privacy


### **Terminal**

> [tmux](https://github.com/tmux/tmux), alacritty, iTerm2

<p align="center">

<img alt="current - MacbookPro13 M1" src="https://github.com/ri7nz/.dotifiles/blob/master/docs/sample-mac-fetch.png"/>

<img alt="Thinkpad - Archlinux " src="https://github.com/ri7nz/.dotifiles/blob/master/docs/current.png" alt="System Information" />


</p>

<p align="center">

<a href="https://iterm2.com/">
<img alt="iTerm2 with Tmux" src="https://github.com/ri7nz/.dotifiles/blob/master/docs/sample-mac-tmux.png"/>
</a>


<a href="https://github.com/alacritty/alacritty">
<img alt="Alacritty with Tmux" src="https://github.com/ri7nz/.dotifiles/blob/master/docs/sample-linux.png"/>
</a>

</p>


#### **Shell (ZSH)**

> zsh with zinit for better performance

##### Benchmark

* MacbookPro17,1 Memory 8GB (arm64  M1) 
   
```zsh
0.23 real         0.12 user         0.08 sys
0.15 real         0.10 user         0.04 sys
0.15 real         0.10 user         0.04 sys
0.15 real         0.10 user         0.04 sys
0.15 real         0.10 user         0.04 sys
0.15 real         0.10 user         0.04 sys
0.16 real         0.11 user         0.04 sys
0.17 real         0.10 user         0.04 sys
0.15 real         0.10 user         0.04 sys
0.15 real         0.10 user         0.04 sys
```
   
* MacbookPro2019 Memory 8GB (intel)
  
```zsh
0.28 real         0.19 user         0.08 sys
0.28 real         0.19 user         0.07 sys
0.29 real         0.19 user         0.08 sys
0.27 real         0.19 user         0.07 sys
0.27 real         0.19 user         0.07 sys
0.27 real         0.19 user         0.07 sys
0.29 real         0.19 user         0.07 sys
0.28 real         0.19 user         0.07 sys
0.28 real         0.19 user         0.07 sys
0.27 real         0.19 user         0.07 sys
``` 
   
* Thinkpad T430 (old-configuration)
   
```zsh
0.46 real         0.31 user         0.13 sys
0.45 real         0.31 user         0.12 sys
0.43 real         0.30 user         0.12 sys
0.44 real         0.31 user         0.12 sys
0.44 real         0.30 user         0.12 sys
0.43 real         0.30 user         0.11 sys
0.43 real         0.30 user         0.11 sys
0.43 real         0.30 user         0.12 sys
0.43 real         0.30 user         0.12 sys
0.44 real         0.30 user         0.12 sys
```
   

#### **Editor (VIM)**
> vim-plug (vim plugin manager), intelisense (COC)

<p align="center">
<img 
src="https://github.com/ri7nz/.dotifiles/blob/master/docs/sample-mac.png" alt="Editor - Vim" />
</p>


## Preview

### Linux
<details>
<summary>Click Me</summary>
<p align="center">
<h3> Linux - Menu with Rofi</h2>
<a href="#">
<img src="https://github.com/ri7nz/.dotifiles/blob/master/docs/sample-linux-menu.png"/>
</a>
</p>

<p align="center">
<h3> Linux - Clipboard Manager with Rofi + greenclip</h2>
<a href="#">
<img src="https://github.com/ri7nz/.dotifiles/blob/master/docs/sample-linux-clipboard.png"/>
</a>
</p>
</details>
