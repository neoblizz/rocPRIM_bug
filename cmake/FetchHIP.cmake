# Find HIP module, this allows us to link to hip::device (gpu)
# and hip::host (non-gpu) as needed.
find_package(hip REQUIRED CONFIG PATHS ${HIP_PATH} ${ROCM_PATH})
find_package(rocprim REQUIRED CONFIG PATHS ${HIP_PATH} ${ROCM_PATH})