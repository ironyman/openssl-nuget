set PATH=%PATH%;C:\Program Files\NASM;C:\Strawberry\perl\bin\

git clone https://github.com/openssl/openssl.git -b OpenSSL_1_1_1d

mkdir VC-WIN64A-debug
pushd VC-WIN64A-debug
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars64.bat
perl ..\openssl\Configure VC-WIN64A
nmake
popd

mkdir VC-WIN64A-release
pushd VC-WIN64A-release
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars64.bat
perl ..\openssl\Configure VC-WIN64A --release
nmake
popd

mkdir VC-WIN32-debug
pushd VC-WIN32-debug
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars32.bat
perl ..\openssl\Configure VC-WIN32
nmake
popd

mkdir VC-WIN32-release
pushd VC-WIN32-release
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars32.bat
perl ..\openssl\Configure VC-WIN32 --release
nmake
popd

nuget pack package.nuspec -verbosity detailed