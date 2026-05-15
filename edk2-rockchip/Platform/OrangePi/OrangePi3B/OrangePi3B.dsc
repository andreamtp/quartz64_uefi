# @file
#
#  Copyright (c) 2011 - 2020, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2021, Intel Corporation. All rights reserved.
#  Copyright (c) 2017 - 2021, Andrei Warkentin <andrey.warkentin@gmail.com>
#  Copyright (C) 2021, Jared McNeill <jmcneill@invisible.ca>
#  Copyright (c) 2023, Mario Bălănică <mariobalanica02@gmail.com>
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

[Defines]
  PLATFORM_NAME                  = OrangePi3B
  PLATFORM_GUID                  = C180AA34-68E5-42CD-88C5-EE47499E1205
  PLATFORM_VERSION               = 1.0
  DSC_SPECIFICATION              = 0x0001001A
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE|NOOPT
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Rockchip/Rk356x/Rk356x.fdf
  BOARD_DXE_FV_COMPONENTS        = Platform/OrangePi/OrangePi3B/OrangePi3B.fdf.inc

  #
  # Defines for default states.  These can be changed on the command line.
  # -D FLAG=VALUE
  #
  DEFINE DEBUG_PRINT_ERROR_LEVEL = 0x8000004F

!include MdePkg/MdeLibs.dsc.inc
!include ../../Rockchip/Rk356x/Rk356x.dsc.inc

[Components.common]
  Platform/OrangePi/OrangePi3B/Drivers/BoardInitDxe/BoardInitDxe.inf
  Platform/OrangePi/Drivers/LogoDxe/LogoDxe.inf

[PcdsFixedAtBuild.common]
  #
  # Platform identification
  #
  gRk356xTokenSpaceGuid.PcdPlatformName|"Orange Pi 3B"
  gRk356xTokenSpaceGuid.PcdCpuName|"Rockchip RK3566 (Cortex-A55)"
  gRk356xTokenSpaceGuid.PcdPlatformVendorName|"Orange Pi"
  gRk356xTokenSpaceGuid.PcdFamilyName|"Orange Pi 3"
  gRk356xTokenSpaceGuid.PcdProductUrl|"http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-3B.html"
  gRk356xTokenSpaceGuid.PcdMemoryVendorName|"TBD"

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
  gRk356xTokenSpaceGuid.PcdPcieResetGpioBank|0
  gRk356xTokenSpaceGuid.PcdPcieResetGpioPin|14
  gRk356xTokenSpaceGuid.PcdPciePowerGpioBank|0
  gRk356xTokenSpaceGuid.PcdPciePowerGpioPin|15

  #
  # This module has a WiFi card on the second MSHC
  #
  gRk356xTokenSpaceGuid.PcdMshc1Status|0xF
  gRk356xTokenSpaceGuid.PcdMshc1SdioIrq|TRUE
  gRk356xTokenSpaceGuid.PcdMshc1NonRemovable|TRUE

  #
  # Limit eMMC to 52 MHz
  #
  gRk356xTokenSpaceGuid.PcdEmmcForceHighSpeed|TRUE

  #
  # Silergy SYR837 regulator
  #
  gRk356xTokenSpaceGuid.PcdCpuVoltageI2cAddr|0x40
  gRk356xTokenSpaceGuid.PcdCpuVoltageVselReg|0x0
  gRk356xTokenSpaceGuid.PcdCpuVoltageUVolBase|712500
  gRk356xTokenSpaceGuid.PcdCpuVoltageUVolStep|12500

[PcdsDynamicHii.common.DEFAULT]
  #
  # ConfigDxe
  #
  gRk356xTokenSpaceGuid.PcdSystemTableMode|L"SystemTableMode"|gConfigDxeFormSetGuid|0x0|0
  gRk356xTokenSpaceGuid.PcdCpuClock|L"CpuClock"|gConfigDxeFormSetGuid|0x0|2
  gRk356xTokenSpaceGuid.PcdCustomCpuClock|L"CustomCpuClock"|gConfigDxeFormSetGuid|0x0|816