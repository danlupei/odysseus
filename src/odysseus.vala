public class MyApp : Gtk.Application {

    public MyApp () {
        Object (
            application_id: "com.github.danlupei.odysseus",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var grid_main = new Gtk.Grid ();
        var grid_predefined = new Gtk.Grid ();
        var grid_schedule = new Gtk.Grid ();

        grid_schedule.orientation = Gtk.Orientation.VERTICAL;
        grid_predefined.orientation = Gtk.Orientation.VERTICAL;

        var button_lock = new Gtk.Button.with_label (_("Click me!"));
        button_lock.margin = 60;
        button_lock.clicked.connect (() => {
            button_lock.label = "Locked to coding for 1 hour...";
            button_lock.sensitive = false;
        });
        var main_window = new Gtk.ApplicationWindow (this);
        main_window.default_width = 900;
        main_window.default_height = 600;
        main_window.title = _("Odysseus");

        grid_predefined.add (button_lock);

        grid_main.add (grid_predefined);
        grid_main.add (grid_schedule);

        main_window.add (grid_main);
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MyApp ();
        return app.run (args);
    }
}