# singularity exec gleamx_container_15Sep26.img bash -c '
# echo "=== Hyperdrive ==="; hyperdrive --version
# echo "=== WSClean ==="; wsclean --version
# echo "=== AOFlagger ==="; aoflagger --version
# echo "=== MIRIAD ==="; which invert
# echo "=== Python ==="; python --version
# '

singularity exec gleamx_container_25Sep26.img python3 - <<'PY'
modules = [
    "casacore.tables",
    "pyrap.tables",
    "numpy",
    "scipy",
    "astropy",
    "pandas",
    "h5py",
    "matplotlib",
    "reproject",
]

for m in modules:
    try:
        mod = __import__(m)
        print(f"OK    {m}")
    except Exception as e:
        print(f"FAIL  {m}: {type(e).__name__}: {e}")
PY


