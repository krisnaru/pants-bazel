def globs(include, exclude=[], exclude_directories=1, allow_empty=True):
  return native.glob([include], exclude, exclude_directories, allow_empty)

def jar(org, name, rev):
  return org+":"+name