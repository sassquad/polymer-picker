# Polymer Picker (BBC Basic only version)
An arcade game for the BBC Microcomputer, with an ecological message.

## About the game

This is the original BBC Basic version of the game. Development on a BBC Basic/assembler version progressed to a formal release in December 2022. I am now trying to get this original version to a formal release, so that anyone interested in retro games programming can browse the two versions, and get some insight into retro games development.

However, previous versions can be downloaded from the [game's dedicated Stardot thread](https://stardot.org.uk/forums/viewtopic.php?f=53&t=23615).

## How to build from source

Although the disc image is included here, there are files included to help you build your own copy of the game. You will require the following:

* [Beebasm](https://github.com/stardot/beebasm)

On more recent versions of Mac OS, Beebasm must be rebuilt from source, in order to run in the 64-bit environment. 

This repo includes the build process employed on my Apple iMac, which not only includes a build of BeebAsm, but the following tools/software:

* [b2 emulator](https://github.com/tom-seddon/b2)
* [Visual Studio Code](https://github.com/microsoft/vscode) (using the [Beeb VSC extension](https://github.com/simondotm/beeb-vsc), which offers some BASIC syntax highlighting)

VS Code's Tasks feature is employed to good effect here, by allowing a 'build' and 'test' task, the former runs the shell script `build.sh` which kicks beebasm, containing the following script:

`beebasm -i Polymer-Picker-Basic.asm -do PPBasic.ssd -opt 3 -title PPBasic`

The `Polymer-Picker-Basic.asm` file consists of the following:

```
PUTBASIC "src/POLY1.bas","POLY1"
PUTBASIC "src/POLY2.bas","POLY2"
PUTTEXT "src/BOOT.txt", "!BOOT",&FFFF
```

This takes the files within the `src` folder, and outputs them in the correct format, prior to building the disc image. 

The invocation of the bootfile, to make the disc autorun, was until recently, the missing element from making this disc image complete. This is due to BeebAsm's normal staple being the building of 6502 code files, invoked via `*RUN`. This approach doesn't work with BASIC files, as these are normally run with the `CHAIN` command, so it required a bit more Googling to find the correct way to build the bootfile for the game. 

Essentially, the `beebasm` call includes the `-opt 3` flag, that enables the disc image to be executable. The following line:

`PUTTEXT "src/BOOT.txt", "!BOOT",&FFFF`

within `Polymer-Picker.asm`, ensures the bootfile is created with the correct hooks to allow it to work.

The bootfile itself is fairly standard:

```
*BASIC
PAGE=&1900
*FX21
CLOSE#0:CHAIN "POLY1"
```

This boot content appears on a lot of disc images within the BBC Micro Game Archive's disc images, and basically ensures the computer, or emulator is all set up correctly, and has no 'open' files to corrupt disc images, prior to running the disc image. At least, that's what I believe.

I have not yet performed this build on the Windows platform, so I will be performing some further amends if the `tasks.json` file is not set up correctly.

Thanks for reading. I am really hopeful that this version of the game will get finished in early 2023. In the meantime, I hope you enjoy what you find. All feedback is welcome.
