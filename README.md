# kinetics-dataset-downloader

Step 1. Download the dataset from [cvdfoundation/kinetics-dataset](https://github.com/cvdfoundation/kinetics-dataset) using the official download scrips.

```bash
bash download.sh k400_train_path.txt
# extract
bash extract.sh k400_train_path.txt
```

Step 2. Download new annotation (See the README.md from [cvdfoundation/kinetics-dataset](https://github.com/cvdfoundation/kinetics-dataset) to get the latest URL)

```bash
wget https://s3.amazonaws.com/kinetics/400/annotations/train.csv
```

Step 3. Run `make_subdirectory.py` to divide videos into subdirectories according to their label.


```bash
python make_subdirectory.py train.csv /path/to/video/folder
```