# Autogenerated wrapper script for SCS_jll for i686-linux-musl
export libscsdir, libscsindir

using OpenBLAS32_jll
using CompilerSupportLibraries_jll
JLLWrappers.@generate_wrapper_header("SCS")
JLLWrappers.@declare_library_product(libscsdir, "libscsdir.so")
JLLWrappers.@declare_library_product(libscsindir, "libscsindir.so")
function __init__()
    JLLWrappers.@generate_init_header(OpenBLAS32_jll, CompilerSupportLibraries_jll)
    JLLWrappers.@init_library_product(
        libscsdir,
        "lib/libscsdir.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libscsindir,
        "lib/libscsindir.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
