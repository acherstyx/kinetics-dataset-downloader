import os
import glob
import numpy as np
import argparse
import tqdm

parser = argparse.ArgumentParser(description="kinetics preprocess")

parser.add_argument("csv", help="kinetics label file")
parser.add_argument("videos", metavar="DIR", help="path to the video file")


def load_label(csv):
    table = np.loadtxt(csv, skiprows=1, dtype=str, delimiter=",")

    return {k: v.replace('"', "") for k, v in zip(table[:, 1], table[:, 0])}


def mv(file, subdir_class):
    root_dir, f_name = os.path.split(file)
    if not os.path.exists(os.path.join(root_dir, subdir_class)):
        os.mkdir(os.path.join(root_dir, subdir_class))
    os.rename(video_file, os.path.join(root_dir, subdir_class, f_name))


if __name__ == '__main__':
    args = parser.parse_args()
    print(args)

    label_dict = load_label(args.csv)

    video_file_list = glob.glob(args.videos + "/*_*_*.mp4", recursive=False)

    for video_file in tqdm.tqdm(video_file_list):
        video_class = label_dict[os.path.split(video_file)[1][:11]]
        mv(video_file, video_class)
