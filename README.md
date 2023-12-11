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


## Project 2: Determining the Gravitational Constant (G) from Henry Cavendish's Experiment

### Overview

In the second homework project, you conducted a computational analysis of Henry Cavendish's experiment to determine the gravitational constant (G). The project is outlined as follows:

### Gnuplot Script 1

1. **Data Fitting:**
   - Utilized Gnuplot to fit a sinusoidal function (`S(t)`) to experimental data from Cavendish's experiment.
   - Fitted two datasets corresponding to forward and reverse motions, obtaining parameters (`So`, `A`, `tau`, `T`, `b`).

2. **Visualization:**
   - Plotted the experimental data points and the fitted sinusoidal function for both forward and reverse motions.

### Computation of Gravitational Constant (G)

1. **Mathematical Model:**
   - Employed the fitted parameters to calculate G using the equation provided in the manual.

   $$ G = \pi^2 \Delta S b^2 \frac{(d^2 + \frac{2}{5}r^2)}{T^2 m_1 L d} $$

## Project 3: Determining the Gravitational Constant (G) from Henry Cavendish's Experiment - Computational Analysis using Octave

### Octave Script

You provided an Octave script that performs a computational analysis of Henry Cavendish's experiment. The script includes data processing, plotting, curve fitting, and the calculation of the gravitational constant. Here's a breakdown of the key components:

### Data Processing and Plotting

1. **Data Import:**
   - Imported forward and reverse data from files, ignoring header lines.
   - Stored time (`t1`, `t2`) and position (`p1`, `p2`) values.

2. **Plotting:**
   - Plotted the forward and reverse data on separate subplots.
   - Created a third subplot with both forward and reverse data.

### Curve Fitting and Parameter Extraction

1. **Model Function Definition:**
   - Defined model functions (`s_t1`, `s_t2`) representing the assumed equation of motion for forward and reverse motions.

2. **Curve Fitting:**
   - Used the `nonlin_curvefit` function to fit the model to the data and extract parameters.
   - Displayed the fitted parameters for both forward and reverse motions.

3. **Visualization:**
   - Plotted the fitted curves along with the original data on separate plots.

### Gravitational Constant Calculation

1. **Gravitational Constant Equation:**
   - Used the equation provided in the manual to calculate G.

$$ G = \pi^2 \Delta S b^2 \frac{(d^2 + \frac{2}{5}r^2)}{T^2 m_1 L d} $$


### Requirements
- Gnuplot

### Steps
1. **Gnuplot Script 1:**
   - Run Gnuplot script:
     ```bash
     gnuplot script1.gp
     ```

2. **Computation of Gravitational Constant (G):**
   - Execute calculation script.




## Project 4: Long-Term Trends and Influences in Atmospheric Data

### Overview

This project involves analyzing atmospheric data spanning various zones and incorporating insights from solar activity and atmospheric transparency. The data includes temperature variations in the lower stratosphere, mid-troposphere, and lower troposphere, as well as sunspot count and sunspot area data. The analysis is performed using Jupyter notebooks, with a portion of the code implemented in C programming for efficiency.

### Data Processing

The code begins by reading data from different files, extracting relevant columns, and transforming the data into decimal years for consistency.

### Temperature and Sunspot Analysis

Two subplots are created to visualize changes in global average atmospheric temperatures and sunspot activity over the years. The temperature data is segmented into lower stratosphere, mid-troposphere, and lower troposphere. Sunspot count and sunspot area data are plotted on a dual y-axis subplot.

### Correlation Analysis

Correlation coefficients are calculated to assess the relationship between temperature and sunspot activity. Cross-covariance analysis is performed to determine time lags in the correlation between temperature and sunspot counts.

### Linear Regression and Residual Analysis

The code includes linear regression analysis to assess long-term trends in temperature. Residuals are calculated, and linear fits are plotted for lower stratosphere, mid-troposphere, and lower troposphere temperatures against sunspot counts and atmospheric transparency.

### Slope Analysis and Significance Testing

Long-term trends are assessed using slope analysis with 95% confidence intervals. The significance of slopes in atmospheric transparency is discussed in the context of Earth's radiative energy balance.

### Regression Estimates and Influences on Temperature

The code calculates regression estimates to compare the influences of solar activity and atmospheric transparency on temperature in each atmospheric zone. The magnitude of regression estimates is interpreted to determine the strength of each influencer's impact.


### Requirements
- Octave

### Steps
1. **Run Jupyter Notebook:**
   - Execute the notebook in a Jupyter environment.

## Project 5: Inverse Theory

In the fifth project of the computational physics assignment, I delved into inverse theory using MATLAB/Octave. Here's a summary of the key aspects:

### Linear Regression
* Conducted linear regression on given data points `(x_data, y_data)` using the formula `c = A \ y_data`.
* Visualized the linear regression fit alongside the original data.

### QR Factorization
* Explored an alternative view of linear regression using QR factorization.
* Demonstrated that QR factorization yields identical results to linear regression.

### Constrained Least Squares
* Extended the analysis to constrained least squares fitting, solving a problem of the form `r = A * c`.
* Visualized the results alongside linear regression.

### Exponential Analysis
* Implemented exponential analysis for time decay curves using a multi-exponential model.
* Explored regularization techniques, including Tikhonov regularization.
* Plotted the trade-off between misfit and model complexity.

### Temperature-dependent Analysis
* Extended the analysis to temperature-dependent data.
* Chose a regularization parameter for each temperature.
* Plotted original data and pseudo-inverse solutions for comparison.

These analyses collectively showcase a comprehensive exploration of inverse theory, covering linear regression, QR factorization, constrained least squares, and exponential analysis in the context of computational physics.

### Requirements
- MATLAB/Octave

### Steps
1. **Run MATLAB/Octave:**
   - Execute the script in MATLAB/Octave.

## Project 6: Fourier Transform and Image Processing

In the sixth project of the computational physics assignment, I explored Fourier Transform and Image Processing using Jupyter Notebook. Here's an overview of the key components:

### Time-domain Signal and Fourier Transform
* Created a time-domain signal with two square pulses.
* Plotted the time-domain signal and computed the magnitude and phase spectra using the Fourier Transform.
* Visualized the power spectrum and phase spectrum.

### 2D Cosine Wave with Gaussian Envelope
* Generated a 2D cosine wave with a Gaussian envelope.
* Displayed the image and created a 3D mesh plot for visualization.

### Periodic-Plus-Perfect Fourier Transform (PPFFT)
* Implemented PPFFT on the generated image with varying Gaussian decay rates.
* Explored amplitude plots, original image plots, and 3D mesh plots for different decay rates.

### Image Processing with PPFFT
* Applied PPFFT to a real image obtained from a specified path.
* Displayed the original image and the PPFFT amplitude and phase plots.
* Set oversampling factor and adjusted shuffling vectors for optimal results.

These analyses collectively demonstrate a practical application of Fourier Transform and Image Processing techniques in computational physics.


### Requirements
- Jupyter notebook environment

### Steps
1. **Run Jupyter Notebook:**
   - Execute the notebook in a Jupyter environment.
  

## 7. Metropolis Algorithm Simulation for Ising Model

### Overview

This GitHub repository contains the code for the seventh homework project in the computational physics assignment, focusing on the Metropolis algorithm simulation for the Ising model. The Ising model is a mathematical model in statistical mechanics used to simulate the behavior of ferromagnetic materials.

### Code Structure

The main functionalities are encapsulated in the following functions:

1. **DisplayIsing**
   - Purpose: Visualize the Ising model configuration.
   - Parameters: `S` - Ising model configuration matrix, `up_colour` and `dn_colour` - colors for up and down spins.

2. **evolve**
   - Purpose: Implement the Metropolis algorithm to evolve the Ising model configuration.
   - Parameters: `config` - current configuration, `beta` - inverse temperature.

### Simulation Process

The simulation is divided into several key steps:

1. **Initialization**
   - Set up initial lattice configuration and calculate initial parameters.

2. **Equilibration**
   - Perform Monte Carlo steps to reach equilibrium, ensuring a stable starting point.

3. **Calculation**
   - Perform additional Monte Carlo steps for calculation, accumulating thermodynamic quantities such as energy and magnetization.

4. **Visualization**
   - Display the Ising model configuration at selected iterations for visual analysis.

5. **Results and Conclusion**
   - Analyze the results, including graphs of energy, magnetization, specific heat, and susceptibility.
   - Explore ferromagnetic and anti-ferromagnetic states, as well as the impact of considering next nearest neighbors.

### Results and Conclusion

The README includes a detailed section on the results and conclusions drawn from the simulations. It covers the observed behavior in ferromagnetic and anti-ferromagnetic states, highlighting the impact of modifications to the code. The study also explores the influence of next nearest neighbors on the Ising model dynamics.

### Requirements
- Python environment
- Matplotlib library

### Steps
1. **Run Python Script:**
   - Execute the Python script to perform the simulation:
     ```bash
     python ising_simulation.py
     ```



