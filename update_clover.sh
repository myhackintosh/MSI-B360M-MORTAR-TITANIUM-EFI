#!/bin/sh
set -x
CLOVER=/Volumes/Clover-v2.4k-4862-X64
if [ ! -d $CLOVER ]; then 
   echo "$CLOVER not exists!"
   exit 1
fi

cp -pR $CLOVER /tmp/Clover
CLOVER=/tmp/Clover

cp -pR $CLOVER/EFI/CLOVER/drivers-Off/drivers64UEFI/* $CLOVER/EFI/CLOVER/drivers64UEFI/

EFI=`pwd`

# we use AptioMemoryFix.efi of github Release version!
file_list=(
EFI/BOOT/BOOTX64.efi 
EFI/CLOVER/CLOVERX64.efi
EFI/CLOVER/drivers64UEFI/SMCHelper-64.efi
EFI/CLOVER/drivers64UEFI/ApfsDriverLoader-64.efi
EFI/CLOVER/drivers64UEFI/OsxAptioFixDrv-64.efi 
EFI/CLOVER/drivers64UEFI/FSInject-64.efi
EFI/CLOVER/drivers64UEFI/EmuVariableUefi-64.efi
)

for filename in ${file_list[@]}
do 
    cp -p $CLOVER/$filename $EFI/$filename
done

# update drivers-Off
cp -pR $CLOVER/EFI/CLOVER/drivers-Off/drivers64UEFI/* $EFI/EFI/CLOVER/drivers-Off/drivers64UEFI/
cp -pR $CLOVER/EFI/CLOVER/tools/*       $EFI/EFI/CLOVER/tools

rm -rf $CLOVER

echo "sync from $CLOVER to $EFI finish"

