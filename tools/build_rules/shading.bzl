
def _jar_jar_impl(ctx):
    ctx.actions.run(
        inputs = [ctx.file.rules, ctx.file.input_jar],
        outputs = [ctx.outputs.jar],
        executable = ctx.executable._jarjar,
        progress_message = "jarjar %s" % ctx.label,
        arguments = ["process", ctx.file.rules.path, ctx.file.input_jar.path, ctx.outputs.jar.path],
    )

    return [
        JavaInfo(
            output_jar = ctx.outputs.jar,
            compile_jar = ctx.outputs.jar,
        ),
        DefaultInfo(files = depset([ctx.outputs.jar])),
    ]

jar_jar = rule(
    implementation = _jar_jar_impl,
    attrs = {
        "input_jar": attr.label(allow_single_file = True),
        "rules": attr.label(allow_single_file = True),
        "_jarjar": attr.label(executable = True, cfg = "host", default = Label("//:jarjar")),
    },
    outputs = {
        "jar": "%{name}.jar",
    },
    provides = [JavaInfo],
)