read -rp "Would you like to install and modify grub? (1: Yes) (2: No)" choice

if [ "$choice" == "1" ]; then
    pacman -S grub efibootmgr os-prober
    grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB --modules="tpm" --disable-shim-lock
    sed 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/g' /etc/default/grub > /etc/default/mgrub && mv /etc/default/mgrub /etc/default/grub
    grub-mkconfig -o /boot/grub/grub.cfg
    sbctl status
    sbctl create-keys
    sbctl enroll-keys
    sbctl verify | sed 's/✗ /sbctl sign -s /e'
elif [ "$choice" == "2" ]; then
    echo "Continuing program..."
fi