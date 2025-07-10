# Release Notes - v0.1.0

## Version 0.1.0 - Zig 0.14.1 Compatibility Update

This is the first release of our fork of [zig-bech32](https://github.com/The-King-of-Toasters/zig-bech32/).

### Main Features

- **Zig 0.14.1 Support**: Updated the library to be compatible with Zig 0.14.1
- **Build System Updates**: Modernized the build system configuration for the latest Zig toolchain
- **Full Test Suite**: All tests now pass when running `zig build test`

### Fork Information

This is a fork of https://github.com/The-King-of-Toasters/zig-bech32/ that maintains compatibility with modern Zig versions while preserving all original functionality.

### Inherited Features

From the original repository:
- Complete Bech32 and Bech32m encoding/decoding (BIP-173 and BIP-350)
- Generic encoder/decoder implementation
- Comprehensive error handling
- Extensive test coverage with official BIP test vectors
- Single-file library design with no external dependencies

### Known Issues

- The bech32m encoding issue noted in https://github.com/The-King-of-Toasters/zig-bech32/issues/2 also exists with this fork
