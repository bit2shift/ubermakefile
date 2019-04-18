# über.mk
Übermakefile for those who are not very fond of CMake. For C++ code bases.

## 5 steps quick start
- Plop your code into a `src` folder
- Specify the build (compile and link) flags alongside with _normal_ dependencies in `über.json`
- Define the build targets with their even-so-more-specific flags and objects in `über.json`
- Either copy/symlink `über.mk/makefile` into your project or have a _shim_ `makefile` that either redirects all unmatched targets into `über.mk/makefile` or includes it
- `make`/`make all` or `make devall`, for building in release or debug mode, respectively

### Optional step
- Add any source-built dependencies as `git` submodules and declare them with build instructions in `über.json`

---
## Layout of `über.json`
- [`flags`](#flags)
  - [`common`](#common)
  - [`debug`](#debug)
  - [`release`](#release)
- [`targets`](#targets) _(mandatory)_
  - [_`<target-name>`_](#target-name) _(mandatory)_
    - [`flags`](#flags-1)
    - [`objects`](#objects) _(mandatory)_
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
### `targets`
Build artifacts are declared in this section. There can be many, including test rigs.  
Each key in this dictionary is the path of a single build artifact, as if located inside the `src` folder.

#### _`<target-name>`_
A single build artifact. Its name is used by `make` as target for a recipe.

##### `flags`
Flags that are specific to the underlying type of artifact being built. These should not affect debugging or optimisation characteristics.

##### `objects`
A string or an array of strings, each containing a pattern that can be passed to [`$(filter pattern…,text)`](https://www.gnu.org/software/make/manual/html_node/Text-Functions.html#Text-Functions) in `make`.  
Used for selecting the objects required for building the current artifact.  
TL;DR: It's a list of wildcard paths, with the wildcard character being `%`.

---
### `dependencies`

#### _`<package>`_

##### `static`

##### `build`
