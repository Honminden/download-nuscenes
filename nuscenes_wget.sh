#!/usr/bin/env bash
FNAMES=(
v1.0-trainval_meta.tgz
v1.0-trainval01_blobs.tar
v1.0-trainval02_blobs.tar
v1.0-trainval03_blobs.tgz
v1.0-trainval04_blobs.tgz
v1.0-trainval05_blobs.tgz
v1.0-trainval06_blobs.tgz
v1.0-trainval07_blobs.tgz
v1.0-trainval08_blobs.tgz
v1.0-trainval09_blobs.tgz
v1.0-trainval10_blobs.tgz
)

mkdir temp

for FNAME in ${FNAMES[@]}
do
FNAME_URL=./temp/${FNAME}_url
FNAME_URL_LOG=./temp/${FNAME_URL}.log
FNAME_LOG=./temp/${FNAME}.log
# change headers if necessary
HEADER_AUTH="authority: o9k5xn5546.execute-api.us-east-1.amazonaws.com"
HEADER_AUTHKEY="authorization: $(cat ./authkey)"
BROWSER="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.102 Safari/537.36 Edg/104.0.1293.70"
REQ_URL="https://o9k5xn5546.execute-api.us-east-1.amazonaws.com/v1/archives/v1.0/${FNAME}?region=asia&project=nuScenes"
wget -c -U "$BROWSER" --header="$HEADER_AUTH" --header="accept: application/json" --header="accept-language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6" --header="$HEADER_AUTHKEY" --header="origin: https://www.nuscenes.org" --header="referer: https://www.nuscenes.org/" -O $FNAME_URL -o $FNAME_URL_LOG "$REQ_URL"
TEMP1=$(cat $FNAME_URL)
echo ${TEMP1:9} > $FNAME_URL
TEMP2=$(cat $FNAME_URL)
echo ${TEMP2%\"\}} > $FNAME_URL
DOWN_URL=$(cat $FNAME_URL)
echo $DOWN_URL
wget -c -U "$BROWSER" --header="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" --header="Accept-Encoding: gzip, deflate, br" --header="Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6" --header="Connection: keep-alive" --header="Host: s3.ap-southeast-1.amazonaws.com" --header="Referer: https://www.nuscenes.org/" --header="Upgrade-Insecure-Requests: 1" -O "/your-path-to-dataroot/${FNAME}" -o $FNAME_LOG "$DOWN_URL"&
done
