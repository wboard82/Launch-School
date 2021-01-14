Jan 14 2021

# Launch School Vim Meetup #

## Agenda ##
* What have you mastered lately?
* What are you working on learning currently?
* Talk about your process?
* Interesting things you would like to share?
* Questions for others


## Notes ##

This is the default 'p' command:
""p

But I can put from any register:
"0p is always the last thing you yanked (not deleted or cleared)
:registers will let you see all of the registers

To get to your vimrc:
:e (edit)
:e rubyfile.rb (open this file)
:e $MYVIMRC (this will open your vimrc wherever it is)

When you use the :e command to edit a file, it will open a new buffer. Your old
one is still there. You can use :bn (buffer next) and :bp (buffer previous) to
move around to the different files open.

Use :bd (buffer delete) to close a buffer. (It will complain if you haven't
saved it yet - use :w to write the file.)
