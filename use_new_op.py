import tensorflow as tf
from zero_out_op import zero_out

with tf.Session():
    result = zero_out([[2, 3, 3, 4], [32, 3, 25, 2]]).eval()
    print(result)
