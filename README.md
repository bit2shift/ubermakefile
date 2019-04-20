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
  - [_`<target-path>`_](#target-path) _(mandatory)_
    - [`static`](#static)
    - [`flags`](#flags-1)
    - [`objects`](#objects) _(mandatory)_
- [`dependencies`](#dependencies)
  - [_`<package-name>`_](#package-name)
    - [`static`](#static-1)
    - [`build`](#build)

---
### `flags`
Contains the build flags, i.e. `CXXFLAGS`, `CPPFLAGS`, `LDFLAGS`, `LDLIBS`, etc.  
They are passed directly into `make` and, as such, are subject to expansion. That means you can use `-I$(CURDIR)/...` for adding include paths in the current directory.  
It also means you can do all sorts of `make` shenanigans that are valid inside variable assignments.

#### `common`
For general build flags that do not affect debugging or optimisation levels.  
Examples: `-std=c++17`, `-pedantic`, `-Wall`, `-I...`

#### `debug`
Flags typically used when debugging, i.e. `-O0`, `-Og`, `-g`, `-g<1-3>`, etc.

#### `release`
Normally the opposite of debugging, these flags are meant for increased optimisation, i.e. `-O`, `-O<1-3>`, `-Os`, `-g0`, etc.

---
### `targets`
Build artifacts are declared in this section. There can be many, including test rigs.  
Each key in this dictionary is the path of a single build artifact, as if located inside the `src` folder.

#### _`<target-path>`_
A single build artifact. Its name is used by `make` as target for a recipe.

##### `static`
A boolean value. Specifies if the current artifact is a static library.  
Defaults to `false` if absent.

##### `flags`
Flags that are specific to the underlying type of artifact being built.  
These should not affect debugging or optimisation characteristics.

##### `objects`
A string or an array of strings, each containing a pattern that can be passed to [`$(filter pattern…,text)`](https://www.gnu.org/software/make/manual/html_node/Text-Functions.html#Text-Functions) in `make`.  
Used for selecting the objects required for building the current artifact.  
TL;DR: It's a list of wildcard paths, with the wildcard character being `%`.

---
### `dependencies`
Build dependencies—normal and _source-built_—are declared here.  
Each key in this dictionary is a package that can be queried with `pkg-config`.

#### _`<package-name>`_
A single dependency. Used in invocations of

    pkg-config <package-name> [--static] <--cflags ¦ --libs-only-L --libs-only-other ¦ --libs-only-l>

##### `static`
A boolean value. Toggles the `--static` option of `pkg-config`.  
Basically, it toggles between static and dynamic linking against the `<package-name>`.

##### `build`
Only used for _source-built_ dependencies.  
A string or an array of strings containing commands to build the package in question.
