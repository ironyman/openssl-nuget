# Dependencies
Run as admin
```
choco install -y strawberryperl nasm git nuget.commandline
```
Also install VS2019.
# Build
Run `build.bat`

```
D:\openssl-nuget>VC-WIN64A-debug\apps\openssl.exe version -a
OpenSSL 1.1.1d  10 Sep 2019
built on: Tue Oct 15 01:58:15 2019 UTC
platform: VC-WIN64A
options:  bn(64,64) rc4(16x,int) des(long) idea(int) blowfish(ptr)
compiler: cl /Zi /Fdossl_static.pdb /Gs0 /GF /Gy /MD /W3 /wd4090 /nologo /O2 -DL_ENDIAN -DOPENSSL_PIC -DOPENSSL_CPUID_OBJ -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DKECCAK1600_ASM -DRC4_ASM -DMD5_ASM -DVPAES_ASM -DGHASH_ASM -DECP_NISTZ256_ASM -DX25519_ASM -DPOLY1305_ASM
OPENSSLDIR: "C:\Program Files\Common Files\SSL"
ENGINESDIR: "C:\Program Files\OpenSSL\lib\engines-1_1"
Seeding source: os-specific
```

This outputs nuget package in same directory as `build.bat`. The directory where the package lives is the source directory for nuget cli.

# Install in solution first time
Run in VS package manager console
```
install-package openssl-win64a -source d:\openssl-nuget
```
This one doesn't work for some reason
```
cd D:\openssl-nuget\test\openssl-test\
nuget install openssl-win64a -outputdirectory packages -source d:\openssl-nuget
```
The above commands change .vcproj and packages.config to include the nuget package. It also copies contents of the nuget package to packages directory.
## After first time install, reinstall nuget package after cloning
In command prompt, solution directory
```
nuget restore -source d:\openssl-nuget
```