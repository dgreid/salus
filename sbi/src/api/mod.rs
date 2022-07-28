// Copyright (c) 2022 by Rivos Inc.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

/// Host interfaces for reset extension.
pub mod reset;

/// Host interfaces for local rivos testing.
#[cfg(all(target_arch = "riscv64", target_os = "none"))]
pub mod rivos_test;

/// Host interfaces for hart state management.
pub mod state;

/// Host interfaces for confidential computing.
pub mod tsm;

/// Host interfaces for confidential computing interrupt virtualization.
pub mod tsm_aia;

/// Host interfaces for PMU.
pub mod pmu;

/// Base SBI inferfaces.
pub mod base;

/// Host interfaces for attestation.
pub mod attestation;
