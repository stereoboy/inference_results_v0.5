DEVICE=GeforceRTX2080Ti
#DEVICE=GeforceGTX1080Ti
#DEVICE=Xavier
#MODEL=ssd_mobilenet_v1_coco_2018_01_28
MODEL=ssdlite_mobilenet_v2_coco_2018_05_09
#MODEL=ssd_inception_v2_coco_2018_01_28
#MODEL=ssdlite_mobilenet_v2_ball
#MODEL=ssdlite_mobilenet_v1_ball_2020_06_04
DATETIME=$(date '+%Y%m%d_%H%M%S');
mkdir -p ./logs/${DEVICE}

#make run_harness RUN_ARGS="--benchmarks=ssd-large --scenarios=SingleStream --test_mode=PerformanceOnly"
#make run_harness RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStream --test_mode=PerformanceOnly --warmup_duration 20"

start=`date +%s`
make run_harness RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStream --test_mode=PerformanceOnly --warmup_duration 5"       2>&1 | tee ./logs/${DEVICE}/${MODEL}_B1_${DATETIME}.log
end=`date +%s`
runtime=$((end-start))
echo "Elapsed Time: $runtime seconds"
echo "Elapsed Time: $runtime seconds" >> ./logs/${DEVICE}/${MODEL}_B1_${DATETIME}.log

start=`date +%s`
make run_harness RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStreamB2 --test_mode=PerformanceOnly --warmup_duration 5"     2>&1 | tee ./logs/${DEVICE}/${MODEL}_B2_${DATETIME}.log
end=`date +%s`
runtime=$((end-start))
echo "Elapsed Time: $runtime seconds"
echo "Elapsed Time: $runtime seconds" >> ./logs/${DEVICE}/${MODEL}_B2_${DATETIME}.log

start=`date +%s`
make run_harness RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStreamB4 --test_mode=PerformanceOnly --warmup_duration 5"     2>&1 | tee ./logs/${DEVICE}/${MODEL}_B4_${DATETIME}.log
end=`date +%s`
runtime=$((end-start))
echo "Elapsed Time: $runtime seconds"
echo "Elapsed Time: $runtime seconds" >> ./logs/${DEVICE}/${MODEL}_B4_${DATETIME}.log

start=`date +%s`
make run_harness RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStreamB8 --test_mode=PerformanceOnly --warmup_duration 5"     2>&1 | tee ./logs/${DEVICE}/${MODEL}_B8_${DATETIME}.log
end=`date +%s`
runtime=$((end-start))
echo "Elapsed Time: $runtime seconds"
echo "Elapsed Time: $runtime seconds" >> ./logs/${DEVICE}/${MODEL}_B8_${DATETIME}.log

make run_harness RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStream --test_mode=AccuracyOnly"                              2>&1 | tee ./logs/${DEVICE}/${MODEL}_AC_${DATETIME}.log
#make run_harness RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStreamB8 --test_mode=AccuracyOnly"
#make run_harness RUN_ARGS="--benchmarks=ssd-small --scenarios=SingleStream"
