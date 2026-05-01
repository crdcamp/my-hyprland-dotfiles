#!/usr/bin/env bash
show_control_center() {
    echo -en "\0prompt\x1fControl Center\nNetwork\nBluetooth\nAudio\nSystem"
}

show_control_center
