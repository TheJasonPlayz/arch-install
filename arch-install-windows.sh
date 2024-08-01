mapfile ARGS < ./arch-install-disks.txt

read -rp "Would you like to mount a home partition? (1: Yes) (2: No)" choice
if [ "$choice" == "1" ]; then
    mkfs.ext4 "${ARGS[2]}"
    mount "${ARGS[2]}" /mnt/home
elif [ "$choice" == "2" ]; then
    echo "Continuing program..."
fi

read -rp "Would you like to mount the efi partition? (1: Yes) (2: No)" choice
if [ "$choice" == "1" ]; then
    mkfs.ext4 "${ARGS[7]}"
    mount "${ARGS[7]}" /mnt/boot
elif [ "$choice" == "2" ]; then
    echo "Continuing program..."
fi