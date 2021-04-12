def globs(include, exclude=[], exclude_directories=1, allow_empty=True):
  return native.glob([include], exclude, exclude_directories, allow_empty)

def java_library(**attrs):
    attrs['srcs'] = attrs['sources']
    attrs['deps'] = attrs['dependencies']
    attrs.pop('sources')
    attrs.pop('dependencies')
    native.java_library(**_add_tags(attrs))

_MIGRATION_TAG = "__JAVA_RULES_MIGRATION_DO_NOT_USE_WILL_BREAK__"
def _add_tags(attrs):
    if "tags" in attrs and attrs["tags"] != None:
        attrs["tags"] = attrs["tags"] + [_MIGRATION_TAG]
    else:
        attrs["tags"] = [_MIGRATION_TAG]
    return attrs
