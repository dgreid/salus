{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Rust toolchain
    rustup

    # RISC-V toolchain
    pkgsCross.riscv64-embedded.buildPackages.gcc  # Provides riscv64-unknown-elf-gcc
    pkgsCross.riscv64-embedded.buildPackages.binutils  # Provides riscv64-unknown-elf-objcopy
    pkgsCross.riscv64-embedded.buildPackages.gdb  # Provides riscv64-unknown-elf-gdb

    # QEMU with RISC-V support for testing
    qemu_full  # Full version for proper RISC-V support

    # Build tools
    gnumake
    pkg-config

    # Bazel build system
    bazel
    bazel-buildtools  # Includes buildifier for formatting Bazel files
    bazel-watcher     # For incremental builds (ibazel command)

    # Additional dependencies for Bazel
    jdk11  # Java is required for Bazel
    python3
    cmake
    ninja

    # Additional development tools
    git
    lldb
  ];

  shellHook = ''
    # Setup Rust toolchain
    rustup target add riscv64gc-unknown-none-elf

    # Set environment variables
    export OBJCOPY=riscv64-unknown-elf-objcopy
    export GDB=riscv64-unknown-elf-gdb
    
    # Bazel environment setup
    export BAZEL_PYTHON=$(which python3)

    echo "Salus RISC-V development environment ready!"
    echo "Use 'make -f Makefile.cargo' to build the project"
    echo "Or use 'bazel build //...' for Bazel builds"
  '';
}