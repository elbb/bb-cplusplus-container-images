# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.5] 2022.Q2

- updated conan profiles to use latest 9.x gcc

## [0.1.4] 2021.Q2

- change base image from debian to ubuntu to be able to use new kernel features
  in projects depending on this images
- fix race to get git version in pipeline

## [0.1.3] 2021.Q1

- use cmake conan package with version >=3.15.0 for ninja native build
- add gcc 9.3 to builder image to have better c++17 support
- removed deprecated "arch_build" and "os_build" from conan profiles
- add ssh e.g. for conan builds which use git via ssh to get sources

## [0.1.2] 2021.Q1

- add docker user/password for all docker images used for concourse ci
- add build dependencies for conan packages which use autoconf,automake,git,libtoolize,makedepend

## [0.1.1] 2020.Q4

- Fix compiling with conan for aarch64 and armv7

## [0.1.0] 2020.Q4

Initial Version

### Added

-   C++ builder and runtime images for x86_64, armv7hf and aarch64
-   concourse environment for ci/cd builds
-   dobi environment for local builds
-   automated versioning with elbb/bb-gitversion 0.7.0
-   added `default.env`, `local.env.template` and doku how to use it -> enables setting default and local environment variables for `dobi` targets
-   `dobi.sh` downloads `dobi` if `dobi` is not `$PATH`
-   `dobi.sh`: parameter checking and handling for `dobi` target `list` and `dobi.sh` target `version`
-   added email notification on error/success in concourse pipeline
