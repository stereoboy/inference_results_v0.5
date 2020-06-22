source ./settings.sh

echo "##################################################################"
echo "DEVICE=${DEVICE}"
echo "MODEL=${MODEL}"
echo "##################################################################"

DATETIME=$(date '+%Y%m%d_%H%M%S');
mkdir -p ./logs/${DEVICE}

#make run_harness RUN_ARGS="--benchmarks=ssd-large --scenarios=SingleStream --test_mode=PerformanceOnly"
#make run_harness RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStream --test_mode=PerformanceOnly --warmup_duration 20"

start=`date +%s`
cp -f ./build/engines/${DEVICE}/ssd-small/SingleStream/ssd-small-${MODEL}-SingleStreamB1-gpu-b1-int8.plan ./build/engines/${DEVICE}/ssd-small/SingleStream/ssd-small-SingleStream-gpu-b1-int8.plan 
make run_harness RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStream --test_mode=PerformanceOnly --warmup_duration 5"       2>&1 | tee ./logs/${DEVICE}/${MODEL}_B1_${DATETIME}.log
end=`date +%s`
runtime=$((end-start))
echo "Elapsed Time: $runtime seconds"
echo "Elapsed Time: $runtime seconds" >> ./logs/${DEVICE}/${MODEL}_B1_${DATETIME}.log

start=`date +%s`
cp -f ./build/engines/${DEVICE}/ssd-small/SingleStreamB2/ssd-small-${MODEL}-SingleStreamB2-gpu-b2-int8.plan ./build/engines/${DEVICE}/ssd-small/SingleStreamB2/ssd-small-SingleStreamB2-gpu-b2-int8.plan
make run_harness RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStreamB2 --test_mode=PerformanceOnly --warmup_duration 5"     2>&1 | tee ./logs/${DEVICE}/${MODEL}_B2_${DATETIME}.log
end=`date +%s`
runtime=$((end-start))
echo "Elapsed Time: $runtime seconds"
echo "Elapsed Time: $runtime seconds" >> ./logs/${DEVICE}/${MODEL}_B2_${DATETIME}.log

start=`date +%s`
cp -f ./build/engines/${DEVICE}/ssd-small/SingleStreamB4/ssd-small-${MODEL}-SingleStreamB4-gpu-b4-int8.plan ./build/engines/${DEVICE}/ssd-small/SingleStreamB4/ssd-small-SingleStreamB4-gpu-b4-int8.plan
make run_harness RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStreamB4 --test_mode=PerformanceOnly --warmup_duration 5"     2>&1 | tee ./logs/${DEVICE}/${MODEL}_B4_${DATETIME}.log
end=`date +%s`
runtime=$((end-start))
echo "Elapsed Time: $runtime seconds"
echo "Elapsed Time: $runtime seconds" >> ./logs/${DEVICE}/${MODEL}_B4_${DATETIME}.log

start=`date +%s`
cp -f ./build/engines/${DEVICE}/ssd-small/SingleStreamB8/ssd-small-${MODEL}-SingleStreamB8-gpu-b8-int8.plan ./build/engines/${DEVICE}/ssd-small/SingleStreamB8/ssd-small-SingleStreamB8-gpu-b8-int8.plan
make run_harness RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStreamB8 --test_mode=PerformanceOnly --warmup_duration 5"     2>&1 | tee ./logs/${DEVICE}/${MODEL}_B8_${DATETIME}.log
end=`date +%s`
runtime=$((end-start))
echo "Elapsed Time: $runtime seconds"
echo "Elapsed Time: $runtime seconds" >> ./logs/${DEVICE}/${MODEL}_B8_${DATETIME}.log

make run_harness RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStream --test_mode=AccuracyOnly"                              2>&1 | tee ./logs/${DEVICE}/${MODEL}_AC_${DATETIME}.log
