Beelink (and probably others) mini-PCs seem to not bother setting the UUID, resulting in all having the same generic UUID. This causes a problem for Omni, which relies on UUID for identifying nodes.

This will update all American Megatrends (AMI) BIOS to set the UUID to a random value.

Copy all files to a bootable USB stick and boot the mini-PC off it

Tested to work on Beelink U59 Pro and Mini S12 Pro

Use at your own risk.

Originally obtained from inside [`m1ujt73usa.zip` for the Lenovo ThinkStation P330 Tiny download center](https://support.lenovo.com/us/en/downloads/ds503907-flash-bios-update-thinkcentre-m720t-m720s-m720q-m920t-m920s-m920q-m920x-thinkstation-p330-tiny). The ```/efi/boot/startup.nsh``` was modified to run the UUID randomize command instead of the BIOS flash.