/*
* Copyright (c) 2011-2018 Nicomede Fasiello
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Nicomede Fasiello <FasielloN@yahoo.it>
*/

public class MyNotificationsApp : Gtk.Application {

    public MyNotificationsApp () {
        Object (
            application_id: "com.github.medeotl.notifications-app",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this);
        main_window.title = "Notifichiamo?";
        main_window.border_width = 12;

        var grid = new Gtk.Grid ();
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.row_spacing = 6;

        var title_label = new Gtk.Label ("Notifications");
        var show_button = new Gtk.Button.with_label ("Show");
        var replace_button = new Gtk.Button.with_label ("Replace");

        grid.add (title_label);
        grid.add (show_button);
        grid.add (replace_button);

        main_window.add (grid);

        show_button.clicked.connect (() => {
            var notification = new Notification ("Hello, world");
            var icon = new GLib.ThemedIcon ("dialog-warning");
            notification.set_icon (icon);
            notification.set_body ("This is my first notification");
            this.send_notification ("com.github.medeotl.notifications-app", 
                  notification);
        });
        
        replace_button.clicked.connect (() => {
            var notification = new Notification ("Hello Again");
            notification.set_body ("This is my 2nd Notification! I'M URGENT!");
            
            var icon = new GLib.ThemedIcon ("dialog-warning");
            notification.set_icon (icon);
            notification.set_priority (NotificationPriority.URGENT);
            
            this.send_notification ("com.github.medeotl.notifications-app", 
                    notification);
        });
                

        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MyNotificationsApp ();
        return app.run (args);
    }
}