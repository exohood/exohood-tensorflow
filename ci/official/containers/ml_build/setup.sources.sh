#!/usr/bin/env bash
#
# Copyright 2024 The TensorFlow Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================
#
# Sets up custom apt sources for our TF images.

# Prevent apt install tzinfo from asking our location (assumes UTC)
export DEBIAN_FRONTEND=noninteractive

# Set up shared custom sources
apt-get update
apt-get install -y gnupg ca-certificates

# LLVM/Clang: https://apt.llvm.org/
apt-key adv --fetch-keys https://apt.llvm.org/llvm-snapshot.gpg.key

# Set up custom sources
cat >/etc/apt/sources.list.d/custom.list <<SOURCES
# LLVM/Clang repository
deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-18 main
deb-src http://apt.llvm.org/jammy/ llvm-toolchain-jammy-18 main
SOURCES
