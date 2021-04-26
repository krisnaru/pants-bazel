load(
    "@rules_java//java:defs.bzl",
    java_library_impl = "java_binary"
    )

def java_binary(**kwargs):

    sources = kwargs.get('srcs')
    dependencies = kwargs.get('deps')

    if kwargs.get('sources'):
      sources = kwargs.get('sources')
    if kwargs.get('dependencies'):
      dependencies = process_deps(kwargs.get('dependencies'))
    
    if sources==None or sources == []:
      kwargs['runtime_deps']=dependencies
    else:
      kwargs['deps'] = dependencies
    
    kwargs.pop('sources', None)
    kwargs.pop('dependencies', None)

    java_library_impl(
        srcs = sources,
        visibility = ["//visibility:public"],
        **kwargs
    )

def process_deps(dependencies):
  return [d if d.startswith("@maven") else "//"+d for d in dependencies]