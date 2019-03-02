#pragma once

#include "read.hpp"
#include "write.hpp"

namespace flow {

class Component {
public:
  enum class Type { CPU, GPU };

private:
  Type type_;
  size_t id_;
  ReadKind readKind_;
  WriteKind writeKind_;

public:
  Component() : readKind_(ReadKind::Unknown), writeKind_(WriteKind::Unknown) {}

  static Component CPU(size_t id, ReadKind rd = ReadKind::Unknown,
                       WriteKind wr = WriteKind::Unknown) {
    Component c;
    c.readKind_ = rd;
    c.writeKind_ = wr;
    c.id_ = id;
    c.type_ = Type::CPU;
    return c;
  }
};

} // namespace flow