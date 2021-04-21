load(
    "@rules_java//java:defs.bzl",
    java_library_impl = "java_library",
    "java_import",
)

def java_library(**kwargs):
    sources = kwargs.get('srcs')
    if kwargs.get('sources'):
      sources = kwargs.get('sources')
    dependencies = kwargs.get('deps')
    if kwargs.get('dependencies'):
      dependencies = process_deps(kwargs.get('dependencies'))
    kwargs.pop('sources')
    kwargs.pop('dependencies')

    
    java_library_impl(
        srcs = sources,
        deps = dependencies,
        runtime_deps = [],
        visibility = ["//visibility:public"],
        **kwargs
    )

def process_deps(dependencies):
  return [d if d.startswith("@maven") else "//"+d for d in dependencies]

def jar_library(name, jars):
  deps = []
  for jar in jars:
    deps.append("//jvm:" + jar.replace(".","_").replace(":","_").replace("-","_"))
  java_import(name=name, exports=deps, jars=[], runtime_deps=[], visibility=["//visibility:public"])