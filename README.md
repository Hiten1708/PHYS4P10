# 🚀 Computational Physics Homework Projects

## Project 1: Introduction to C Programming

### Overview

In the first homework project, you delved into the fundamentals of C programming to develop a program that generates a Gaussian wave packet impacting an energy barrier. The project is structured as follows:

1. **JavaScript Initialization:**
   - Used JavaScript to configure the notebook environment, specifically defining a function (`IPython.tab_as_tab_everywhere`) to set tab usage preferences for CodeMirror instances.

2. **Bash Commands:**
   - Created a directory (`5P10`) if it didn't exist and navigated into it.
   - Removed and recreated a directory (`packet`) for storing project files.

3. **Fortran Code (`add_wave.f`):**
   - Developed a Fortran subroutine (`add_wave`) to add a specified wave to a complex storage array.
   - Implemented a wave packet with defined coefficients based on given boundary conditions.
   - Utilized loops to calculate the wave function values at different regions (left, inside, right of the barrier).

4. **Makefile (`Makefile`):**
   - Defined compiler flags, libraries, and rules for building the `packet` program.
   - Incorporated a default implicit rule for converting `.c` files to object files.

5. **C Code (`packet.c`):**
   - Created a C program to generate a Gaussian wave packet impacting an energy barrier.
   - Implemented command-line options for customization (e.g., number of waves, time, barrier height, etc.).
   - Calculated wave function amplitudes and coefficients based on given parameters.
   - Ensured validity checks for input values and terminated with informative error messages.

6. **Gnuplot Script (`gnuplot`):**
   - Generated a Gnuplot script to visualize the scattering of the Gaussian wave packet at different time steps.
   - Plotted the potential energy (`V(x)`) and the wave packet at specific time intervals.

### How to Run

To execute the simulation and visualize the results, you can follow these steps:

1. Ensure you have the required dependencies installed (e.g., Fortran compiler, Gnuplot).
2. Run the provided Bash commands and compile the `packet` program using the provided Makefile (`make packet`).
3. Execute the `packet` program with desired command-line options to customize the simulation.
4. Run the Gnuplot script to visualize the scattering of the Gaussian wave packet.

Feel free to explore and modify the parameters to observe different scenarios in the wave packet simulation. 🌊🔬
