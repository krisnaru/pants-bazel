load(
    "@rules_java//java:defs.bzl",
    java_binary_impl = "java_binary",
)

def java_binary(**kwargs):
    sources = kwargs.get('srcs')
    if kwargs.get('sources'):
      sources = kwargs.get('sources')
    dependencies = kwargs.get('deps')
    if kwargs.get('dependencies'):
      dependencies = process_deps(kwargs.get('dependencies'))
    kwargs.pop('sources')
    kwargs.pop('dependencies')

    java_binary_impl(
        srcs = sources,
        deps = dependencies,
        visibility = ["//visibility:public"],
        **kwargs
    )

def process_deps(dependencies):
  return ["//"+d for d in dependencies]
