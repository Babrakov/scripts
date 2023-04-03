*Restore grub

Make sure that you booted using EFI
```
efibootmgr -v
```

Run grub-install

```
sudo mount /dev/nvme0n1p5 /mnt 
sudo mount /dev/nvme0n1p1 /mnt/boot/efi
```

```
for i in /dev /dev/pts /proc /sys /sys/firmware/efi/efivars /run; do sudo mount -B $i /mnt$i; done
```

```
sudo chroot /mnt
```

```
grub-install --target=x86_64-efi /dev/nvme0n1
grub-install --recheck /dev/nvme0n1
```

```
update-grub2
```

```
exit &&
sudo umount /mnt/sys &&
sudo umount /mnt/proc &&
sudo umount /mnt/dev/pts &&
sudo umount /mnt/dev &&
sudo umount /mnt
```

Make sure that efibootmgr lists your Linux as an entry

```
efibootmgr -v
```