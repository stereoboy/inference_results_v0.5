echo "Set GeforceRTX2080Ti fp32"
cd ./measurements/GeforceRTX2080Ti/ssd-small && \
rm -f ./Offline && ln -s ./Offline_fp32/ Offline && \
rm -f ./SingleStream && ln -s ./SingleStream_fp32/ SingleStream && \
cd ../../..

echo "Set GeforceGTX1080Ti fp32"
cd ./measurements/GeforceGTX1080Ti/ssd-small && \
rm -f ./Offline && ln -s ./Offline_fp32/ Offline && \
rm -f ./SingleStream && ln -s ./SingleStream_fp32/ SingleStream
