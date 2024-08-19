#=============================================================================
# Copyright (c) 2024, NVIDIA CORPORATION.
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
#=============================================================================
include(${rapids-cmake-dir}/cpm/init.cmake)
include(${rapids-cmake-dir}/cpm/nvtx3.cmake)

rapids_cpm_init()

rapids_cpm_nvtx3(BUILD_EXPORT_SET frank INSTALL_EXPORT_SET test)
rapids_cpm_nvtx3(INSTALL_EXPORT_SET test2)

get_target_property(packages rapids_export_install_test PACKAGE_NAMES)
if(NOT nvtx3 IN_LIST packages)
  message(FATAL_ERROR "rapids_cpm_nvtx3 failed to record nvtx3 needs to be exported")
endif()

get_target_property(packages rapids_export_install_test2 PACKAGE_NAMES)
if(NOT nvtx3 IN_LIST packages)
  message(FATAL_ERROR "rapids_cpm_nvtx3 failed to record nvtx3 needs to be exported")
endif()

get_target_property(packages rapids_export_build_frank PACKAGE_NAMES)
if(NOT nvtx3 IN_LIST packages)
  message(FATAL_ERROR "rapids_cpm_nvtx3 failed to record nvtx3 needs to be exported")
endif()