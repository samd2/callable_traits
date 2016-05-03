/*!
@file

@copyright Barrett Adair 2015
Distributed under the Boost Software License, Version 1.0.
(See accompanying file LICENSE.md or copy at http://boost.org/LICENSE_1_0.txt)

*/

#ifndef CALLABLE_TRAITS_SET_MEMBER_QUALIFIERS_HPP
#define CALLABLE_TRAITS_SET_MEMBER_QUALIFIERS_HPP

#include <callable_traits/detail/required_definitions.hpp>

namespace callable_traits {

    template<typename T, flags Flags>
    using set_member_qualifiers =
        typename detail::traits<T>::template set_qualifiers<Flags>;
}

#endif //#ifndef CALLABLE_TRAITS_SET_MEMBER_QUALIFIERS_HPP
