### Set date from filename

Android photo filenames include the date and time the photo was taken. Parse that and set the file's modified to the date in the filename

Examples:

 * IMG_20170812_163150.jpg
 * IMG_20170812_163150_1.jpg
 * PANO_20160731_210643.jpg
 * VID_20150912_153411.mp4

```bash
for f in *.jpg *.mp4; do
	t=$(echo "$f" | sed -n 's/[^_]*_\([^_]*\)_\([0-9]\{4\}\)\([0-9][0-9]\).*/\1\2.\3/p')
	echo "$f : $t"
	touch -t "$t" "$f"
done
```

# macOS

Restart DNS:
```bash
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
```

Restart Logitech mouse daemon to fix no scroll:
```bash
kill $(ps aux | grep LogiMgrDaemon.app | awk 'FNR == 1 {print $2}')
```
