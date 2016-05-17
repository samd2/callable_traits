/*

Copyright Barrett Adair 2015
Distributed under the Boost Software License, Version 1.0.
(See accompanying file LICENSE.md or copy at http://boost.org/LICENSE_1_0.txt)

*/

#include <type_traits>
#include <cstdint>
#include <memory>
#include <callable_traits/callable_traits.hpp>

#ifndef CT_ASSERT
#define CT_ASSERT(...) static_assert(__VA_ARGS__, #__VA_ARGS__)
#endif //CT_ASSERT

struct foo1 {
    int bar(char, float&, int = 0) { return{}; }
};

struct foo2 {
    int bar(char, float&, int = 0, ...) { return{}; }
};

struct foo3 {
    int operator()(char, float&, int = 0) { return{}; }
};

struct foo4 {
    int operator()(char, float&, int = 0, ...) { return{}; }
};

int foo5(char, float&, int = 0) { return{}; }

int foo6(char, float&, int = 0, ...) { return{}; }

namespace ct = callable_traits;
using std::is_same;

int main() {

    {
        float f = 3.0;
        foo1 foo{};

        CT_ASSERT(decltype(ct::is_invokable(&foo1::bar, foo1{}, 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(&foo1::bar, foo1{}, 'a', 3.0, 1)){});
        CT_ASSERT(decltype(ct::is_invokable(&foo1::bar, std::declval<foo1*>(), 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(&foo1::bar, std::declval<foo1*>(), 'a', 3.0, 1)){});
        CT_ASSERT(decltype(ct::is_invokable(&foo1::bar, std::declval<std::unique_ptr<foo1>>(), 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(&foo1::bar, std::declval<std::unique_ptr<foo1>>(), 'a', 3.0, 1)){});
        CT_ASSERT(decltype(ct::is_invokable(&foo1::bar, std::ref(foo), 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(&foo1::bar, std::ref(foo), 'a', 3.0, 1)){});

        //todo - more of these type-level tests
        CT_ASSERT(decltype(ct::is_invokable<decltype(&foo1::bar), foo1&, char, float&, int>()){});
        CT_ASSERT(!decltype(ct::is_invokable<decltype(&foo1::bar), foo1&, char, float&&, int>()){});
        CT_ASSERT(decltype(ct::is_invokable<decltype(&foo1::bar), foo1*, char, float&, int>()){});
        CT_ASSERT(!decltype(ct::is_invokable<decltype(&foo1::bar), const foo1*, char, float, int>()){});
    } {
        float f = 3.0;
        foo2 foo{};

        CT_ASSERT(decltype(ct::is_invokable(&foo2::bar, foo2{}, 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(&foo2::bar, foo2{}, 'a', 3.0, 1)){});
        CT_ASSERT(decltype(ct::is_invokable(&foo2::bar, std::declval<foo2*>(), 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(&foo2::bar, std::declval<foo2*>(), 'a', 3.0, 1)){});
        CT_ASSERT(decltype(ct::is_invokable(&foo2::bar, std::declval<std::unique_ptr<foo2>>(), 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(&foo2::bar, std::declval<std::unique_ptr<foo2>>(), 'a', 3.0, 1)){});
        CT_ASSERT(decltype(ct::is_invokable(&foo2::bar, std::ref(foo), 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(&foo2::bar, std::ref(foo), 'a', 3.0, 1)){});
    } {
        float f = 3.0;
        foo3 foo{};

        CT_ASSERT(decltype(ct::is_invokable(foo3{}, 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(foo3{}, 'a', 3.0, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(std::declval<foo3*>(), 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(std::declval<foo3*>(), 'a', 3.0, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(std::declval<std::unique_ptr<foo3>>(), 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(std::declval<std::unique_ptr<foo3>>(), 'a', 3.0, 1)){});
        CT_ASSERT(decltype(ct::is_invokable(std::ref(foo), 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(std::ref(foo), 'a', 3.0, 1)){});
    } {
        float f = 3.0;
        foo4 foo{};

        CT_ASSERT(decltype(ct::is_invokable(foo4{}, 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(foo4{}, 'a', 3.0, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(std::declval<foo4*>(), 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(std::declval<foo4*>(), 'a', 3.0, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(std::declval<std::unique_ptr<foo4>>(), 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(std::declval<std::unique_ptr<foo4>>(), 'a', 3.0, 1)){});
        CT_ASSERT(decltype(ct::is_invokable(std::ref(foo), 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(std::ref(foo), 'a', 3.0, 1)){});
    } {
        float f = 3.0;

        CT_ASSERT(decltype(ct::is_invokable(foo5, 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(foo5, 'a', 3.0, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(&foo5, 'a', 3.0, 1)){});
        CT_ASSERT(decltype(ct::is_invokable(std::ref(foo5), 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(std::ref(foo5), 'a', 3.0, 1)){});
    } {
        float f = 3.0;

        CT_ASSERT(decltype(ct::is_invokable(foo6, 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(foo6, 'a', 3.0, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(&foo6, 'a', 3.0, 1)){});
        CT_ASSERT(decltype(ct::is_invokable(std::ref(foo6), 'a', f, 1)){});
        CT_ASSERT(!decltype(ct::is_invokable(std::ref(foo6), 'a', 3.0, 1)){});
    }

    return 0;
}
