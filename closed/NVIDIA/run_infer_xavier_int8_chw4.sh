python3 ./code/ssd-small/tensorrt/infer.py --engine_file ./build/engines/Xavier/ssd-small/SingleStream/ssd-small-SingleStream-gpu-b1-int8.plan --verbose --batch_size 1 --num_images 400
python3 ./code/ssd-small/tensorrt/infer.py --engine_file ./build/engines/Xavier/ssd-small/SingleStreamB2/ssd-small-SingleStreamB2-gpu-b2-int8.plan --verbose --batch_size 2 --num_images 400
python3 ./code/ssd-small/tensorrt/infer.py --engine_file ./build/engines/Xavier/ssd-small/SingleStreamB4/ssd-small-SingleStreamB4-gpu-b4-int8.plan --verbose --batch_size 4 --num_images 800
python3 ./code/ssd-small/tensorrt/infer.py --engine_file ./build/engines/Xavier/ssd-small/SingleStreamB8/ssd-small-SingleStreamB8-gpu-b8-int8.plan --verbose --batch_size 8 --num_images 1600
