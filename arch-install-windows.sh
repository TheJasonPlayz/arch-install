read -rp "Would you like to mount a home partition? (1: Yes) (2: No)" choice
if [ "$choice" == "1" ]; then
    mkfs.ext4 "$1"
    mount "$1" /mnt/home
elif [ "$choice" == "2" ]; then
    echo "Continuing program..."
fi

read -rp "Would you like to mount the efi partition? (1: Yes) (2: No)" choice
if [ "$choice" == "1" ]; then
    mkfs.ext4 "$7"
    mount "$7" /mnt/boot
elif [ "$choice" == "2" ]; then
    echo "Continuing program..."
fi