# Data Directory

This directory contains the dataset used in the project.

## Obtaining the Dataset

The retail orders dataset is available on Kaggle. To download it:

### Method 1: Using Kaggle API (Recommended)

1. Install Kaggle API:
```bash
pip install kaggle
```

2. Set up your Kaggle API credentials:
   - Go to your Kaggle account settings: https://www.kaggle.com/settings
   - Click "Create New API Token"
   - Save the downloaded `kaggle.json` file to `~/.kaggle/`

3. Download the dataset:
```bash
kaggle datasets download ankitbansal06/retail-orders -f orders.csv
```

### Method 2: Manual Download

1. Visit the Kaggle dataset page: https://www.kaggle.com/datasets/ankitbansal06/retail-orders
2. Click "Download" button
3. Extract the downloaded file
4. Place the CSV file in this `data/` directory

## Data Files

After downloading, you should have:
- `orders.csv` - Main retail orders dataset

## Note

Data files are not included in the repository due to size constraints and licensing. Please download them using one of the methods above.

## Data Description

The dataset contains retail order information including:
- Order ID
- Product details
- Customer information
- Sales amounts
- Dates and timestamps
- Regional information
- Discount and pricing data
