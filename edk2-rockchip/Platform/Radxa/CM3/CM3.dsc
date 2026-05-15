# @file
#
#  Copyright (c) 2011 - 2020, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2021, Intel Corporation. All rights reserved.
#  Copyright (c) 2017 - 2021, Andrei Warkentin <andrey.warkentin@gmail.com>
#  Copyright (C) 2021, Jared McNeill <jmcneill@invisible.ca>
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

[Defines]
  PLATFORM_NAME                  = CM3
  PLATFORM_GUID                  = 381B9B4F-A5CD-44E0-B781-CD7036A900F9
  PLATFORM_VERSION               = 1.0
  DSC_SPECIFICATION              = 0x0001001A
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE|NOOPT
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Rockchip/Rk356x/Rk356x.fdf
  BOARD_DXE_FV_COMPONENTS        = Platform/Radxa/CM3/CM3.fdf.inc

  #
  # Defines for default states.  These can be changed on the command line.
  # -D FLAG=VALUE
  #
  DEFINE DEBUG_PRINT_ERROR_LEVEL = 0x8000004F

!include MdePkg/MdeLibs.dsc.inc
!include ../../Rockchip/Rk356x/Rk356x.dsc.inc

[Components.common]
  Platform/Radxa/CM3/Drivers/BoardInitDxe/BoardInitDxe.inf
  MdeModulePkg/Logo/LogoDxe.inf

[PcdsFixedAtBuild.common]
  #
  # Platform identification
  #
  gRk356xTokenSpaceGuid.PcdPlatformName|"RADXA CM3"
  gRk356xTokenSpaceGuid.PcdCpuName|"Rockchip RK3566 (Cortex-A55)"
  gRk356xTokenSpaceGuid.PcdPlatformVendorName|"RADXA"
  gRk356xTokenSpaceGuid.PcdFamilyName|"ROCK3"
  gRk356xTokenSpaceGuid.PcdProductUrl|"https://wiki.radxa.com/Rock3/CM3"
  gRk356xTokenSpaceGuid.PcdMemoryVendorName|"Unknown"

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
  gRk356xTokenSpaceGuid.PcdMac1Status|0xF

  #
  # PCI support
  #
  gEfiMdePkgTokenSpaceGuid.PcdPciExpressBaseAddress|0x0000000300000000
  gArmTokenSpaceGuid.PcdPciBusMin|0
  gArmTokenSpaceGuid.PcdPciBusMax|1
  gArmTokenSpaceGuid.PcdPciMmio32Base|0xF4000000
  gArmTokenSpaceGuid.PcdPciMmio32Size|0x02000000
  gArmTokenSpaceGuid.PcdPciMmio64Base|0x0000000310000000
  gArmTokenSpaceGuid.PcdPciMmio64Size|0x000000002FFF0000
  gArmTokenSpaceGuid.PcdPciIoBase|0x0000
  gArmTokenSpaceGuid.PcdPciIoSize|0x10000
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|34

  gEfiMdePkgTokenSpaceGuid.PcdPciIoTranslation|0x000000033FFF0000
  gRk356xTokenSpaceGuid.PcdPcieResetGpioBank|1
  gRk356xTokenSpaceGuid.PcdPcieResetGpioPin|10
  gRk356xTokenSpaceGuid.PcdPciePowerGpioBank|0
  gRk356xTokenSpaceGuid.PcdPciePowerGpioPin|27

  #
  # This module has inverted polarity for the PWREN pin on the SD card slot
  #
  gRk356xTokenSpaceGuid.PcdMshcDxePwrEnUsed|TRUE
  gRk356xTokenSpaceGuid.PcdMshcDxePwrEnInverted|TRUE

  #
  # This module has a WiFi card on the second MSHC
  #
  gRk356xTokenSpaceGuid.PcdMshc1Status|0xF
  gRk356xTokenSpaceGuid.PcdMshc1SdioIrq|TRUE
  gRk356xTokenSpaceGuid.PcdMshc1NonRemovable|TRUE

[PcdsDynamicHii.common.DEFAULT]
  #
  # ConfigDxe
  #
  gRk356xTokenSpaceGuid.PcdSystemTableMode|L"SystemTableMode"|gConfigDxeFormSetGuid|0x0|0
  gRk356xTokenSpaceGuid.PcdCpuClock|L"CpuClock"|gConfigDxeFormSetGuid|0x0|2
  gRk356xTokenSpaceGuid.PcdCustomCpuClock|L"CustomCpuClock"|gConfigDxeFormSetGuid|0x0|816