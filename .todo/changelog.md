# Generator

##### [Generator](https://en.wikipedia.org/wiki/Generator_(computer_programming) "Wiki page") - is an object, which stores a generated/provided massive of numbers and massive's length.

Mandatory traits/interface:
- Default constructable
- Copy    constructable
- `set` single setter
- `get_data` and `get_count` getters
- `generate` method to generate own sequence of requested length. Implementation follows `gTests` requirements

Additional traits/interface:
- Move constructable
- Сopy assignable
- Move assignable
- bool convertionable
- `swap`able

-----

# Solution

My solution pursuits several key moments: 1. "Try not to touch 'existing'" _and_ 2. "Do as much as possible from my side".

##### Made:
Add all vital functionality to pass provided `google tests`. And quite more. That's all.

### Features:

1. Spammed with: `const`, `explicit`, `noexcept` specifiers wherever possible.
2. `constexpr std::array<int, 424> getSequence()` function which returns precalculated first part of sequence needed for `generate` method.
3. Plenty of `#if/else` code segments with latest `STL` instruments. It is So, because the 'task' was solved with C++17 and after downgraded to C++11. So not to discard reached solutions, they were encaved inside preprocessor statements and commented with required versions of 'C++ Standard'.
4. Template `set` method to catch all possible 'bad' types `T` of passed argument `T count` (`count` is integral decimal). It allows to move 'error handling' from `runtime` to `compiletime`. Unfortunately it is still `runtime` due to error handling through `exceptions`(mandatory by `gTest.cpp`).
5. `TEST(Generator, own_ultimate)`: passed - thanks to computer vision :)

>6. _Broken by `clang-format`:_ In certain cases, where are 'Two Insignificant' actions are written in a single line and separated by `/*and*/` 'comment'.
>Example:
```c++ 
if (count != 0) { delete[] data; /*and*/ data = nullptr; }//clean previous state
```
>>P.S. It allows to save from 3 to 4 lines and Increase 'readability' at the same time!

###### All required behaviour to `class Generator` can be tracked through [`intro/tests/generator_gTest.cpp`](https://gitlab.com/procamp/20q3/trainees/daniil.semenenko/-/blob/master/test/generator_gTest.cpp "file with google tests").

-----
-----

# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

-----

## [Unreleased]
### Fixed
- Rid off `#ifndef GENERATOR_H`,`#define GENERATOR_H`,`#endif // GENERATOR_H` and place `#pragma once` instead
- Typo: odd line in `project/generator.h/L:82` "public:"

### Changed
1. Refactor `#if/else` code sections:
- Add `#define CPP 11 //<14/17> //C++ version` macro
- Replace `#if/else` `0/1` with `CPP==11`/`CPP>=14`/`CPP>=17`

2. Move `if (count != 0) { delete[] data; /*and*/ data = nullptr; }` from `copy` method to top in the body of a `copy-assignment operator`
3. Add `const` to second parameter in `set(const int *const data, \const/ T count)` template setter

-----

## Patches:
### [1.2.1] - 2020-11-2 - add `AddressSanitizer` into `Makefile` build:+=`-fsanitize=address,undefined`
## [1.2.0] - 2020-11-1 - add `clang-tidy` into `Makefile` build
### Changed
- Remove `explicit` from `constructors`
- Change `Generator() noexcept : /...\ {}` to `Generator() noexcept = default;`
- Change naming of all `functions` to `camelBack`
- Change naming of all `private members` from `member` to `_member`
- Remove 'top level `const`' qualifier from functions declarations
- Remove `if (ptr) delete[] ptr;` code cases - as it is meaningless
### Add `// NOLINTNEXTLINE`[18] for `clang-tidy` werror supression:
- // Not to harm more - readability of templates with SFINAE: // NOLINTNEXTLINE(google-global-names-in-headers)
- // Not mine / Cannot change this. // NOLINTNEXTLINE(readability-identifier-naming)
- // No way to use 'gsl::' library  // NOLINTNEXTLINE(cppcoreguidelines-owning-memory)
- // And how to deal without ptr-arithmetic !? // NOLINTNEXTLINE(cppcoreguidelines-pro-bounds-pointer-arithmetic)


### [1.1.1] - 2020-10-31 - add `cppcheck` into `Makefile` build && pipeline installation
## [1.1.0] - 2020-10-31 - changing compiler from `g++` to `clang++`
### Changed
0. Makefile - `CXXFLAGS` (compiler flags):
- Add `-pedantic` `-Werror`
- Remove `-pthread`
1. Deal with structure alignment in proper way:
- Erase `char padding[4];` from `class Generator`
- Change `#pragma pack(push, 1)` to `#pragma pack(push, 8)`

### Added
- Useless code for "Supression of: `error: unused parameter...` errors" in 'trap-setter' method

-----

### [1.0.3] - 2020-10-30 - add `.gitlab-ci.yml` for GitLab CI/CD
### [1.0.2] - 2020-10-29 - add `CHANGELOG.md`
### [1.0.1] - 2020-10-28 - add `.clang-format` and code polishing
>###### P.S. It seems that `clang-format` 'spoil' more than 'improve' `¯\_(ツ)_/¯`.

## [1.0.0] - 2020-09-07 - release
### Added 
#### Mandatory functionality:
- Default `constructor`'s definition
- Copy `constructor`
- D-tor
- `set` setter
- template 'trap-setter' method (to hook arguments of bad type)
- `get_data` and `get_count` getters
- `generate` method's definition
- `copy` method

#### Optional functionality:
- Move `constructor`
- Сopy assignment `operator`
- Move assignment `operator`
- bool conversion `operator`
- `swap` friend function
