#pragma once

#include <tuple>

#include "component.cuh"

namespace flow {

template <size_t MAX_COMPONENTS = 6> class FlowObject {
  Component producers_[MAX_COMPONENTS];
  Component consumers_[MAX_COMPONENTS];
  size_t nProducers_;
  size_t nConsumers_;
  cudaStream_t stream_;

public:
  FlowObject() : nProducers_(0), nConsumers_(0) { cudaStreamCreate(&stream_); }
  ~FlowObject() {
    cudaStreamDestroy(stream_);
    stream_ = nullptr;
  }
  /*! return the cuda stream associated with this object
   */
  cudaStream_t stream() const { return stream_; }
};

} // namespace flow