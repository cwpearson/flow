#pragma once

namespace flow {

class Component {
  enum class Type { CPU, GPU };
  Type type_;
  size_t id_;
};

} // namespace flow