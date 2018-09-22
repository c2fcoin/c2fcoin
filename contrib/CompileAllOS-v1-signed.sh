
cd depends;
make download;make download-osx;make download-win;make download-linux;
make HOST=x86_64-pc-linux-gnu;
make HOST=i686-pc-linux-gnu;
make HOST=x86_64-w64-mingw32;
make HOST=i686-w64-mingw32;
make HOST=aarch64-linux-gnu;
make HOST=arm-linux-gnueabihf;
make HOST=x86_64-apple-darwin11;
make HOST=host-platform-triplet;

cd ..;
# x86_64-pc-linux-gnu
./autogen.sh;
./configure --prefix=`pwd`/depends/x86_64-pc-linux-gnu
make
mkdir -p build/v0.0.0.1/x86_64-pc-linux-gnu;
cp ./src/c2fcoind ./build/v0.0.0.1/x86_64-pc-linux-gnu/c2fcoind;
cp ./src/qt/c2fcoin-qt ./build/v0.0.0.1/x86_64-pc-linux-gnu/c2fcoin-qt;
strip ./build/v0.0.0.1/x86_64-pc-linux-gnu/c2fcoind
strip ./build/v0.0.0.1/x86_64-pc-linux-gnu/c2fcoin-qt
## created detached signatures
cd build/v0.0.0.1/x86_64-pc-linux-gnu;

gpg --detach-sign -o c2fcoin-qt.sig c2fcoin-qt
gpg --verify c2fcoin-qt.sig

gpg --armor --detach-sign -o c2fcoind.sig c2fcoind
gpg --verify c2fcoind.sig
cd ../../..;

make clean;cd src;make clean;cd ..;

# i686-pc-linux-gnu
./autogen.sh;
./configure --prefix=`pwd`/depends/i686-pc-linux-gnu
make
mkdir -p build/v0.0.0.1/i686-pc-linux-gnu;
cp ./src/c2fcoind ./build/v0.0.0.1/i686-pc-linux-gnu/c2fcoind;
cp ./src/qt/c2fcoin-qt ./build/v0.0.0.1/i686-pc-linux-gnu/c2fcoin-qt;
strip ./build/v0.0.0.1/i686-pc-linux-gnu/c2fcoind
strip ./build/v0.0.0.1/i686-pc-linux-gnu/c2fcoin-qt
# created detached signatures
cd build/v0.0.0.1/i686-pc-linux-gnu;

gpg --detach-sign -o c2fcoin-qt.sig c2fcoin-qt
gpg --verify c2fcoin-qt.sig

gpg --armor --detach-sign -o c2fcoind.sig c2fcoind
gpg --verify c2fcoind.sig
cd ../../..;

make clean;cd src;make clean;cd ..;

# x86_64-w64-mingw32
./autogen.sh;
./configure --prefix=`pwd`/depends/x86_64-w64-mingw32
make HOST=x86_64-w64-mingw32

mkdir -p build/v0.0.0.1/x86_64-w64-mingw32;
cp ./src/c2fcoind.exe ./build/v0.0.0.1/x86_64-w64-mingw32/c2fcoind.exe;
cp ./src/qt/c2fcoin-qt.exe ./build/v0.0.0.1/x86_64-w64-mingw32/c2fcoin-qt.exe;
strip ./build/v0.0.0.1/x86_64-w64-mingw32/c2fcoind.exe
strip ./build/v0.0.0.1/x86_64-w64-mingw32/c2fcoin-qt.exe
## created detached signatures
cd build/v0.0.0.1/x86_64-w64-mingw32;


##/C= 	Country 	GB
##/ST= 	State 	London
##/L= 	Location 	London
##/O= 	Organization 	Global Security
##/OU= 	Organizational Unit 	IT Department
##/CN= 	Common Name 	example.com

openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./c2fcoin-qt-selfsigned.key -out ./c2fcoin-qt-selfsigned.crt -subj "/C=AT/ST=Vienna/L=Vienna/O=Development/OU=Core Development/CN=ec2fcoincore.com";
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./c2fcoind-selfsigned.key -out ./c2fcoind-selfsigned.crt -subj "/C=AT/ST=Vienna/L=Vienna/O=Development/OU=Core Development/CN=ec2fcoincore.com";

osslsigncode sign -certs c2fcoin-qt-selfsigned.crt -key c2fcoin-qt-selfsigned.key \
        -n "C2FCoin Core source code" -i http://www.c2fcoincore.com/ \
        -t http://timestamp.verisign.com/scripts/timstamp.dll \
        -in c2fcoin-qt.exe -out c2fcoin-qt-signed.exe

osslsigncode sign -certs c2fcoind-selfsigned.crt -key c2fcoind-selfsigned.key \
        -n "C2FCoin Core source code" -i http://www.c2fcoincore.com/ \
        -t http://timestamp.verisign.com/scripts/timstamp.dll \
        -in c2fcoind.exe -out c2fcoind-signed.exe

mv c2fcoin-qt-signed.exe c2fcoin-qt.exe;
mv c2fcoind-signed.exe c2fcoind.exe;

cd ../../..;
make clean;cd src;make clean;cd ..;

# i686-w64-mingw32
./autogen.sh;
./configure --prefix=`pwd`/depends/i686-w64-mingw32
make HOST=i686-w64-mingw32

mkdir -p build/v0.0.0.1/i686-w64-mingw32;
cp ./src/c2fcoind.exe ./build/v0.0.0.1/i686-w64-mingw32/c2fcoind.exe;
cp ./src/qt/c2fcoin-qt.exe ./build/v0.0.0.1/i686-w64-mingw32/c2fcoin-qt.exe;
strip ./build/v0.0.0.1/i686-w64-mingw32/c2fcoind.exe
strip ./build/v0.0.0.1/i686-w64-mingw32/c2fcoin-qt.exe
## created detached signatures
cd build/v0.0.0.1/i686-w64-mingw32;

##/C= 	Country 	GB
##/ST= 	State 	London
##/L= 	Location 	London
##/O= 	Organization 	Global Security
##/OU= 	Organizational Unit 	IT Department
##/CN= 	Common Name 	example.com

openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./c2fcoin-qt-selfsigned.key -out ./c2fcoin-qt-selfsigned.crt -subj "/C=AT/ST=Vienna/L=Vienna/O=Development/OU=Core Development/CN=ec2fcoincore.com";
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./c2fcoind-selfsigned.key -out ./c2fcoind-selfsigned.crt -subj "/C=AT/ST=Vienna/L=Vienna/O=Development/OU=Core Development/CN=ec2fcoincore.com";

osslsigncode sign -certs c2fcoin-qt-selfsigned.crt -key c2fcoin-qt-selfsigned.key \
        -n "C2FCoin Core source code" -i http://www.c2fcoincore.com/ \
        -t http://timestamp.verisign.com/scripts/timstamp.dll \
        -in c2fcoin-qt.exe -out c2fcoin-qt-signed.exe

osslsigncode sign -certs c2fcoind-selfsigned.crt -key c2fcoind-selfsigned.key \
        -n "C2FCoin Core source code" -i http://www.c2fcoincore.com/ \
        -t http://timestamp.verisign.com/scripts/timstamp.dll \
        -in c2fcoind.exe -out c2fcoind-signed.exe

mv c2fcoin-qt-signed.exe c2fcoin-qt.exe;
mv c2fcoind-signed.exe c2fcoind.exe;

cd ../../..;
make clean;cd src;make clean;cd ..;

./autogen.sh;
./configure --prefix=`pwd`/depends/arm-linux-gnueabihf
make HOST=arm-linux-gnueabihf;

mkdir -p build/v0.0.0.1/arm-linux-gnueabihf;
cp ./src/c2fcoind ./build/v0.0.0.1/arm-linux-gnueabihf/c2fcoind;
cp ./src/qt/c2fcoin-qt ./build/v0.0.0.1/arm-linux-gnueabihf/c2fcoin-qt;
strip ./build/v0.0.0.1/arm-linux-gnueabihf/c2fcoind
strip ./build/v0.0.0.1/arm-linux-gnueabihf/c2fcoin-qt
# created detached signatures
cd build/v0.0.0.1/arm-linux-gnueabihf;

gpg --detach-sign -o c2fcoin-qt.sig c2fcoin-qt
gpg --verify c2fcoin-qt.sig

gpg --armor --detach-sign -o c2fcoind.sig c2fcoind
gpg --verify c2fcoind.sig
cd ../../..;


make clean;cd src;make clean;cd ..;

# aarch64-linux-gnu
./autogen.sh;
./configure --prefix=`pwd`/depends/aarch64-linux-gnu
make HOST=aarch64-linux-gnu;

mkdir -p build/v0.0.0.1/aarch64-linux-gnu;
cp ./src/c2fcoind ./build/v0.0.0.1/aarch64-linux-gnu/c2fcoind;
cp ./src/qt/c2fcoin-qt ./build/v0.0.0.1/aarch64-linux-gnu/c2fcoin-qt;
strip ./build/v0.0.0.1/aarch64-linux-gnu/c2fcoind
strip ./build/v0.0.0.1/aarch64-linux-gnu/c2fcoin-qt
# created detached signatures
cd build/v0.0.0.1/aarch64-linux-gnu;

gpg --detach-sign -o c2fcoin-qt.sig c2fcoin-qt
gpg --verify c2fcoin-qt.sig

gpg --armor --detach-sign -o c2fcoind.sig c2fcoind
gpg --verify c2fcoind.sig
cd ../../..;

# arm-linux-gnueabihf
./autogen.sh;
./configure --prefix=`pwd`/depends/arm-linux-gnueabihf
make
mkdir -p build/v0.0.0.1/arm-linux-gnueabihf;
cp ./src/c2fcoind ./build/v0.0.0.1/arm-linux-gnueabihf/c2fcoind;
cp ./src/qt/c2fcoin-qt ./build/v0.0.0.1/arm-linux-gnueabihf/c2fcoin-qt;
strip ./build/v0.0.0.1/arm-linux-gnueabihf/c2fcoind
strip ./build/v0.0.0.1/arm-linux-gnueabihf/c2fcoin-qt
## created detached signatures
cd build/v0.0.0.1/arm-linux-gnueabihf;

gpg --detach-sign -o c2fcoin-qt.sig c2fcoin-qt
gpg --verify c2fcoin-qt.sig

gpg --armor --detach-sign -o c2fcoind.sig c2fcoind
gpg --verify c2fcoind.sig
cd ../../..;

make clean;cd src;make clean;cd ..;

# host-platform-triplet
./autogen.sh;
./configure --prefix=`pwd`/depends/host-platform-triplet
make
mkdir -p build/v0.0.0.1/host-platform-triplet;
cp ./src/c2fcoind ./build/v0.0.0.1/host-platform-triplet/c2fcoind;
cp ./src/qt/c2fcoin-qt ./build/v0.0.0.1/host-platform-triplet/c2fcoin-qt;
strip ./build/v0.0.0.1/host-platform-triplet/c2fcoind
strip ./build/v0.0.0.1/host-platform-triplet/c2fcoin-qt
## created detached signatures
cd build/v0.0.0.1/host-platform-triplet;

gpg --detach-sign -o c2fcoin-qt.sig c2fcoin-qt
gpg --verify c2fcoin-qt.sig

gpg --armor --detach-sign -o c2fcoind.sig c2fcoind
gpg --verify c2fcoind.sig
cd ../../..;

make clean;cd src;make clean;cd ..;

# x86_64-apple-darwin11
./autogen.sh;
./configure --prefix=`pwd`/depends/x86_64-apple-darwin11
make HOST=x86_64-apple-darwin11;

#mkdir -p build/v0.0.0.1/x86_64-apple-darwin11;
#cp ./src/c2fcoind ./build/v0.0.0.1/x86_64-apple-darwin11/c2fcoind;
#cp ./src/qt/c2fcoin-qt ./build/v0.0.0.1/x86_64-apple-darwin11/c2fcoin-qt;
#strip ./build/v0.0.0.1/x86_64-apple-darwin11/c2fcoind
#strip ./build/v0.0.0.1/x86_64-apple-darwin11/c2fcoin-qt
# created detached signatures
#cd build/v0.0.0.1/x86_64-apple-darwin11;

#gpg --detach-sign -o c2fcoin-qt.sig c2fcoin-qt
#gpg --verify c2fcoin-qt.sig

#gpg --armor --detach-sign -o c2fcoind.sig c2fcoind
#gpg --verify c2fcoind.sig
#cd ../../..;


#make clean;cd src;make clean;cd ..;