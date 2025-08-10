from PIL import Image

def bmp_to_mem(input_bmp, output_mem):
    # Open the BMP file
    with Image.open(input_bmp) as img:
        # Ensure the image is in RGB or grayscale mode
        img = img.convert("RGB")
        width, height = img.size
        pixels = list(img.getdata())

    # Write the pixel data to a .mem file
    with open(output_mem, "w") as mem_file:
        # mem_file.write(f"# Memory file for {input_bmp}\n")
        # mem_file.write(f"# Width: {width}, Height: {height}\n")
        for i, pixel in enumerate(pixels):
            # Convert RGB to a hex value (e.g., 0xRRGGBB)
            hex_pixel = f"{pixel[0]:02X}{pixel[1]:02X}{pixel[2]:02X}"
            # hex_pixel = f"{pixel[0]:02X}"
            mem_file.write(hex_pixel + "\n")

# Example usage
bmp_to_mem("Testimg.bmp", "output.mem")