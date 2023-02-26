ARG CONTAINER_VERSION=latest
FROM felice/realsense2:$CONTAINER_VERSION

USER root

ENV REPO_PATH=/home/$USERNAME/catkin_ws/src/epos/repository
ENV STORE_PATH=/home/$USERNAME/catkin_ws/src/epos/store
ENV BOP_PATH=/home/$USERNAME/catkin_ws/src/epos/datasets

ENV TF_DATA_PATH=$STORE_PATH/tf_data
ENV TF_MODELS_PATH=$STORE_PATH/tf_models

ENV PYTHONPATH=$REPO_PATH:$PYTHONPATH
ENV PYTHONPATH=$REPO_PATH/external/bop_renderer/build:$PYTHONPATH
ENV PYTHONPATH=$REPO_PATH/external/bop_toolkit:$PYTHONPATH
ENV PYTHONPATH=$REPO_PATH/external/progressive-x/build:$PYTHONPATH
ENV PYTHONPATH=$REPO_PATH/external/slim:$PYTHONPATH

ENV LD_LIBRARY_PATH=$REPO_PATH/external/llvm/lib:$LD_LIBRARY_PATH

ENV OSMESA_PREFIX=$REPO_PATH/external/osmesa
ENV LLVM_PREFIX=$REPO_PATH/external/llvm

RUN ECHO ${ENV}

# Install epos requirements
RUN apt-get update && sudo apt-get -y upgrade && apt-get -y dist-upgrade
RUN apt-get install python3.6.10
RUN apt-get install -y python3-pip
RUN pip3 install numpy==1.16.6
RUN apt-get install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran &&\ apt-get install python3-pip &&\ pip3 install -U pip testresources setuptools==49.6.0 &&\ pip3 install -U --no-deps numpy==1.19.4 future==0.18.2 mock==3.0.5 keras_preprocessing==1.1.2 keras_applications==1.0.8 gast==0.4.0 protobuf pybind11 cython pkgconfig packaging &&\ env H5PY_SETUP_REQUIRES=0 pip3 install -U h5py==3.1.0 &&\ pip3 install --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v327 tensorflow-gpu==1.12.0
RUN pip3 install PyYAML==5.3.1
RUN pip3 install opencv-python==3.4.2
RUN pip3 install pandas==1.0.5
RUN pip3 install tabulate==0.8.3
RUN pip3 install imageio==2.9.0
RUN pip3 install pypng==0.0.18
RUN git clone git@github.com:libigl/libigl-python-bindings.git &&\ cd libigl-python-bindings &&\ python setup.py install
RUN pip3 install glog==0.4.0

# Clone epos
RUN git clone --recurse-submodules https://github.com/AlexandraPapadaki/epos.git $REPO_PATH/
RUN git clone --recurse-submodules https://github.com/AlexandraPapadaki/datasets.git $BOP_PATH/
RUN git clone --recurse-submodules https://github.com/AlexandraPapadaki/store.git $STORE_PATH/

# Install Renderer and ProgressiveX
RUN mkdir $OSMESA_PREFIX &&\ mkdir $LLVM_PREFIX
RUN cd $REPO_PATH/external/bop_renderer/osmesa-install
RUN mkdir build &&\ cd build
RUN bash ../osmesa-install.sh
RUN cd $REPO_PATH/external/bop_renderer
RUN mkdir build &&\ cd build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release
RUN make -j8
RUN cd $REPO_PATH/external/progressive-x/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release
RUN make -j8
