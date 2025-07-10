# Zig Bech32

A Zig implementation of Bech32 and Bech32m encoding/decoding as specified in [BIP-173](https://github.com/bitcoin/bips/blob/master/bip-0173.mediawiki) and [BIP-350](https://github.com/bitcoin/bips/blob/master/bip-0350.mediawiki).

## Features

- Complete Bech32 and Bech32m support
- Generic encoder/decoder implementation
- Comprehensive error handling
- Single-file library with no external dependencies
- Extensive test coverage with official BIP test vectors

## Installation

Requires Zig 0.14.0+.

```bash
zig fetch --save git+https://github.com/eligrubb/zig-bech32.git
```

## Usage

```zig
const bech32 = @import("bech32");

// Encoding
const hrp = "ziglang";
const data = [_]u8{ 0xde, 0xad, 0xbe, 0xef };
const enc = bech32.Encoding.bech32m;
var buf: [bech32.max_string_size]u8 = undefined;
const str = bech32.standard.Encoder.encode(&buf, hrp, data, enc);

// Decoding
var data_buf: [bech32.max_data_size]u8 = undefined;
const res = try bech32.standard.Decoder.decode(&data_buf, str);
```

## Testing

```bash
zig build test
```

## Format

A Bech32 string consists of:
1. **Human readable part (HRP)**: 1-83 characters
2. **Separator**: "1"
3. **Data**: 5-bit values encoded using Bech32 charset
4. **Checksum**: 30-bit value expanded to six 5-bit values

Maximum string length is 90 characters.

## Notes

- This implementation is not constant-time
- Outputs lowercase strings by default
- Uppercase transformation available via compile-time flag
- Fork of [zig-bech32](https://github.com/The-King-of-Toasters/zig-bech32) with Zig 0.14.1+ compatibility
- Known issue with [bech32m encoding](https://github.com/The-King-of-Toasters/zig-bech32/issues/2)
