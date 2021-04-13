load(
    "@rules_java//java:defs.bzl",
    java_library_impl = "java_library",
    "java_import",
)
load("@bazel_tools//tools/build_defs/repo:maven_rules.bzl", "maven_jar")

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
        **kwargs
    )

def process_deps(dependencies):
  return [d if d.startswith("@maven") else "//"+d for d in dependencies]

# ResultInfo = provider("res")
# def _jar_library(ctx):
#   print(ctx)
#   print("analyzing", ctx.attr.jars)
#   # return ResultInfo(res=ctx.attr.jars)
#   result = []
#   for jar in ctx.attr.jars:
#     result.append("@maven//:" + jar.replace(".","_").replace(":","_").replace("-","_"))
#   print(result)
#   return ResultInfo(res=result)

# jar_library = rule(
#   implementation = _jar_library,
#   attrs = {
#       "jars": attr.string_list(),
#   },
# )
def jar_library(name, jars):
  result = []
  for jar in jars:
    result.append("@maven//:" + jar.replace(".","_").replace(":","_").replace("-","_"))
  # print(result)

  java_import(name = name,jars = result)
