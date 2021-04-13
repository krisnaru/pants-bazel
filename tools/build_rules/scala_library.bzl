load(
    "@io_bazel_rules_scala//scala:scala.bzl",
    scala_library_impl = "scala_library",
)
def scala_library(**kwargs):
    sources = kwargs.get('srcs')
    if kwargs.get('sources'):
      sources = kwargs.get('sources')
    dependencies = kwargs.get('deps')
    if kwargs.get('dependencies'):
      dependencies = ["//"+ d for d in kwargs.get('dependencies')]
    kwargs.pop('sources')
    kwargs.pop('dependencies')

    scala_library_impl(
        srcs = sources,
        deps = dependencies,
        **kwargs
    )