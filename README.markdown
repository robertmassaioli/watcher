# Watcher - The Command Line Video Watcher Recorder

Use Case: You have a bunch of video files on your computer and you want to watch all of them and
keep track of which ones you have watched already so that you do not want to watch any video again
unless you specifically want to.

If this is the problem that you are trying to solve then watcher is your friend. In the most simple
scenario all you have to do is go into the directiory with all of your videos and type in:

    watcher next

And the very next video that you have not watched yet will start playing. When that video finishes
it will be recorded and the very next video will just start playing right again. It could not be
easier, just start entering next and watcher will do the rest for you.

## Installing Watcher

If you are on Ubuntu / Debian (or even just linux) then using watcher is quite simple just enter this directory and type in the
following.

    bash install_on_linux.sh

If you are on windows then you will have to try and get this working through Cygwin but I do not
even know if that is possible. I have not tested it yet.

## Getting Started

Watcher does not have that many commands, infact they can be summarised in a short list:

 - next - Starts the playback of the next unwatched video. Will automatically increment the watch
   count.
 - watch - Watch a video of your choosing. Will automatically increment the watch count.
 - watched - Tell watcher that you have watched a video without it knowing about it.
 - count - Will give you the count of how many times a particular watch has been viewed, or, if
   given no argument, will give you the counts of every watch item.


## Helping Development of Watcher

This is github, just check out the code and help me develop away. I would love to see patches and
improvements of any kind.

## Where to from here

Watcher started life as a script that I just hacked together in a few hours. It really was not meant
for long term use. However, if it starts to get a real following then I will reconsider implementing
it in a different and better language than a bash shell script. That will be the next move from
here; ditch the shell script and move into a language with better sqlite support. If I go and
rewrite it I also want it to be cross-platform. So nothing like C or C++ will be used. The better
alternatives are languages like Haskell, Perl, Ruby and Python.
