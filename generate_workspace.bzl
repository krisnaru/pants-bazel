# THIS FILE IS GENERATED, DO NOT EDIT!
# use onerepo_tools/dep2bzl.sh to regenerate 

load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_import_external")

def generated_java_libraries():
    native.alias(name = "com_google_guava_guava", actual = "@com_google_guava_guava")
    native.alias(name = "com_lmax_disruptor", actual = "@com_lmax_disruptor")
    native.alias(name = "log4j_log4j", actual = "@log4j_log4j")
    native.alias(name = "org_apache_logging_log4j_log4j_api", actual = "@org_apache_logging_log4j_log4j_api")
    native.alias(name = "org_apache_logging_log4j_log4j_core", actual = "@org_apache_logging_log4j_log4j_core")
    native.alias(name = "org_apache_logging_log4j_log4j_slf4j_impl", actual = "@org_apache_logging_log4j_log4j_slf4j_impl")
    native.alias(name = "org_slf4j_slf4j_api", actual = "@org_slf4j_slf4j_api")
    native.alias(name = "org_xerial_snappy_snappy_java", actual = "@org_xerial_snappy_snappy_java")

def maven_dependencies():
    jvm_import_external(
        name = "com_google_guava_guava",
        rule_name = "java_import",
        artifact_urls = [ "https://repo1.maven.org/maven2/com/google/guava/guava/15.0/guava-15.0.jar"],
        artifact_sha256 ="7a34575770eebc60a5476616e3676a6cb6f2975c78c415e2a6014ac724ba5783",
        srcjar_urls = ["https://repo1.maven.org/maven2/com/google/guava/guava/15.0/guava-15.0-sources.jar"],
        srcjar_sha256 ="1a3f78cfd4a44f63af00afe36f2175d41ed24d25aedf3542f47664f81815a211",
        licenses = ["notice"],
  )


    jvm_import_external(
        name = "com_lmax_disruptor",
        rule_name = "java_import",
        artifact_urls = [ "https://repo1.maven.org/maven2/com/lmax/disruptor/3.3.0/disruptor-3.3.0.jar"],
        artifact_sha256 ="237ee677d194fb5b6d53db3a1cd5462bba20ff9554bcaa39d78aec16c03e0799",
        srcjar_urls = ["https://repo1.maven.org/maven2/com/lmax/disruptor/3.3.0/disruptor-3.3.0-sources.jar"],
        srcjar_sha256 ="1ad3e5c17f2015eb2a271aaede98a8b173e8d934d921feac850ddd53b0161e2d",
        licenses = ["notice"],
  )


    jvm_import_external(
        name = "log4j_log4j",
        rule_name = "java_import",
        artifact_urls = [ "https://repo1.maven.org/maven2/log4j/log4j/1.2.17/log4j-1.2.17.jar"],
        artifact_sha256 ="1d31696445697720527091754369082a6651bd49781b6005deb94e56753406f9",
        srcjar_urls = ["https://repo1.maven.org/maven2/log4j/log4j/1.2.17/log4j-1.2.17-sources.jar"],
        srcjar_sha256 ="4d9ba787af1692aa88417c2a47a37a98125d645b91ab556252dbee0f45225493",
        licenses = ["notice"],
  )


    jvm_import_external(
        name = "org_apache_logging_log4j_log4j_api",
        rule_name = "java_import",
        artifact_urls = [ "https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-api/2.5/log4j-api-2.5.jar"],
        artifact_sha256 ="9452e85177f69535ca093cbe2df3e8604344d58f729db70fb9e3009e80684251",
        srcjar_urls = ["https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-api/2.5/log4j-api-2.5-sources.jar"],
        srcjar_sha256 ="3234b729c8cf839a2e16d2665d449a04b37516a0a6fb330496474b547b10e04f",
        licenses = ["notice"],
  )


    jvm_import_external(
        name = "org_apache_logging_log4j_log4j_core",
        rule_name = "java_import",
        artifact_urls = [ "https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-core/2.5/log4j-core-2.5.jar"],
        artifact_sha256 ="4f53e4d52efcccdc446017426c15001bb0fe444c7a6cdc9966f8741cf210d997",
        srcjar_urls = ["https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-core/2.5/log4j-core-2.5-sources.jar"],
        srcjar_sha256 ="6d32e63ee8dfbded4200c641ca2e37ca47cc3b54103f78a30bd8736cbac1f036",
        licenses = ["notice"],
        runtime_deps = [
            "@org_apache_logging_log4j_log4j_api",
      ],
  )


    jvm_import_external(
        name = "org_apache_logging_log4j_log4j_slf4j_impl",
        rule_name = "java_import",
        artifact_urls = [ "https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-slf4j-impl/2.5/log4j-slf4j-impl-2.5.jar"],
        artifact_sha256 ="8831d6a75846e98dabe56d1f970d8b9256fa59733e3cfa6d0f90e86eba40f928",
        srcjar_urls = ["https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-slf4j-impl/2.5/log4j-slf4j-impl-2.5-sources.jar"],
        srcjar_sha256 ="11215a3a0da488e22c1953cbeb59bc190de368f85eebf0ab5902f0465951b19a",
        licenses = ["notice"],
        runtime_deps = [
            "@org_apache_logging_log4j_log4j_api",
            "@org_slf4j_slf4j_api",
      ],
  )


    jvm_import_external(
        name = "org_slf4j_slf4j_api",
        rule_name = "java_import",
        artifact_urls = [ "https://repo1.maven.org/maven2/org/slf4j/slf4j-api/1.7.12/slf4j-api-1.7.12.jar"],
        artifact_sha256 ="0aee9a77a4940d72932b0d0d9557793f872e66a03f598e473f45e7efecdccf99",
        srcjar_urls = ["https://repo1.maven.org/maven2/org/slf4j/slf4j-api/1.7.12/slf4j-api-1.7.12-sources.jar"],
        srcjar_sha256 ="d56ee5b301cb0e4f4284b3b1f21e35cddbcf4f19bcc72c7a7dbd0fabeac937d2",
        licenses = ["notice"],
  )


    jvm_import_external(
        name = "org_xerial_snappy_snappy_java",
        rule_name = "java_import",
        artifact_urls = [ "https://repo1.maven.org/maven2/org/xerial/snappy/snappy-java/1.1.4/snappy-java-1.1.4.jar"],
        artifact_sha256 ="f75ec0fa9c843e236c6e1512c17c095cfffd175f32e21ea0e3eccb540d77f002",
        srcjar_urls = ["https://repo1.maven.org/maven2/org/xerial/snappy/snappy-java/1.1.4/snappy-java-1.1.4-sources.jar"],
        srcjar_sha256 ="599d24f5fdf5a0d5247d332c059b372e40ed77d928fd29b246fcb58ae5e405f2",
        licenses = ["notice"],
  )


