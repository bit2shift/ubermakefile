# über.mk
Übermakefile for those who are not very fond of CMake.

## 5 steps quick start
- Plop your code into a `src` folder
- Specify the build (compile and link) flags alongside with standard dependencies in `über.json`
- Define the build targets with their even-so-more-specific flags and objects in `über.json`
- Either rename `über.mk` to `makefile` or have one that redirects all unmatched targets into `über.mk`
- `make`

### Optional step
- Add any source-built dependencies as `git` submodules and declare them with build instructions in `über.json`

---
## Layout of `über.json`
- [`flags`](#flags)
  - [`common`](#common)
  - [`debug`](#debug)
  - [`release`](#release)
- [`dependencies`](#dependencies)
  - [_`<package>`_](#package)
    - [`static`](#static)
    - [`build`](#build)

---
### `flags`
Contains the build flags, i.e. `CXXFLAGS`, `CPPFLAGS`, `LDFLAGS`, `LDLIBS`, etc.  
They are passed directly into `make` and, as such, are subject to expansion. That means you can use `-I$(CURDIR)/...` for adding include paths in the current directory.  
It also means you can do all sorts of `make` shenanigans that are valid inside variable assignments.

#### `common`
For general build flags that do not affect debugging or optimisation levels. (e.g. `-std=c++17`, `-pedantic`, `-Wall`, `-I...`, etc.)

#### `debug`
Flags typically used when debugging, i.e. `-O0`, `-Og`, `-g`, `-g<1-3>`, etc.

#### `release`
Normally the opposite of debugging, these flags are meant for increased optimisation, i.e. `-O`, `-O<1-3>`, `-Os`, `-g0`, etc.

---
### `dependencies`

#### _`<package>`_

##### `static`

##### `build`
