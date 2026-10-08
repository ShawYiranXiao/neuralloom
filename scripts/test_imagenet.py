import torch
import torchvision.models as models
import torchvision.transforms as transforms
from PIL import Image

alexnet = models.alexnet(pretrained=True)
alexnet.eval()  

activations = {}

def register_hooks(module, parent_name=''):
    for name, child in module.named_children():
        layer_name = f'{parent_name}.{name}' if parent_name else name
        child.register_forward_hook(get_activation(layer_name))
        register_hooks(child, parent_name=layer_name)

def get_activation(name):
    def hook(model, input, output):
        activations[name] = output.detach()
    return hook

register_hooks(alexnet)

transform = transforms.Compose([
    transforms.Resize(256),
    transforms.CenterCrop(224),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
])

image_path = '/home/shawxiao/data/imagenet-1k/train/n01440764/n01440764_11011.JPEG'
image = Image.open(image_path)
image = transform(image).unsqueeze(0)  
import csv

output = alexnet(image)

for name, act in activations.items():
    print(f"{name}: {act.size()}")

_, predicted = torch.max(output, 1)
print(f"Predicted class: {predicted.item()}")
# breakpoint()
for name, act in activations.items():
    # 4D output [batch_size, channels, height, width]
    if len(act.shape) == 4:
        act = act.squeeze(0)  # batch_size=1
        channels, height, width = act.shape
        safe_name = name.replace('.', '_')
        file_path = f'{safe_name}_activations.csv'
        
        with open(file_path, 'w', newline='') as csvfile:
            writer = csv.writer(csvfile)
            
            for channel in range(channels):
                writer.writerow([f'Channel {channel}'])
                for row in range(height):
                    writer.writerow(act[channel, row, :].tolist())
                writer.writerow([]) 

# print("Activations have been saved to CSV files in /mnt/data/")
print("All activations have been saved to separate CSV files in this directory")
# breakpoint()
