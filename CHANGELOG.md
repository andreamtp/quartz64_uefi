#### v1.3

* Update edk2 to edk2-stable202602.
* Update rkbin to latest from https://github.com/rockchip-linux/rkbin
* Simplified board specific .dsc files.
* Avoid lockup in PCIe setup when the M.2 header is not populated (#75)
* Rk356x: Disable host bridge device if PHY init fails.
* RK356x: combine Gmac interrupts into single statement (#58)
* Platform/OrangePi3B: Fix AcpiTables (#72)
* RK356x: Remove 'env' partition. (#59, #67)
* ROC-RK3568-PC: Configure and enable UART3 and UART4.
* New platform support
    * Odroid M1S
    * PINE64 PineTab 2
    * Radxa Zero 3W