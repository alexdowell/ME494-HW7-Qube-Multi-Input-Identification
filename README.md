# ME494 HW7: Qube Multi Input Identification  

## Description  
This repository contains the seventh homework assignment for **ME494**, focusing on system identification using multi-step and multisine input signals applied to a Quanser Qube system. The assignment involves ordinary least squares (OLS) estimation, frequency-domain regression, and analyzing system behavior under different input conditions. The repository includes MATLAB scripts, datasets, and a PDF containing problem descriptions.  

## Files Included  

### **Part 1: Multi-Step and Multi-Sine Input Signals**  
- **File:** ME_494_HW_7.m  
- **File:** ME_494_HW7_sine_input.mat  
- **File:** ME_494_HW7_step_input.mat  
- **Topics Covered:**  
  - Designing **multi-step (3-2-1-1)** and **multisine** input signals  
  - Frequency range selection for system excitation  
  - Signal characteristics evaluation and plotting  

### **Part 2: Quanser Qube Motion Data Collection**  
- **File:** ME_494_HW7_sine_data.mat  
- **File:** ME_494_HW7_step_data.mat  
- **File:** ME_494_HW7_sine_data_KO.mat  
- **Topics Covered:**  
  - Measuring system response to different inputs  
  - Recording angular position, velocity, and acceleration  
  - Evaluating the effect of weight removal on system dynamics  

### **Part 3: OLS Estimation and Model Validation**  
- **File:** ME_494_HW_7.m  
- **Topics Covered:**  
  - Estimating system parameters using **ordinary least squares (OLS)**  
  - Computing coefficients for multi-step and multisine models  
  - Confidence interval calculation and R² analysis  
  - Comparison of **time-domain and frequency-domain regression**  

### **Part 4: Residual Analysis and Model Performance**  
- **File:** deriv.m  
- **Topics Covered:**  
  - Supporting numerical differentiation for estimating velocity and acceleration  
  - Residual analysis to evaluate model performance  
  - Assessing model accuracy under different excitation conditions  

### **Homework Assignment Document**  
- **File:** SID_HW7_2022.pdf  
- **Contents:**  
  - Problem descriptions and equations  
  - MATLAB implementation steps  
  - Expected results and discussion points  

## Installation  
Ensure MATLAB is installed before running the scripts. No additional toolboxes are required.  

## Usage  

### **Generating and Analyzing Input Signals**  
1. Open MATLAB.  
2. Run the script:  
   ```ME_494_HW_7```  
3. View generated **multi-step and multisine input signals**.  
4. Analyze their impact on system response.  

### **Running OLS Estimation for Qube Motion**  
1. Open MATLAB.  
2. Load `ME_494_HW7_sine_data.mat` and `ME_494_HW7_step_data.mat` into the workspace.  
3. Run the script:  
   ```ME_494_HW_7```  
4. View estimated system parameters and compare modeled vs. actual responses.  

### **Performing Residual and Frequency-Domain Analysis**  
1. Open MATLAB.  
2. Run the script:  
   ```ME_494_HW_7```  
3. Observe residuals over time and assess frequency-domain estimation.  

## Example Output  

- **Multi-Step and Multi-Sine Input Signal Characteristics**  
  - Signal amplitude: **0.2 V**  
  - Multi-step time periods: **10 sec per segment**  
  - Frequency range: **low and small for effective system excitation**  

- **System Identification Results**  
  - **Step Response Model:** Estimated R² = **0.8887**  
  - **Multisine Response Model:** Estimated R² = **0.7923**  
  - **Knock-Off Experiment Model:** R² drop after weight removal  

- **Residual and Frequency-Domain Analysis**  
  - Comparison of **time-domain and frequency-domain** least squares fits  
  - Evaluation of model performance before and after weight removal  

## Contributions  
This repository is intended for academic research and educational use. Contributions and modifications are welcome.  

## License  
This project is open for research and educational purposes.  

---  
**Author:** Alexander Dowell  

