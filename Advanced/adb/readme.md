# 📱 Android Debug Bridge (ADB) Guide

### Flutter Development & Android TV Management on Linux

> A complete guide for installing, configuring, and using **Android Debug Bridge (ADB)** with Flutter applications, Android phones, Android TVs, and Android-based devices.

---

# Table of Contents

- What is ADB?
- Why Flutter Developers Need ADB
- Installing ADB on Linux
- Verify Installation
- Starting the ADB Server
- Connecting a Device
- Connecting via Wi-Fi
- Flutter + ADB Workflow
- Useful ADB Commands
- Device Information
- File Management
- Application Management
- Debugging
- Logs
- System Exploration
- Android TV Commands
- Root Features
- HiSilicon TV Investigation
- Troubleshooting
- Best Practices

---

# What is ADB?

**Android Debug Bridge (ADB)** is a command-line tool provided by Google that allows communication between your computer and an Android device.

ADB is used for:

- Installing applications
- Debugging Flutter apps
- Reading logs
- Accessing the shell
- Managing files
- Executing Linux commands
- Rebooting devices
- Inspecting Android TV systems

ADB works with:

- Android phones
- Tablets
- Android TV
- Google TV
- Android emulators
- Android-based Smart TVs
- Android Set-top boxes

---

# Why Flutter Developers Need ADB

When developing Flutter applications, ADB is one of the most important tools.

It allows Flutter to:

- Detect Android devices
- Install debug builds
- Read application logs
- Restart applications
- Debug crashes
- Capture screenshots
- Transfer files
- Access the Android shell

Typical Flutter workflow:

```text
Flutter Project
       │
       ▼
flutter run
       │
       ▼
ADB installs APK
       │
       ▼
Android Device
       │
       ▼
Live Debugging
```

Useful Flutter commands:

```bash
flutter doctor
flutter devices
flutter run
flutter logs
flutter install
flutter attach
```

---

# Install ADB on Linux

## Ubuntu / Debian

```bash
sudo apt update
sudo apt install android-tools-adb android-tools-fastboot
```

---

## Fedora

```bash
sudo dnf install android-tools
```

---

## Arch Linux

```bash
sudo pacman -S android-tools
```

---

# Verify Installation

```bash
adb version
```

Example:

```text
Android Debug Bridge version 1.0.41
Version 35.x.x
```

---

# Start the ADB Server

```bash
adb start-server
```

Stop it:

```bash
adb kill-server
```

Restart:

```bash
adb kill-server
adb start-server
```

---

# Connect Using USB

First enable **Developer Options** on the Android device.

Then enable:

- USB Debugging

Connect the USB cable.

Verify:

```bash
adb devices
```

Example:

```text
List of devices attached

R58M123456 device
```

---

# Connect Using the IP Address (Wi-Fi)

After enabling TCP/IP mode:

Disconnect the USB cable and connect using:

```bash
adb connect 192.168.1.100:5555
```

Verify:

```bash
adb devices
```

Disconnect:

```bash
adb disconnect
```

---

# Flutter + ADB Workflow

### Check Flutter

```bash
flutter doctor
```

---

### Detect Devices

```bash
flutter devices
```

---

### Run the Application

```bash
flutter run
```

---

### Install Existing APK

```bash
flutter install
```

---

### Hot Reload

Press:

```text
r
```

Hot Restart:

```text
R
```

---

### View Logs

```bash
flutter logs
```

---

# Enter the Android Shell

```bash
adb shell
```

Exit:

```bash
exit
```

---

# Device Information

## Android Version

```bash
getprop ro.build.version.release
```

SDK Version

```bash
getprop ro.build.version.sdk
```

---

## Device Information

```bash
getprop ro.product.model
```

```bash
getprop ro.product.manufacturer
```

```bash
getprop ro.build.fingerprint
```

---

## CPU Information

```bash
cat /proc/cpuinfo
```

---

## Memory

```bash
cat /proc/meminfo
```

---

## Storage

```bash
df -h
```

---

# List Installed Applications

All packages:

```bash
pm list packages
```

With APK locations:

```bash
pm list packages -f
```

Search:

```bash
pm list packages | grep youtube
```

---

# File Management

## List Files

```bash
ls -la
```

---

## Search APK Files

```bash
find /system -name "*.apk"
```

```bash
find /product -name "*.apk"
```

```bash
find /vendor -name "*.apk"
```

---

# Transfer Files

## Copy from TV to PC

```bash
adb pull /sdcard/file.txt
```

Example:

```bash
adb pull /sdcard/screen.png
```

---

## Copy from PC to TV

```bash
adb push /home/kaizencoder/Downloads/Cricfy_V6.6.apk /sdcard/
```

---

# Install Applications

Install an APK:

```bash
adb install app.apk
```

If installation is blocked:

```bash
pm install /sdcard/app.apk
```

---

# Capture Logs

Real-time logs:

```bash
logcat
```

Save logs:

```bash
logcat > tv.log
```

---

# Running Processes

List processes:

```bash
ps -A
```

Live monitoring:

```bash
top
```

Search:

```bash
ps -A | grep tv
```

```bash
ps -A | grep launcher
```

---

# Explore Android Settings

Global settings:

```bash
settings list global
```

Secure settings:

```bash
settings list secure
```

System settings:

```bash
settings list system
```

---

# Launch Activities

List packages:

```bash
pm list packages
```

Launch an application:

```bash
am start -n package.name/.ActivityName
```

---

# Take a Screenshot

Capture:

```bash
screencap -p /sdcard/screen.png
```

Exit shell:

```bash
exit
```

Download:

```bash
adb pull /sdcard/screen.png
```

---

# Android TV Investigation

When exploring an Android TV, these commands are especially useful.

### Identify the User

```bash
id
```

---

### Android Version

```bash
getprop ro.build.version.release
```

---

### System Applications

```bash
ls /system/app
```

---

### Privileged Applications

```bash
ls /system/priv-app
```

These commands help determine:

- Android version
- Root access
- System applications
- Manufacturer customizations
- Privileged applications

---

# Root Features (Use with Caution)

If the device truly has **root access (`uid=0`)**, you may be able to:

- Browse `/data/data`
- Read application databases
- Modify system files
- Replace launchers
- Remove pre-installed apps
- Start and stop system services

⚠️ **Warning**

Modifying `/system`, `/vendor`, or deleting system packages can easily **soft-brick** your TV. Proceed only if you understand the risks and have a recovery method.

---

# HiSilicon Devices

If your shell prompt contains:

```text
Hi3751V350
```

the device most likely uses a **HiSilicon Hi3751V350** chipset, commonly found in:

- Android TVs
- Smart TVs
- IPTV Boxes
- Set-top boxes

To investigate the platform, run:

```bash
id
```

```bash
getprop ro.build.version.release
```

```bash
ls /system/app
```

```bash
ls /system/priv-app
```

These outputs help determine:

- Android version
- Root status
- Privileged applications
- System architecture
- Overall level of system control

---

# Troubleshooting

## Connection Refused

Restart ADB:

```bash
adb kill-server
adb start-server
adb connect 192.168.1.100:5555
```

---

## Linux Firewall

Allow ADB through the firewall:

```bash
sudo ufw allow 5555/tcp
```

---

## Device Not Detected

Check connected devices:

```bash
adb devices
```

Restart the server:

```bash
adb kill-server
adb start-server
```

Reconnect the USB cable or retry the Wi-Fi connection.

---

## Unauthorized Device

If the device appears as:

```text
unauthorized
```

Accept the RSA fingerprint prompt on the Android device, then run:

```bash
adb devices
```

again.

---

# Best Practices

- Keep **ADB** updated.
- Enable **USB Debugging** only when needed.
- Disconnect devices after debugging.
- Avoid modifying system partitions unless you fully understand the implications.
- Use **Flutter Hot Reload** for faster development cycles.
- Regularly capture logs with `logcat` when debugging crashes.
- Back up important data before experimenting with rooted devices.

---

# Quick Command Reference

| Action            | Command                     |
| ----------------- | --------------------------- |
| Start ADB         | `adb start-server`          |
| Stop ADB          | `adb kill-server`           |
| List Devices      | `adb devices`               |
| Connect via Wi-Fi | `adb connect IP:5555`       |
| Disconnect        | `adb disconnect`            |
| Open Shell        | `adb shell`                 |
| Install APK       | `adb install app.apk`       |
| Pull File         | `adb pull file`             |
| Push File         | `adb push file destination` |
| Logs              | `logcat`                    |
| Screenshot        | `screencap -p`              |
| Processes         | `ps -A`                     |
| Memory            | `cat /proc/meminfo`         |
| CPU               | `cat /proc/cpuinfo`         |
| Storage           | `df -h`                     |
| Installed Apps    | `pm list packages`          |

---

# Conclusion

ADB is an essential tool for every Flutter and Android developer. Whether you're building applications, debugging Android TVs, inspecting system information, or managing files, mastering ADB will significantly improve your development workflow.

Combined with Flutter, ADB provides a fast and efficient way to develop, test, debug, and deploy applications across phones, tablets, Android TVs, and embedded Android devices.
