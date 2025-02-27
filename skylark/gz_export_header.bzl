load(
    "@gz//bazel/workspace:generate_file.bzl",
    "generate_file",
)

def gz_export_header(name, lib_name, export_base, visibility, **kwargs):
    generate_file(
        name = name,
        visibility = visibility,
        content = """
/*
 * Copyright (C) 2017 Open Source Robotics Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
*/

/*
 * ==========================================================================
 * This file was automatically generated by Bazel; do not modify it directly.
 * To modify this file, make changes to ign-bazel/ign_export_header.bzl
 * ==========================================================================
*/

#ifndef {export_base}_EXPORT_HH_
#define {export_base}_EXPORT_HH_

#ifndef {export_base}_VISIBLE
/// For {lib_name} developers: Apply this macro to {lib_name}
/// functions and classes which consumers of this library will need to be able
/// to call from their own programs or libraries.
#define {export_base}_VISIBLE \
    __attribute__ ((visibility("default")))
#endif


#ifndef {export_base}_HIDDEN
/// For {lib_name} developers: Apply this macro to {lib_name}
/// functions and classes which must not be used by consumers of this library.
/// By default, this property is applied to all classes and functions which are
/// not tagged with {export_base}_VISIBLE, so this does not
/// generally need to be used.
#define {export_base}_HIDDEN \
    __attribute__ ((visibility("hidden")))
#endif


#ifndef GZ_DEPRECATED
/// For {lib_name} developers: Use this macro to indicate that a
/// function or class has been deprecated and should no longer be used. A
/// version should be specified to provide context to the user about when the
/// function became deprecated.
#define GZ_DEPRECATED(version) __attribute__ ((__deprecated__))
#endif

#endif
""".format(lib_name = lib_name, export_base = export_base),
        **kwargs
    )
