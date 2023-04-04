#include <hip/hip_runtime.h>
#include <hello_hip.hxx>

#include <rocprim/functional.hpp> // Bug fix: https://ontrack.amd.com/browse/EXSWSTRHPC-192
#include <rocprim/thread/thread_operators.hpp>
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
  std::size_t diagonal = 0;
  std::size_t a_len = 0;
  std::size_t b_len = 0;

  auto a = rocprim::counting_iterator<long>(0);
  auto b = rocprim::counting_iterator<long>(0);

  rocprim::merge_path_search(diagonal, a, b, a_len, b_len, coord);
}

void launch_hello_hip() {
  hello_hip<<<1, 1>>>();
  hipDeviceSynchronize();
}
