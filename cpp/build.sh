# just run below:
# sudo sh ./build.sh


# TF_INC=$(python3 -c 'import tensorflow as tf; print(tf.sysconfig.get_include())')
# TF_LIB=$(python3 -c 'import tensorflow as tf; print(tf.sysconfig.get_lib())')

TF_INC='/usr/local/lib/python3.5/dist-packages/tensorflow/include'
TF_LIB='/usr/local/lib/python3.5/dist-packages/tensorflow/core'


# g++ -std=c++11 -shared zero_out.cc -o zero_out.so -fPIC -I$TF_INC -I$TF_INC/external/nsync/public -L$TF_LIB -ltensorflow_framework -O2
g++ -std=c++11 -D_GLIBCXX_USE_CXX11_ABI=0 -shared zero_out.cc -o zero_out.so -fPIC -I$TF_INC -I$TF_INC/external/nsync/public -L$TF_LIB -O2
