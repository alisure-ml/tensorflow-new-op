## Adding a New Op in TensorFlow
`https://github.com/tensorflow/tensorflow/tree/master/tensorflow/examples/adding_an_op`
`https://www.tensorflow.org/extend/adding_an_op`

1. Register the new op in a C++ file.
2. Implement the op in C++.
3. Create a Python wrapper(optional).
4. Write a function to compute gradients for the op(optional).
5. Test the op.


### Register the new op in a C++ file
> 详见 `cpp/zero_out.cc`

* In the registration, you specify the name of your op, 
its inputs (types and names) and outputs (types and 
names), as well as docstrings and any attrs the op might require.

* A note on naming: The op name must be in CamelCase and it must 
be unique among all other ops that are registered in the binary.


### Implement the op in C++
> 详见 `cpp/zero_out.cc`
 
* After you define the interface, provide one or more implementations 
of the op. To create one of these kernels, create a class that extends 
OpKernel and overrides the Compute method. The Compute method provides 
one context argument of type OpKernelContext*, from which you can access 
useful things like the input and output tensors.


### Build the op library
> 详见 `cpp/build.sh`

    ```
    $ python3
    >>> import tensorflow as tf
    >>> tf.sysconfig.get_include()
    '/usr/local/lib/python3.5/dist-packages/tensorflow/include'
    >>> tf.sysconfig.get_lib()
    '/usr/local/lib/python3.5/dist-packages/tensorflow/core'
    ```
 
* The binary PIP package installs the header files and the library 
that you need to compile your op in locations that are system specific.   

* TensorFlow python library provides the get_include function to get the 
header directory, and the get_lib directory has a shared object to link against.


### Use the op in Python
> 详见 `zero_out_op.py`

```
_zero_out_module = tf.load_op_library("./cpp/zero_out.so")
zero_out = _zero_out_module.zero_out
```

* TensorFlow Python API provides the tf.load_op_library function to load the 
dynamic library and register the op with the TensorFlow framework. 
load_op_library returns a Python module that contains the Python wrappers for the op and the kernel. 


### Test the op
> 详见 `use_new_op.py`

```
import tensorflow as tf
from zero_out_op import zero_out

with tf.Session():
    result = zero_out([[2, 3, 3, 4], [32, 3, 25, 2]]).eval()
    print(result)
```

* A good way to verify that you've successfully implemented your op 
is to write a test for it. 



