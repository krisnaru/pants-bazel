load(
    "@io_bazel_rules_scala//scala:scala.bzl",
    scala_binary_impl = "scala_binary",
)

def scala_binary(**kwargs):
    sources = kwargs.get('srcs')
    if kwargs.get('sources'):
      sources = kwargs.get('sources')
    dependencies = kwargs.get('deps')
    if kwargs.get('dependencies'):
      dependencies = process_deps(kwargs.get('dependencies'))
    kwargs.pop('sources')
    kwargs.pop('dependencies')

    scala_binary_impl(
        srcs = sources,
        deps = dependencies,
        visibility = ["//visibility:public"],
        **kwargs
    )

def process_deps(dependencies):
  return ["//"+d for d in dependencies]
