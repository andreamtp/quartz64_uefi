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
  PLATFORM_NAME                  = Quartz64
  PLATFORM_GUID                  = 381B9B4F-A5CD-44E0-B781-CD7036A900F9
  PLATFORM_VERSION               = 1.0
  DSC_SPECIFICATION              = 0x0001001A
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE|NOOPT
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Rockchip/Rk356x/Rk356x.fdf
  BOARD_DXE_FV_COMPONENTS        = Platform/Pine64/Quartz64/Quartz64.fdf.inc

  #
  # Defines for default states.  These can be changed on the command line.
  # -D FLAG=VALUE
  #
  DEFINE DEBUG_PRINT_ERROR_LEVEL = 0x8000004F

!include MdePkg/MdeLibs.dsc.inc
!include ../../Rockchip/Rk356x/Rk356x.dsc.inc

[BuildOptions]
  GCC:*_*_*_CC_FLAGS          = -DRK356X -DQUARTZ64
  GCC:*_*_*_PP_FLAGS          = -DRK356X -DQUARTZ64
  GCC:*_*_*_ASLPP_FLAGS       = -DRK356X -DQUARTZ64
  GCC:*_*_*_ASLCC_FLAGS       = -DRK356X -DQUARTZ64
  GCC:*_*_*_VFRPP_FLAGS       = -DRK356X -DQUARTZ64

[Components.common]
  Platform/Pine64/Quartz64/Drivers/BoardInitDxe/BoardInitDxe.inf
  Platform/Pine64/Drivers/LogoDxe/LogoDxe.inf

[PcdsFixedAtBuild.common]
  #
  # Platform identification
  #
  gRk356xTokenSpaceGuid.PcdPlatformName|"PINE64 Quartz64 Model A"
  gRk356xTokenSpaceGuid.PcdCpuName|"Rockchip RK3566 (Cortex-A55)"
  gRk356xTokenSpaceGuid.PcdPlatformVendorName|"Pine64"
  gRk356xTokenSpaceGuid.PcdFamilyName|"Quartz64"
  gRk356xTokenSpaceGuid.PcdProductUrl|"https://www.pine64.org/quartz64a/"
  gRk356xTokenSpaceGuid.PcdMemoryVendorName|"Micron"

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
  # SATA support
  #
  gRk356xTokenSpaceGuid.PcdSata1Status|0xF

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
  gRk356xTokenSpaceGuid.PcdPciePowerGpioPin|22

  #
  # Fan support
  #
  gRk356xTokenSpaceGuid.PcdFanGpioBank|0
  gRk356xTokenSpaceGuid.PcdFanGpioPin|27

  #
  # This board has inverted polarity for the PWREN pin on the SD card slot
  #
  gRk356xTokenSpaceGuid.PcdMshcDxePwrEnUsed|TRUE
  gRk356xTokenSpaceGuid.PcdMshcDxePwrEnInverted|TRUE

[PcdsDynamicHii.common.DEFAULT]
  #
  # ConfigDxe
  #
  gRk356xTokenSpaceGuid.PcdSystemTableMode|L"SystemTableMode"|gConfigDxeFormSetGuid|0x0|0
  gRk356xTokenSpaceGuid.PcdCpuClock|L"CpuClock"|gConfigDxeFormSetGuid|0x0|2
  gRk356xTokenSpaceGuid.PcdCustomCpuClock|L"CustomCpuClock"|gConfigDxeFormSetGuid|0x0|816
  gRk356xTokenSpaceGuid.PcdMultiPhy1Mode|L"MultiPhy1Mode"|gConfigDxeFormSetGuid|0x0|0
  gRk356xTokenSpaceGuid.PcdFanMode|L"FanMode"|gConfigDxeFormSetGuid|0x0|1