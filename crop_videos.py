#!/mnt/e/Anaconda/python.exe

import os

def search_file(root):
    for file in os.listdir(root):
        full_path = os.path.join(root, file)
        if os.path.isdir(full_path):
            search_file(full_path)
        elif full_path.rsplit(r".")[-1] == "mp4":
            if full_path.rsplit(r"_")[-1] == r"new.mp4":
                continue
            # print(full_path)
            new_path = "_new.".join(full_path.rsplit(r".", 1))
            cmd = f"ffmpeg.exe -y -i \"{full_path}\" -vf crop=1152:648:0:36 -s 1920x1080 \"{new_path}\""
            # print(cmd)
            os.system(cmd)
            if os.path.exists(f"{new_path}"):
                os.system(f"rm -f {full_path}")

search_file(".")
