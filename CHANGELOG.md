# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] 2020.Q4

Initial Version

### Added

-   C++ builder and runtime images for x86_64, armv7hf and aarch64
-   concourse environment for ci/cd builds
-   dobi environment for local builds
-   automated versioning with elbb/bb-gitversion 0.6.2
-   added `default.env`, `local.env.template` and doku how to use it -> enables setting default and local environment variables for `dobi` targets
-   `dobi.sh` downloads `dobi` if `dobi` is not `$PATH`
-   `dobi.sh`: parameter checking and handling for `dobi` target `list` and `dobi.sh` target `version`
-   added email notification on error/success in concourse pipeline
