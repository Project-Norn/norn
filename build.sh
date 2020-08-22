#!/bin/bash

bin_dir="bin"

echo " ==> updating"
git submodule foreach git pull origin master

echo " ==> building"
cur_dir=$(pwd)
cd ${cur_dir}/verdandi && cargo build --release
cd ${cur_dir}/skuld && cargo build --release
cd ${cur_dir}/urd && cargo build --release

echo " ==> copying binary"
mkdir -p ${cur_dir}/${bin_dir}
cp ${cur_dir}/verdandi/target/release/verdandi ${cur_dir}/${bin_dir}
cp ${cur_dir}/skuld/target/release/skuld ${cur_dir}/${bin_dir}
cp ${cur_dir}/urd/target/release/urd ${cur_dir}/${bin_dir}

echo " ==> finished!"

