const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const module = b.createModule(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    const library = b.addLibrary(.{
        .linkage = .static,
        .name = "apollo_signal",
        .root_module = module,
        .version = .{
            .major = 1,
            .minor = 0,
            .patch = 4,
        },
    });
    b.installArtifact(library);

    const tests = b.addTest(.{ .root_module = module });
    const run_tests = b.addRunArtifact(tests);
    const test_step = b.step("test", "Run generated SDK tests");
    test_step.dependOn(&run_tests.step);
}

