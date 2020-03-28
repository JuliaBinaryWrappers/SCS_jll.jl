# Autogenerated wrapper script for SCS_jll for x86_64-w64-mingw32
export libscsdir, libscsindir

using OpenBLAS_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"

# Relative path to `libscsdir`
const libscsdir_splitpath = ["bin", "libscsdir.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libscsdir_path = ""

# libscsdir-specific global declaration
# This will be filled out by __init__()
libscsdir_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libscsdir = "libscsdir.dll"


# Relative path to `libscsindir`
const libscsindir_splitpath = ["bin", "libscsindir.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libscsindir_path = ""

# libscsindir-specific global declaration
# This will be filled out by __init__()
libscsindir_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libscsindir = "libscsindir.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"SCS")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (OpenBLAS_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (OpenBLAS_jll.LIBPATH_list,))

    global libscsdir_path = normpath(joinpath(artifact_dir, libscsdir_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libscsdir_handle = dlopen(libscsdir_path)
    push!(LIBPATH_list, dirname(libscsdir_path))

    global libscsindir_path = normpath(joinpath(artifact_dir, libscsindir_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libscsindir_handle = dlopen(libscsindir_path)
    push!(LIBPATH_list, dirname(libscsindir_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(LIBPATH_list, ';')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

