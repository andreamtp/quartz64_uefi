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
  PLATFORM_NAME                  = SOQuartz
  PLATFORM_GUID                  = 22F6EBF2-6A5A-11EC-A169-BFF8E1340030
  PLATFORM_VERSION               = 1.0
  DSC_SPECIFICATION              = 0x0001001A
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE|NOOPT
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Rockchip/Rk356x/Rk356x.fdf
  BOARD_DXE_FV_COMPONENTS        = Platform/Pine64/SOQuartz/SOQuartz.fdf.inc

  #
  # Defines for default states.  These can be changed on the command line.
  # -D FLAG=VALUE
  #
  DEFINE DEBUG_PRINT_ERROR_LEVEL = 0x8000004F

!include MdePkg/MdeLibs.dsc.inc
!include ../../Rockchip/Rk356x/Rk356x.dsc.inc

[Components.common]
  Platform/Pine64/SOQuartz/Drivers/BoardInitDxe/BoardInitDxe.inf
  Platform/Pine64/Drivers/LogoDxe/LogoDxe.inf

[PcdsFixedAtBuild.common]
  #
  # Platform identification
  #
  gRk356xTokenSpaceGuid.PcdPlatformName|"PINE64 SOQuartz CM4"
  gRk356xTokenSpaceGuid.PcdCpuName|"Rockchip RK3566 (Cortex-A55)"
  gRk356xTokenSpaceGuid.PcdPlatformVendorName|"Pine64"
  gRk356xTokenSpaceGuid.PcdFamilyName|"Quartz64"
  gRk356xTokenSpaceGuid.PcdProductUrl|"https://wiki.pine64.org/wiki/SOQuartz"
  gRk356xTokenSpaceGuid.PcdMemoryVendorName|"Micron"

  #
  # Only a single USB controller is brought out
  #
  gRk356xTokenSpaceGuid.PcdXhc0Status|0xF

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