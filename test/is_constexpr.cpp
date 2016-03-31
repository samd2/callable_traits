/*
Copyright Barrett Adair 2016
Distributed under the Boost Software License, Version 1.0.
(See accompanying file LICENSE.md or copy at http ://boost.org/LICENSE_1_0.txt)
*/

#include <type_traits>
#include <callable_traits/callable_traits.hpp>

namespace ct = callable_traits;

//this is a constexpr function object
struct subtract {
    template<typename T1, typename T2>
    constexpr auto operator()(T1, T2) {
        return T1{} - T2{};
    }
};

static_assert(ct::is_constexpr<subtract>(), "");
static_assert(ct::is_constexpr(subtract{}), "");

//this is NOT a constexpr function object
struct add {
    template<typename T1, typename T2>
    auto operator()(T1, T2) {
        return T1{} +T2{};
    }
};

static_assert(!ct::is_constexpr<add>(), "");
static_assert(!ct::is_constexpr(add{}), "");

// The case below fails to compile, because lambdas are not trivially
// default constructible. (Note: This restriction also applies to the
// argument types). Error message: "Cannot perform constexpr checks
// with this type, because it is not trivially default constructible."

/*
auto mult = [](auto t1, auto t2) -> decltype(t1.value * t2.value) {
    return t1.value * t2.value;
};

static_assert(!ct::is_constexpr<decltype(mult)>(), "");
static_assert(!ct::is_constexpr(mult), "");
*/

int main() {}