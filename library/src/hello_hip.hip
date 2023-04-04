#include <hip/hip_runtime.h>
#include <hello_hip.hxx>

#include <rocprim/functional.hpp> # Bug fix: https://ontrack.amd.com/browse/EXSWSTRHPC-192
#include <rocprim/thread/thread_search.hpp>
#include <rocprim/iterator/counting_iterator.hpp>


template <typename T = int>
struct CoordinateT
{
    T x;
    T y;
};


__global__ void hello_hip() {
  printf("Hello World!\n");
  CoordinateT coord;
  int diagonal = 0;
  int a_len = 0;
  int b_len = 0;

  auto a = rocprim::counting_iterator<int>(0);
  auto b = rocprim::counting_iterator<int>(0);

  merge_path_search(diagonal, a, b, a_len, b_len, coord);
}

void launch_hello_hip() {
  hello_hip<<<1, 1>>>();
  hipDeviceSynchronize();
}
