const std = @import("std");

const version = std.SemanticVersion{ .major = 0, .minor = 1, .patch = 0 };

pub fn build(b: *std.Build) !void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addLibrary(.{
        .name = "bech32",
        .version = version,
        .root_module = b.createModule(.{
            .root_source_file = b.path("bech32.zig"),
            .target = target,
            .optimize = optimize,
        }),
        .linkage = .static,
    });
    b.installArtifact(lib);

    const main_tests = b.addTest(.{
        .version = version,
        .root_module = b.createModule(.{
            .root_source_file = b.path("bech32.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });

    const main_tests_run = b.addRunArtifact(main_tests);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests_run.step);
}
