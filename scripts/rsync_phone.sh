#!/bin/bash

rsync -a --info=progress2          /run/user/1000/gvfs/mtp\:host\=SAMSUNG_SAMSUNG_Android_RF8N21CSP3Z/Internal\ storage/DCIM/                                   /run/media/gabri/gbEXT4/phone/DCIM/
rsync -a --info=progress2          /run/user/1000/gvfs/mtp\:host\=SAMSUNG_SAMSUNG_Android_RF8N21CSP3Z/SD\ card/DCIM/                                            /run/media/gabri/gbEXT4/phone/DCIM/
rsync -a --info=progress2 --delete /run/user/1000/gvfs/mtp\:host\=SAMSUNG_SAMSUNG_Android_RF8N21CSP3Z/Internal\ storage/Android/media/com.whatsapp/WhatsApp/    /run/media/gabri/gbEXT4/phone/WhatsApp/
