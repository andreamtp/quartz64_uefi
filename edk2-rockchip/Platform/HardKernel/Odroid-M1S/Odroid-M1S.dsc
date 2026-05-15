# @file
#
#  Copyright (c) 2011 - 2020, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2021, Intel Corporation. All rights reserved.
#  Copyright (c) 2017 - 2021, Andrei Warkentin <andrey.warkentin@gmail.com>
#  Copyright (C) 2021, Jared McNeill <jmcneill@invisible.ca>
#  Copyright (C) 2025, Jeff Frasca <thatguy@jeff-frasca.name>
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

[Defines]
  PLATFORM_NAME                  = Odroid-M1S
  # XXX: GUID is the same as Quartz64 and Firefly ROC-RK3566-PC
  PLATFORM_GUID                  = 381B9B4F-A5CD-44E0-B781-CD7036A900F9
  PLATFORM_VERSION               = 1.0
  DSC_SPECIFICATION              = 0x0001001A
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE|NOOPT
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Rockchip/Rk356x/Rk356x.fdf
  BOARD_DXE_FV_COMPONENTS        = Platform/HardKernel/Odroid-M1S/Odroid-M1S.fdf.inc

  #
  # Defines for default states.  These can be changed on the command line.
  # -D FLAG=VALUE
  #
  DEFINE DEBUG_PRINT_ERROR_LEVEL = 0x8000004F

!include MdePkg/MdeLibs.dsc.inc
!include ../../Rockchip/Rk356x/Rk356x.dsc.inc

[Components.common]
  Platform/HardKernel/Odroid-M1S/Drivers/BoardInitDxe/BoardInitDxe.inf
  MdeModulePkg/Logo/LogoDxe.inf

[PcdsFixedAtBuild.common]
  #
  # Platform identification
  #
  gRk356xTokenSpaceGuid.PcdPlatformName|"Hardkernel ODROID-M1S"
  gRk356xTokenSpaceGuid.PcdCpuName|"Rockchip RK3566 (Cortex-A55)"
  gRk356xTokenSpaceGuid.PcdPlatformVendorName|"Hardkernel"
  gRk356xTokenSpaceGuid.PcdFamilyName|"ODROID-M1S"
  gRk356xTokenSpaceGuid.PcdProductUrl|"https://wiki.odroid.com/odroid-m1s/odroid-m1s"
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

  # XXX
  gEfiMdePkgTokenSpaceGuid.PcdPciIoTranslation|0x000000033FFF0000
  gRk356xTokenSpaceGuid.PcdPcieResetGpioBank|1
  gRk356xTokenSpaceGuid.PcdPcieResetGpioPin|10
  gRk356xTokenSpaceGuid.PcdPciePowerGpioBank|2
  gRk356xTokenSpaceGuid.PcdPciePowerGpioPin|18

  #
  # Limit eMMC to 52 MHz
  #
  gRk356xTokenSpaceGuid.PcdEmmcForceHighSpeed|TRUE

  # XXX
  # Odroid M1S has a Silergy SYR838 regulator, might be similar to the OrangePi's 
  # SYR837.

[PcdsDynamicHii.common.DEFAULT]
  #
  # ConfigDxe
  #
  gRk356xTokenSpaceGuid.PcdSystemTableMode|L"SystemTableMode"|gConfigDxeFormSetGuid|0x0|0
  gRk356xTokenSpaceGuid.PcdCpuClock|L"CpuClock"|gConfigDxeFormSetGuid|0x0|2
  gRk356xTokenSpaceGuid.PcdCustomCpuClock|L"CustomCpuClock"|gConfigDxeFormSetGuid|0x0|816