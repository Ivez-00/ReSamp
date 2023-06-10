#!/system/bin/sh

prop=`getprop ro.product.cpu.abi`

extract_set_perm() {
unzip -o "$ZIPFILE" service.sh -d $MODPATH >&2
unzip -o "$ZIPFILE" ReSamp -d $MODPATH >&2
chmod -R 0755 $MODPATH >&2
}

ui_print " ReSamp V2"
ui_print " Checking device arch.."

case $prop in

"arm64-v8a")

ui_print " Device is 64bit -(arm64-v8a)-";
extract_set_perm;
ui_print " Everything will set during boot,";
ui_print " Reboot your device";;

"x86_64")

ui_print " Device is 64bit -(x86_64)-";
extract_set_perm;
ui_print " Everything will set during boot,";
ui_print " Reboot your device";;

*)

ui_print " your device is not 64bit, aborting..";
abort;;
esac
