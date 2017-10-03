# Build with Conan

[![CircleCI](https://circleci.com/gh/Praqma/native-example-conan.png?style=shield&circle-token=df3dc5f6efbc2a267f7805f05a5e91d2878be9fd)](https://circleci.com/gh/Praqma/native-example-conan)
[![TravisCI Status](https://travis-ci.org/Praqma/native-example-conan.svg?branch=master)](https://travis-ci.org/Praqma/native-example-conan)

![](https://img.shields.io/github/stars/praqma/native-example-conan.svg)
![](https://img.shields.io/github/forks/praqma/native-example-conan.svg)
![](https://img.shields.io/github/watchers/praqma/native-example-conan.svg)
![](https://img.shields.io/github/tag/praqma/native-example-conan.svg)
![](https://img.shields.io/github/release/praqma/native-example-conan.svg)
![](https://img.shields.io/github/issues/praqma/native-example-conan.svg)

Building with [Conan](https://conan.io/).

See [native](https://github.com/Praqma/native) repository for more examples.

## Steps

* Build image: `./docker-build.sh`
* Run container: `./docker-run.sh`
* Build example (inside container): `./build.sh`
* Test example (inside container): `./test.sh`

## Lesson Learned

* `Test your project with Google Test` example project from Conan documentation did not work.

Following the [documentation](http://conanio.readthedocs.io/en/latest/howtos/use_gtest.html) on `Test your project with Google Test` did not work. [Issue](https://github.com/lasote/conan-gtest-example/issues/5) on the problem was reported.

* The `conan test_package` command deprecated.

Following the [documentation](https://conanio.readthedocs.io/en/latest/reference/commands/test_package.html), The `test_package` command was the preferred way to create packages. Now this has been superseded by the `conan create` command. `test_package` will keep backwards compatibility for a while, but the recommended usage from now would be to use for pure testing, with `conan test_package user/channel --test-only`.
