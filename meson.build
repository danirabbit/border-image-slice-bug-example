project('example', 'vala', 'c')

gnome = import('gnome')

example_resources = gnome.compile_resources(
    'example-resources', 'example.gresource.xml'
)

executable(
    meson.project_name(),
    'example.vala',
    example_resources,
    dependencies: [
        dependency('glib-2.0'),
        dependency('gobject-2.0'),
        dependency('gtk+-3.0'),
    ]
)
