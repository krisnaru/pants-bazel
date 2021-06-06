load(
    "@rules_java//java:defs.bzl",
    java_binary_impl = "java_binary",
)

load(
    "@io_bazel_rules_scala//scala:scala.bzl",
    scala_binary_impl = "scala_binary"
)
load('//tools/build_rules:shading.bzl', 'jar_jar')
load("//tools/build_rules:file.bzl", "file")

def jvm_binary(name, sources = [], main=None, dependencies =[], shading_rules = [], **kwargs):
  if dependencies:
    dependencies = process_deps(dependencies)
  
  runtime_deps = []
  java_src = False
  scala_src = False
  if sources==None or sources == []:
    runtime_deps=dependencies
    dependencies = []
    java_src = True
  else:
    splits = sources[0].split(".")
    if splits[1] == 'java':
      java_src = True
    if splits[1] == 'scala':
      scala_src = True

  if shading_rules:
    rules_file = name +'_rules'

    #create rules content
    content = ''
    for shading_rule in shading_rules:
      content = content + shading_rule +'\n'

    # create temporary rules file
    file(name=rules_file, content=content)

    unshaded_jar = "unshaded_"+ name
    native.alias(name = unshaded_jar, actual = unshaded_jar+'_binary_deploy.jar')
    if java_src:
      java_binary_impl(
          name = unshaded_jar+'_binary',
          srcs = sources,
          deps = dependencies,
          runtime_deps = runtime_deps,
          main_class = main,
          visibility = ["//visibility:public"],
      )
    if scala_src:
      scala_binary_impl(
        name = unshaded_jar,
        srcs = sources,
        deps = dependencies,
        runtime_deps = runtime_deps,
        main_class = main,
        visibility = ["//visibility:public"],
      )
    # process input jar and generate output jar
    jar_jar(name=name, input_jar= unshaded_jar, rules=':{}'.format(rules_file))
  else:
    if java_src:
      java_binary_impl(
          name = name,
          srcs = sources,
          deps = dependencies,
          runtime_deps = runtime_deps,
          main_class = main,
          visibility = ["//visibility:public"],
      )
    if scala_src:
      scala_binary_impl(
        name = name,
        srcs = sources,
        deps = dependencies,
        runtime_deps = runtime_deps,
        main_class = main,
        visibility = ["//visibility:public"],
      )

def process_deps(dependencies):
  return [d if d.startswith("@maven") or d.startswith(":") else "//"+d for d in dependencies]