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
for FNAMES in ${FNAMES[@]}
do
	fpath=/your-path-to-dataroot/$FNAMES
	md5sum $fpath >> md5sum_all.log
done
