## Lesson Learned

* Steps from `Test your project with Google Test` example project from Conan documentation did not work.

Following the [documentation](http://conanio.readthedocs.io/en/latest/howtos/use_gtest.html) on `Test your project with Google Test` did not work. [Issue](https://github.com/lasote/conan-gtest-example/issues/5) on the problem was reported.

* The `conan test_package` command to be used for pure testing from now.

Following the [documentation](https://conanio.readthedocs.io/en/latest/reference/commands/test_package.html), The `test_package` command was the preferred way to create packages. Now this has been superseded by the `conan create` command. `test_package` will keep backwards compatibility for a while, but the recommended usage from now would be to use for pure testing, with `conan test_package user/channel --test-only`.

* Useful Commands

  * Get Remote Package List:

    `conan remote list`

    ```
    conan-center: https://conan.bintray.com [Verify SSL: True]
    conan-transit: https://conan-transit.bintray.com [Verify SSL: True]
    ```

  * Change to more verbose logging level to 10 (default: 50):

    `conan config set log.level=10`

  * Get the logging level:

    `conan config get log.level`

  * To search packages in the local cache you can do:

    `conan search --raw`

  * To search packages in the remote server you can do:

    `conan search --remote=conan-center --raw`

    ```
    7z_installer/1.0@conan/stable
    Assimp/3.3.1@jacmoe/stable
    Assimp/3.3.1@jacmoe/testing
    IlmBase/2.2.0@Mikayex/stable
    OpenSSL/1.0.2@conan/stable
    OpenSSL/1.0.2l@conan/stable
    Poco/1.7.8p3@pocoproject/stable
    Poco/1.7.9@pocoproject/stable
    cmake_installer/1.0@conan/stable
    glm/0.9.8.5@g-truc/stable
    glm/0.9.8@g-truc/stable
    glm/master@g-truc/stable
    jsonformoderncpp/2.1.1@vthiery/stable
    mingw_installer/1.0@conan/stable
    nasm/2.13.01@conan/stable
    range-v3/0.2.6@ericniebler/stable
    range-v3/0.3.0@ericniebler/stable
    strawberryperl/5.26.0@conan/stable
    trompeloeil/v28@rollbear/stable
    zlib/1.2.11@conan/stable
    zlib/1.2.11@conan/testing
    zlib/1.2.8@conan/stable
    ```

  * Generate a table for all binaries from a given recipe with the --table option, even from remotes:

    `conan search zlib/1.2.11@conan/stable --table=file.html -r=conan-center`

  * You can generate a graph of your dependencies, in dot or html formats:

    `conan info .. --graph=dependencies.html`
