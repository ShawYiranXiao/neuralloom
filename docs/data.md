# NeuralLoom Data

The sketch reads seven image groups generated from a pretrained torchvision AlexNet. Each group contains 13 features outputs numbered 0–12 and one avgpool output. These include convolution, ReLU, and pooling modules; they are 14 stored intermediate outputs, not 14 convolutional layers. The original extraction method is documented in [activation extraction](extraction.md).

| Interface label | Image | CSV prefix |
| --- | --- | --- |
| Tropical Fish | `colorful-fish-swimming-among-a-vibrant-coral-reef-3d-style-illuminated-by-neon-and-fluorescent-lu.jpeg` | None |
| Gold Fish | `n01443537_288.JPEG` | `gold_` |
| Fly Agaric | `n12998815_184.JPEG` | `agaric_` |
| Volcano | `n09472597_1306.JPEG` | `volcanic_` |
| Daisy | `n11939491_662.JPEG` | `daisy_` |
| Sideview Mirror | `n02965783_40.JPEG` | `mirror_` |
| Theater | `n03032252_600.JPEG` | `theater_` |

For example, the goldfish group reads `gold_features_0_activations.csv` through `gold_features_12_activations.csv` and `gold_avgpool_activations.csv`.

## CSV format

Each file stores a sequence of channel matrices. A line such as `Channel 0` begins a channel; subsequent comma-separated rows hold floating-point values. Blank lines separate channel blocks. The Processing loader converts these into nested lists of two-dimensional arrays.

All 99 CSV files in the supplied folder were parsed during archival preparation. All channel matrices were rectangular, and all numeric values were finite. The sketch references 98 of these files. The additional `features_activations.csv` was not referenced and is retained in the complete original archive.

## Visual mapping

Matrix row and column positions form a grid. Activation values are linearly mapped to depth displacement. The mapping uses a fixed interval from 0 to 15; larger values extrapolate beyond the selected expansion distance. It is not a normalized scale across outputs.

Input image colors are sampled at matrix positions for features 0, and randomly for the other output views. They do not encode feature semantics. The overview places outputs along the depth axis and shows a limited number of channels. Individual views fade between channels; see the channel indexing limitation in [verification notes](verification.md).

The repository includes the original [PyTorch export script](../scripts/test_imagenet.py) and the data used by the visualization. Original Python package versions are not recorded, and the bundled historical CSV files were not regenerated during archival preparation.
