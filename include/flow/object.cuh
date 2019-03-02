#pragma once

#include <tuple>

#include "component.cuh"

namespace flow {

template <std::tuple<Component> PROD = {}, std::tuple<Component> CONS = {}>
class FlowObject {}

} // namespace flow