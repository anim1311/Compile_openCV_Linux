## some updating and upgrading 
sudo apt update
sudo apt upgrade
## installing some basic applications
sudo apt install gcc
sudo apt install g++
sudo apt install git

## Install the build tools and dependencies
sudo apt install build-essential cmake git pkg-config libgtk-3-dev 
sudo apt install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev 
sudo apt install libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev 
sudo apt install gfortran openexr libatlas-base-dev python3-dev python3-numpy 
sudo apt install libtbb2 libtbb-dev libdc1394-22-dev libopenexr-dev 
sudo apt install libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev

##Clone the OpenCV’s and OpenCV contrib repositories

mkdir ~/opencv_build && cd ~/opencv_build
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
git checkout 4.2.0

cd ~/opencv_build/opencv
mkdir -p build && cd build

## build the project
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_build/opencv_contrib/modules \
    -D BUILD_EXAMPLES=ON ..

## compile 
CORES=$(nproc)
make -j$CORES ## Modify the -j flag according to your processor. If you do not know the number of cores in your processor, you can find it by typing nproc

## install opencv
sudo make install