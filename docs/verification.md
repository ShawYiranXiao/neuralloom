# NeuralLoom Verification

## Completed checks

- Archived the complete supplied project folder and recorded SHA-256 hashes for its 141 substantive files, excluding `.DS_Store`.
- Verified that the staged source tabs and referenced images, audio, and CSV data match the original files byte for byte.
- Confirmed that all seven declared input groups have an image and 14 data files present.
- Parsed all 99 original CSV files and checked that their channel matrices are rectangular and their numeric values finite.
- Inspected the seven original screenshots and retained selected examples for documentation.
- Added the original AlexNet extraction script and verified its SHA-256 hash against the author-provided source.
- Checked the Python script's syntax and compared the stored output shapes with the AlexNet feature modules.

These checks cover file integrity, Python syntax, and static data structure. They do not establish that the Processing sketch compiles or runs in a fresh environment, or that the historical CSV values have been exactly regenerated. No original Python dependency lock was supplied.

## Known behavior in the preserved source

In `channels.pde`, `updateFading()` uses the features 1 channel count for every selected output except features 0. Features 1 has 64 channels, so deeper outputs with 192, 256, or 384 channels cycle only their first 64 channels. Switching the selected layer does not reset the animation state.

In the overview, cube placement uses a 0–15 input range and a configurable expansion distance. Hover projection uses a 0–10 input range and a fixed distance of 50. Numerical hover detection therefore needs to be rechecked against the displayed positions, especially after adjusting the expansion slider.

The original full-screen layout, Sathu font, image and audio loading, and dependency compatibility need a runtime check before a release is labeled runnable. The preservation copy contains no source fixes.
