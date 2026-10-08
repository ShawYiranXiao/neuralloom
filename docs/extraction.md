# AlexNet Activation Extraction

The original [test_imagenet.py](../scripts/test_imagenet.py) is preserved unchanged. It uses PyTorch, torchvision, and Pillow to extract the intermediate data displayed by NeuralLoom.

## Model and preprocessing

The script constructs `models.alexnet(pretrained=True)` and calls `eval()`. Current torchvision maps this legacy pretrained argument to `AlexNet_Weights.IMAGENET1K_V1`; see the [official model source](https://github.com/pytorch/vision/blob/main/torchvision/models/alexnet.py).

The input image is resized to a short edge of 256 pixels and center-cropped to 224 × 224. `ToTensor()` converts it to a tensor, then `Normalize()` applies mean `[0.485, 0.456, 0.406]` and standard deviation `[0.229, 0.224, 0.225]`. These values match the [documented AlexNet preprocessing](https://docs.pytorch.org/vision/stable/models/generated/torchvision.models.alexnet.html).

## Capture and CSV export

Forward hooks are registered recursively on child modules. The hook stores `output.detach()` under names such as `features.0` and `avgpool`. After inference, the script exports every four-dimensional output, removing the single batch dimension and writing each channel as a matrix. Dots in module names become underscores in CSV filenames.

The Processing sketch uses `features_0_activations.csv` through `features_12_activations.csv` and `avgpool_activations.csv`. The extractor also writes the aggregate `features_activations.csv`, which the sketch does not use. For additional image groups, the archived filenames have prefixes such as `gold_` and `daisy_`; those prefixes are not automatically added by the original script.

The captured tensors retain shared storage. AlexNet uses in-place ReLU operations, so the exported convolution outputs can reflect subsequent ReLU changes. This archival method should not be interpreted as preserving separate pre-ReLU snapshots. See the [AlexNet implementation](https://github.com/pytorch/vision/blob/main/torchvision/models/alexnet.py) and [PyTorch detach documentation](https://docs.pytorch.org/docs/stable/generated/torch.Tensor.detach.html).

## Use the preserved script

1. Install Python with `torch`, `torchvision`, and `Pillow`. `requirements.txt` lists these dependencies; it is not a lock of the original environment.
2. In a local copy of `scripts/test_imagenet.py`, change `image_path` to the RGB image you want to process. The preserved script contains the author's original machine-specific example path.
3. Run the script from a separate output directory for each image. It writes its CSV files to the current working directory and can overwrite files with the same names.
4. Use the 14 files read by the sketch. For another category, apply the matching prefix from [the input-group table](data.md), and keep the corresponding input image with the sketch.

The first pretrained model load may download weights from PyTorch. The repository does not bundle those weights. The script prints a predicted class index, but the visualization uses the intermediate spatial outputs rather than final classification scores.

Original Python, torch, and torchvision versions were not supplied. The seven stored groups were checked for structure and integrity, not regenerated in this release.
