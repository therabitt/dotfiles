#!/bin/bash

# File sementara untuk menyimpan ID notifikasi terakhir
ID_FILE="/tmp/hypr_monitor_notif_id"

# Fungsi helper untuk kirim notifikasi agar menimpa yang lama
send_notif() {
    local title="$1"
    local msg="$2"
    local urgency="$3"
    local icon="$4"
    local replace_arg=""

    # Cek apakah ada ID notifikasi sebelumnya
    if [ -f "$ID_FILE" ]; then
        replace_arg="-r $(cat $ID_FILE)"
    fi

    # Kirim notif dan simpan ID baru (-p = print ID)
    # Pakai escape sequence agar aman
    NEW_ID=$(notify-send -p $replace_arg -u "$urgency" -i "$icon" "$title" "$msg")
    
    # Update file ID
    echo "$NEW_ID" > "$ID_FILE"
}

# ---------------------------------------------------------

# Deteksi Monitor
INTERNAL=$(hyprctl monitors | grep "Monitor" | head -n 1 | awk '{print $2}')
EXTERNAL=$(hyprctl monitors | grep "Monitor" | grep -v "$INTERNAL" | awk '{print $2}')

# -- SKENARIO 1: Tidak ada proyektor --
if [ -z "$EXTERNAL" ]; then
    send_notif "No monitor detected" "Check your HDMI/VGA." "critical" "dialog-error"
    exit
fi

# Cek mode Mirroring
IS_MIRROR=$(hyprctl monitors | grep "$EXTERNAL" -A 10 | grep "mirror")

if [ -z "$IS_MIRROR" ]; then
    # -- SKENARIO 2: Aktifkan Mirroring --
    hyprctl keyword monitor "$EXTERNAL, preferred, auto, 1, mirror, $INTERNAL"
    send_notif "Mode Presentasi (Mirror)" "Tampilan diduplikasi ke proyektor." "normal" "video-display"
else
    # -- SKENARIO 3: Matikan Mirroring --
    hyprctl keyword monitor "$EXTERNAL, preferred, auto, 1"
    send_notif "Mode Normal (Extended)" "Layar proyektor menjadi desktop tambahan." "normal" "preferences-desktop-display"
fi
