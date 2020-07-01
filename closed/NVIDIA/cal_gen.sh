source ./settings.sh

echo "##################################################################"
echo "DEVICE=${DEVICE}"
echo "MODEL=${MODEL}"
echo "##################################################################"
echo ""

#make calibrate RUN_ARGS="--benchmarks=ssd-small"

DEVICE=${DEVICE} MODEL=${MODEL} make generate_engines RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStream"
mv ./build/engines/${DEVICE}/ssd-small/SingleStream/ssd-small-SingleStream-gpu-b1-int8.plan ./build/engines/${DEVICE}/ssd-small/SingleStream/ssd-small-${MODEL}-SingleStreamB1-gpu-b1-int8.plan

DEVICE=${DEVICE} MODEL=${MODEL} make generate_engines RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStreamB2"
mv ./build/engines/${DEVICE}/ssd-small/SingleStreamB2/ssd-small-SingleStreamB2-gpu-b2-int8.plan ./build/engines/${DEVICE}/ssd-small/SingleStreamB2/ssd-small-${MODEL}-SingleStreamB2-gpu-b2-int8.plan

DEVICE=${DEVICE} MODEL=${MODEL} make generate_engines RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStreamB4"
mv ./build/engines/${DEVICE}/ssd-small/SingleStreamB4/ssd-small-SingleStreamB4-gpu-b4-int8.plan ./build/engines/${DEVICE}/ssd-small/SingleStreamB4/ssd-small-${MODEL}-SingleStreamB4-gpu-b4-int8.plan

DEVICE=${DEVICE} MODEL=${MODEL} make generate_engines RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStreamB8"
mv ./build/engines/${DEVICE}/ssd-small/SingleStreamB8/ssd-small-SingleStreamB8-gpu-b8-int8.plan ./build/engines/${DEVICE}/ssd-small/SingleStreamB8/ssd-small-${MODEL}-SingleStreamB8-gpu-b8-int8.plan
