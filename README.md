# BASYS3 Digital Alarm Clock FPGA Project

## Overview
This project, developed by Ahmed Elkhodary, Khaled Nana, and Youssef Ibrahim, is part of the Digital Design 1 course at the American University in Cairo (AUC) taught by Dr. Shalaan. The project aims to design and implement a simple digital alarm clock using the BASYS3 FPGA board.

## Requirements
- The project utilizes BASYS3 peripherals: LD0, LD12, LD13, LD14, LD15, 7-Segment display, and push buttons.
- The 7-Segment display is configured to show 2 digits for hours and 2 digits for minutes.
- Two modes are implemented: "clock/alarm" and "adjust".
- The default mode is "clock/alarm".
- In "clock/alarm" mode:
  - LD0 is OFF.
  - The 2nd decimal point blinks with a frequency of 1Hz.
  - LD0 blinks when the current time matches the set alarm time.
- In "adjust" mode:
  - LD0 is ON.
  - The 2nd decimal point does not blink.
  - Pressing BTNC exits adjust mode to clock/alarm mode.
  - Pressing BTNL or BTNR selects the parameter to adjust: time hour, time minute, alarm hour, alarm minute.
  - LD12, LD13, LD14, LD15 states reflect the parameter being adjusted.
  - BTNU increments the selected parameter.
  - BTND decrements the selected parameter.

## Structure
- `Documentation/`: Contains project documentation, including block diagram, ASM chart, and final report.
- `Verilog/`: Holds Verilog source files for FPGA implementation.
- `Logisim/`: If applicable, stores Logisim Evolution project files for simulation.
- `Audio/`: Contains audio files for the alarming sound (if bonus feature is implemented).

## Usage
1. Clone the repository to your local machine.
2. Follow the instructions in the README files within each directory for setup and usage.
3. Refer to the project documentation for detailed information on the design and implementation.

## Contribution
Contributions to the project are welcome. If you encounter any issues or have suggestions for improvement, please open an issue or submit a pull request.

## Contributors
- [Ahmed Elkhodary](https://github.com/aae121)
- [Khaled Nana](https://github.com/khalednana)
- [Youssef Ibrahim](https://github.com/Youssefibrahim03)


