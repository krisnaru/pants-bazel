load(
    "@rules_java//java:defs.bzl",
    "java_import",
)

def jar_library(name, jars):
  deps = []
  for jar in jars:
    deps.append("@maven//:" + jar.replace(".","_").replace(":","_").replace("-","_"))
  java_import(name=name, exports=deps, jars=[], runtime_deps=[], visibility=["//visibility:public"])