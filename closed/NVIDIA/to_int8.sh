echo "Set GeforceRTX2080Ti int8"
cd ./measurements/GeforceRTX2080Ti/ssd-small && \
rm -f ./Offline && ln -s ./Offline_int8/ Offline && \
rm -f ./SingleStream && ln -s ./SingleStream_int8/ SingleStream && \
cd ../../..

echo "Set GeforceGTX1080Ti int8"
cd ./measurements/GeforceGTX1080Ti/ssd-small && \
rm -f ./Offline && ln -s ./Offline_int8/ Offline && \
rm -f ./SingleStream && ln -s ./SingleStream_int8/ SingleStream
