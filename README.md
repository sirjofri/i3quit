i3quit
======

This i3 extension script changes the default quit behavior. As long as a window
is open it will ask you before exiting your i3 session. If no window is open
your i3 session will be quit immediately.

Installation
------------

Requirements:

- perl
- [AnyEvent][]
- [AnyEvent::I3][]
- [i3][]
- i3-msg

In your i3 configuration bind your custom exit shortcut like:

	bindsym $mod+Shift+e nop exit
	# Don't use a command after "nop exit"!

Append the following line to your i3 configuration:

	exec --no-startup-id path/to/i3quit.pl

My personal setup is like:

	~/bin/i3quit -> ~/apps/i3quit/i3quit.pl (symlink)
	~/apps/i3quit (This repository)


[AnyEvent::I3]: https://metacpan.org/pod/AnyEvent::I3
[AnyEvent]: https://metacpan.org/pod/AnyEvent
[i3]: https://i3wm.org/

License
=======

You can do with this software what you want. But don't blame me if it kills your
fan, cpu, memory, ram, keyboard, screen, configuration, system, editor, or
anything else. If you like this piece of code you are free to buy me a beer (or
anything else). But don't expect any features (or even bug fixes).

<!-- vim:ts=4:tw=80:sw=4:noet
-->
