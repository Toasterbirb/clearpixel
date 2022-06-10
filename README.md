# Clearpixel

## Dependencies
- waifu2x-ncnn-vulkan
- imagemagick
- mediainfo
- bc
- awk
- sed

## Usage
```
Usage: clearpixel [options] -i INPUT_FILE -o OUTPUT_FILE

Options:
  -i input-file         Path to the image file that needs processing
  -o output-file        Output image path
  -d downscale-rate     Downscale the picture before upscaling by a percentage.
                        Can help with pictures that are low in quality proportional
                        to the resolution. (0% - 100%, default = 100%)
                        Ex. 95% would downscale the picture to 95% of the original resolution
  -u upscale-rate       Upscale ratio. (1 - 32, default = 2)
  -n denoise-rate       Denoising rate. (-1 - 3, default = 1)
  -s sharpen-sigma      Denoising rate. High values can take ages to process (0 - infinity, default = 2)
  -p                    Output a preview picture instead of the final result.
                        The preview version will be half original and half upscaled
  -h | --help           Prints out this text block you are reading right now
```

## How is this different from Waifu2x etc.?
Clearpixel itself doesn't do anything special. It merely combines imagemagick and waifu2x.

I often found myself downscaling pictures before upscaling them, because that somehow resulted in better results with low qulity high resolution pictures. After doing that enough times, it just made sense to automate the whole process to save myself some time. As a cherry on top, clearpixel also does sharpening and has an option to create a preview picture that you can use to see if the quality even improved at all.
