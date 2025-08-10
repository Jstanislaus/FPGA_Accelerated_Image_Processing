# FPGA_Accelerated_Image_Processing
Real-time sailboat recognition requires low-latency processing. By using FPGA hardware to preprocess incoming frames, we can reduce CPU load and improve inference speed, enabling portable, low-power boat tracking systems for race monitoring.

## Project Overview
- **Goal:** Improve inference speed and accuracy for a dinghy recognition ML model.
- **Approach:** Perform preprocessing in hardware before passing data to a CPU/ML pipeline.
- **Hardware:** Digilent Basys 3 FPGA (Xilinx Artix-7)

## Data Flow
Camera --> FPGA (Greyscale --> Edge Detection --> Downsampling) --> CPU (ML Model) --> Output

## Current Features
✅ Read/write BMP image files in Verilog simulation  
✅ Convert RGB images to grayscale in simulation  

## Next Steps
Implement binary thresholding  
Add Sobel edge detection  
Perform file size reduction (downsampling)  
Deploy on hardware (Basys 3)  
Integrate with ML classification + OCR


## Getting Started
1. Clone the repository:
   ```bash
   git clone https://github.com/username/FPGA_Accelerated_Image_Processing.git

(AIM, not yet achieved):
2. Open in Vivado and run the simulation testbench
3. View the output images generated
   
## Tech Stack
- Verilog HDL
- Xilinx Vivado
- ModelSim (simulation)
- Python (image file conversion)
- TensorFlow Lite / OpenCV (ML model)

## Tech Stack
Real-time image recognition in low-power systems needs speed and efficiency. FPGA preprocessing reduces the data load on the CPU, enabling faster and more reliable predictions in the field.
