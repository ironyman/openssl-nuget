git clone https://github.com/openssl/openssl.git -b OpenSSL_1_1_1d

mkdir build
pushd build
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars64.bat
set PATH=%PATH%;C:\Program Files\NASM;C:\Strawberry\perl\bin\
perl ..\openssl\Configure VC-WIN64A
nmake
popd

nuget pack package.nuspec -verbosity detailed