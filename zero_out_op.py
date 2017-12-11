import tensorflow as tf

_zero_out_module = tf.load_op_library("./cpp/zero_out.so")
zero_out = _zero_out_module.zero_out
