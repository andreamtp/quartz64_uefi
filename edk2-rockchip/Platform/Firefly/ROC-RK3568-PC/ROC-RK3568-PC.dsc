# @file
#
#  Copyright (c) 2011 - 2020, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2021, Intel Corporation. All rights reserved.
#  Copyright (c) 2017 - 2021, Andrei Warkentin <andrey.warkentin@gmail.com>
#  Copyright (C) 2021 - 2022, Jared McNeill <jmcneill@invisible.ca>
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

[Defines]
  PLATFORM_NAME                  = ROC-RK3568-PC
  PLATFORM_GUID                  = 381B9B4F-A5CD-44E0-B781-CD7036A900F9
  PLATFORM_VERSION               = 1.0
  DSC_SPECIFICATION              = 0x0001001A
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE|NOOPT
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Rockchip/Rk356x/Rk356x.fdf
  BOARD_DXE_FV_COMPONENTS        = Platform/Firefly/ROC-RK3568-PC/ROC-RK3568-PC.fdf.inc
  RTC                            = HYM8563

  #
  # Defines for default states.  These can be changed on the command line.
  # -D FLAG=VALUE
  #
  DEFINE DEBUG_PRINT_ERROR_LEVEL = 0x8000004F

!include MdePkg/MdeLibs.dsc.inc
!include ../../Rockchip/Rk356x/Rk356x.dsc.inc

[Components.common]
  Platform/Firefly/ROC-RK3568-PC/Drivers/BoardInitDxe/BoardInitDxe.inf
  MdeModulePkg/Logo/LogoDxe.inf

[PcdsFixedAtBuild.common]
  #
  # Platform identification
  #
  gRk356xTokenSpaceGuid.PcdPlatformName|"Firefly ROC-RK3568-PC"
  gRk356xTokenSpaceGuid.PcdCpuName|"Rockchip RK3568 (Cortex-A55)"
  gRk356xTokenSpaceGuid.PcdPlatformVendorName|"Firefly"
  gRk356xTokenSpaceGuid.PcdFamilyName|"ROC-RK3568-PC"
  gRk356xTokenSpaceGuid.PcdProductUrl|"https://en.t-firefly.com/product/industry/rocrk3568pc.html"
  gRk356xTokenSpaceGuid.PcdMemoryVendorName|"Unknown"

  #
  # Enable UARTs 3 and 4
  #
  gRk356xTokenSpaceGuid.PcdUart3Status|0xF
  gRk356xTokenSpaceGuid.PcdUart4Status|0xF

  #
  # USB support
  #
  gRk356xTokenSpaceGuid.PcdOhc0Status|0xF
  gRk356xTokenSpaceGuid.PcdOhc1Status|0xF
  gRk356xTokenSpaceGuid.PcdEhc0Status|0xF
  gRk356xTokenSpaceGuid.PcdEhc1Status|0xF
  gRk356xTokenSpaceGuid.PcdXhc0Status|0xF
  gRk356xTokenSpaceGuid.PcdXhc1Status|0xF

  #
  # Ethernet support
  #
  gRk356xTokenSpaceGuid.PcdMac0Status|0xF
  gRk356xTokenSpaceGuid.PcdMac1Status|0xF

  #
  # SATA support
  #
  gRk356xTokenSpaceGuid.PcdSata2Status|0xF

  #
  # PCI support
  #
  gRk356xTokenSpaceGuid.PcdPcieApbBase|0xFE280000
  gRk356xTokenSpaceGuid.PcdPcieDbiBase|0x00000003C0800000

  gEfiMdePkgTokenSpaceGuid.PcdPciExpressBaseAddress|0x0000000380000000
  gArmTokenSpaceGuid.PcdPciBusMin|0
  gArmTokenSpaceGuid.PcdPciBusMax|1
  gArmTokenSpaceGuid.PcdPciMmio32Base|0xF0000000
  gArmTokenSpaceGuid.PcdPciMmio32Size|0x02000000
  gArmTokenSpaceGuid.PcdPciMmio64Base|0x0000000390000000
  gArmTokenSpaceGuid.PcdPciMmio64Size|0x000000002FFF0000
  gArmTokenSpaceGuid.PcdPciIoBase|0x0000
  gArmTokenSpaceGuid.PcdPciIoSize|0x10000
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|34

  gEfiMdePkgTokenSpaceGuid.PcdPciIoTranslation|0x00000003BFFF0000
  gRk356xTokenSpaceGuid.PcdPcieResetGpioBank|2
  gRk356xTokenSpaceGuid.PcdPcieResetGpioPin|30
  gRk356xTokenSpaceGuid.PcdPciePowerGpioBank|0
  gRk356xTokenSpaceGuid.PcdPciePowerGpioPin|28
  gRk356xTokenSpaceGuid.PcdPcieLinkSpeed|0x3
  gRk356xTokenSpaceGuid.PcdPcieNumLanes|0x2
  gRk356xTokenSpaceGuid.PcdPcie30PhyLane0LinkNum|1
  gRk356xTokenSpaceGuid.PcdPcie30PhyLane1LinkNum|1

  #
  # The ROC-RK3568-PC has a WiFi card on the third MSHC
  #
  gRk356xTokenSpaceGuid.PcdMshc2Status|0xF
  gRk356xTokenSpaceGuid.PcdMshc2SdioIrq|TRUE
  gRk356xTokenSpaceGuid.PcdMshc2NonRemovable|TRUE

  #
  # Limit eMMC to 52 MHz
  #
  gRk356xTokenSpaceGuid.PcdEmmcForceHighSpeed|TRUE

  #
  # RTC support (hym8563 at 0x51 on I2C5)
  #
  gRk356xTokenSpaceGuid.PcdRtcI2cBusBase|0xFE5E0000
  gRk356xTokenSpaceGuid.PcdRtcI2cAddr|0x51

[PcdsDynamicHii.common.DEFAULT]
  #
  # ConfigDxe
  #
  gRk356xTokenSpaceGuid.PcdSystemTableMode|L"SystemTableMode"|gConfigDxeFormSetGuid|0x0|0
  gRk356xTokenSpaceGuid.PcdCpuClock|L"CpuClock"|gConfigDxeFormSetGuid|0x0|2
  gRk356xTokenSpaceGuid.PcdCustomCpuClock|L"CustomCpuClock"|gConfigDxeFormSetGuid|0x0|816