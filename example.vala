public class Example.Application : Gtk.Application {
    const string EXAMPLE_CSS = """
        .example {
            border-image-source: url("resource:///example/graphics@2x.svg");
            border-image-slice: 20;
            border-image-width: 20px;
            border-image-repeat: repeat;
            font-size: 18px;
            padding: 12px;
        }
    """;

    public Application () {
        Object (
            application_id: "com.github.danrabbit.sandbox",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var provider = new Gtk.CssProvider ();
        try {
            provider.load_from_data (EXAMPLE_CSS, EXAMPLE_CSS.length);
            Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
        } catch (Error e) {
            critical (e.message);
        }

        var label = new Gtk.Label ("Test");
        label.margin = 12;
        label.get_style_context ().add_class ("example");

        var main_window = new Gtk.ApplicationWindow (this);
        main_window.add (label);
        main_window.show_all ();
    }    
}

public static int main (string[] args) {
    var app = new Example.Application ();
    return app.run (args);
}
