#!/bin/sh
CLOVER=/Volumes/Clover-v2.4k-4844-X64
cp -pR $CLOVER /tmp/Clover
CLOVER=/tmp/Clover

cp -pR $CLOVER/EFI/CLOVER/drivers-Off/drivers64UEFI/* $CLOVER/EFI/CLOVER/drivers64UEFI/

EFI=`pwd`

file_list=(
EFI/BOOT/BOOTX64.efi 
EFI/CLOVER/CLOVERX64.efi 
EFI/CLOVER/drivers64UEFI/ApfsDriverLoader-64.efi 
EFI/CLOVER/drivers64UEFI/AptioMemoryFix-64.efi 
EFI/CLOVER/drivers64UEFI/FSInject-64.efi 
EFI/CLOVER/drivers64UEFI/SMCHelper-64.efi 
)

for filename in ${file_list[@]}
do 
	cp -p $CLOVER/$filename $EFI/$filename
done

cp -pR $CLOVER/EFI/CLOVER/drivers-Off/* $EFI/EFI/CLOVER/drivers-Off
cp -pR $CLOVER/EFI/CLOVER/tools/*       $EFI/EFI/CLOVER/tools

rm -rf $CLOVER

echo "sync from $CLOVER to $EFI finish"

