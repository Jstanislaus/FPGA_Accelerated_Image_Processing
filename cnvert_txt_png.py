from PIL import Image
import math

def hex_to_grayscale_image(txt_path, output_path):
    # Read and parse hex values
    with open(txt_path, 'r') as f:
        lines = f.readlines()

    # Clean and convert to integers
    pixels = []
    for line in lines:
        hex_str = line.strip().lower().replace('0x', '')
        if hex_str:  # skip empty lines
            try:
                value = int(hex_str, 16)
                pixels.append(value)
            except ValueError:
                print(f"Skipping invalid hex: {line.strip()}")

    # Determine image dimensions
    num_pixels = len(pixels)
    print(num_pixels)
    width = int(math.sqrt(num_pixels))
    height = math.ceil(num_pixels / width)

    # Pad with zeros if needed
    pixels += [0] * (width * height - num_pixels)

    # Create image
    img = Image.new('L', (width, height))  # 'L' mode = grayscale
    img.putdata(pixels)
    img.save(output_path)
    print(f"Saved image to {output_path}")

# Example usage
hex_to_grayscale_image('C:/Temp/test.txt', 'C:/Temp/output_grey.png')
