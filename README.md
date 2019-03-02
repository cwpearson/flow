# flow

Each flow object is associated with producer and consumer components, which describe who creates and who consumes the data.

Each flow object is also associated with a CUDA stream to have operations independent of other CUDA and flow objects.



## Access Kinds

Two axes
* `exclusive`/`shared`: Whether each data element is accessed by more than one component
* `once`/`many`: Number of times each data element is accessed

| | Exclusive | Shared |
|-|-|-|
| **Once** | element accessed once by one component | element accessed once by many components  |
| **Many** | element accesed many times by one component | element accessed many times by many components |

## Component Types

| Type | Description |
|-|-|
| mCPU | multiple CPU cores |
| CPU | a single CPU core |
| GPU | a single GPU |

## Strategy

| Producer | Consumer | Strategy | 
|-|-|-|
| mCPU / Once / Exclusive | GPU / Once |  |
| CPU / Once | multi-GPU / Many | UnifiedMemory |
| GPU_i / Once | GPU_i / Once | cuda-explicit |
| GPU_i / Once | GPU_j / Once | ZeroCopy |
| GPU / Once | CPU / Once |  |
| | | |

Strategy | Allocation | to_..._async() |  sync() |
|-|-|-|-|-|
| UnifiedMemory | cudaMallocManaged | no-op | cudaDeviceSyncrhonize() (sometimes) |
| cuda-explicit | cudaMalloc | cudaMemcpyAsync | cudaDeviceSyncrhonize() |
| ZeroCopy | cudaMalloc | no-op | no-op |-|
|-|-|-|-|-|

## Container API

`to_producer_async(i)`
Make container data accessible to producer.
May return before operation is finished.

`to_consumer_async(i)`
Make container data accessible to consumer.
May return before operation is finished.

`sync()`
Ensure any asynchronous transfers have completed.

`view()`
Get a constant view of the container

## Containers

- [ ] Vector
- [ ] Tree