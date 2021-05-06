load(
    "@rules_java//java:defs.bzl",
    "java_library",
)

def jar_library(name, **kwargs):
  deps = []
  for jar in kwargs['jars']:
    deps.append("@maven//:" + jar.replace(".","_").replace(":","_").replace("-","_"))

  ex_plugins = []
  if kwargs.get('scope') == 'compile':
    ex_plugins.append("//:lombok_java")
  java_library(name=name, exports=deps, exported_plugins=ex_plugins, visibility=["//visibility:public"])