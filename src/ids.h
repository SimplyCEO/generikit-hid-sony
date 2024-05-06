/* SPDX-License-Identifier: GPL-2.0-or-later */
/*
 *  USB HID quirks support for PlayStation devices
 *
 *  Copyright (c) 1999 Andreas Gal
 *  Copyright (c) 2000-2005 Vojtech Pavlik <vojtech@suse.cz>
 *  Copyright (c) 2005 Michael Haboustak <mike-@cinci.rr.com> for Concept2, Inc
 *  Copyright (c) 2006-2007 Jiri Kosina
 *  Copyright (c) 2022-2023 KanuX-14 <kanux.dev@gmail.com>
 */

#ifndef HID_IDS_H_FILE
#define HID_IDS_H_FILE

#define USB_VENDOR_ID_LOGITECH                      0x046d
#define USB_DEVICE_ID_LOGITECH_HARMONY_PS3          0x0306

#define USB_VENDOR_ID_REDOCTANE                     0x1430
#define USB_DEVICE_ID_REDOCTANE_GUITAR_DONGLE       0x474c
#define USB_DEVICE_ID_REDOCTANE_PS4_GHLIVE_DONGLE   0x07bb

#define USB_VENDOR_ID_SMK                           0x0609
#define USB_DEVICE_ID_SMK_PS3_BDREMOTE              0x0306
#define USB_DEVICE_ID_SMK_NSG_MR5U_REMOTE           0x0368
#define USB_DEVICE_ID_SMK_NSG_MR7U_REMOTE           0x0369

#define USB_VENDOR_ID_SONY                          0x054c
#define USB_DEVICE_ID_SONY_VAIO_VGX_MOUSE           0x024b
#define USB_DEVICE_ID_SONY_VAIO_VGP_MOUSE           0x0374
#define USB_DEVICE_ID_SONY_PS3_BDREMOTE             0x0306
#define USB_DEVICE_ID_SONY_PS3_CONTROLLER           0x0268
#define USB_DEVICE_ID_SONY_PS4_CONTROLLER           0x05c4
#define USB_DEVICE_ID_SONY_PS4_CONTROLLER_2         0x09cc
#define USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE    0x0ba0
#define USB_DEVICE_ID_SONY_PS5_CONTROLLER           0x0ce6
#define USB_DEVICE_ID_SONY_PS5_CONTROLLER_2         0x0df2
#define USB_DEVICE_ID_SONY_MOTION_CONTROLLER        0x03d5
#define USB_DEVICE_ID_SONY_NAVIGATION_CONTROLLER    0x042f
#define USB_DEVICE_ID_SONY_BUZZ_CONTROLLER          0x0002
#define USB_DEVICE_ID_SONY_WIRELESS_BUZZ_CONTROLLER 0x1000

#define USB_VENDOR_ID_SONY_RHYTHM                   0x12ba
#define USB_DEVICE_ID_SONY_PS3WIIU_GHLIVE_DONGLE    0x074b
#define USB_DEVICE_ID_SONY_PS3_GUITAR_DONGLE        0x0100

#define USB_VENDOR_ID_SINO_LITE                     0x1345
#define USB_DEVICE_ID_SINO_LITE_CONTROLLER          0x3008

#define USB_VENDOR_ID_GENERIC                       USB_VENDOR_ID_SONY
#define USB_DEVICE_ID_GENERIC_GAMEPAD               USB_DEVICE_ID_SONY_PS3_CONTROLLER

#endif
