#pragma once

#include "object.cuh"

namespace flow {

template <typename T> class Vector : public FlowObject<> {
public:
  typedef size_t size_type;

private:
  T *data_;
  size_t size_;
  size_t capacity_;

public:
  Vector() : data_(nullptr), size_(0), capacity_(0) {}
  void reserve(size_type n) {
    if (n > capacity_) {
    }
  }

  /*! resizes the container so it contains n elements

  Notice that this function changes the actual content of the container by
  inserting or erasing elements from it.
  */
  void resize(size_type n) {

    if (n < size_) {
      // If n is smaller than the current container size, the content is reduced
      // to its first n elements, removing those beyond (and destroying them).

    } else if (n > size_) {
      reserve(n);
      // If n is greater than the current container size, the content is
      // expanded by inserting at the end as many elements as needed to reach a
      // size of n. If val is specified, the new elements are initialized as
      // copies of val, otherwise, they are value-initialized.
    }

    // If n is also greater than the current container capacity, an automatic
    // reallocation of the allocated storage space takes place.
  }

  T *data() { return data_; }
  const T *data() const { return data(); }
};

} // namespace flow