#pragma once

#include "object.cuh"

namespace flow {

template <typename T, std : tuple<Component> PROD = {},
          std::tuple<Component> CONS = {}>
class Vector : public FlowObject<PROD, CONS> {};

} // namespace flow