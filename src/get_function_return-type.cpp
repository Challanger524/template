#include <utility>

// triggers compile error/warning which shows type
template<class t>
class error_type_compile;

unsigned int func(bool param);

// declare
error_type_compile<decltype(func(std::declval<bool>()))>; // warning C4091: '' ignored on left of 'error_type_compile<unsigned int>' when no variable is declared
