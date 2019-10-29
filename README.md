# floodtracker-watcher

Flood Tracker is a Code for Miami project seeking to address the problem of flooding in South Florida. Many areas of Miami flood because of "King Tide" and climate change. This is a work in progress app seeking to address helping people interested in tracking flooding do that. 

This projects uses the Particle microcontroller & cell system to get data from deployed sensors and puts it in a database. Think of it as a work in progress.

Bryce, the lead developer has found it really helpful while debugging sensor behavior.

It shows events: https://floodtracker-watcher.herokuapp.com/events

It shows other status updates: https://floodtracker-watcher.herokuapp.com/sparks

It "has" "User Interface" but if you are a designer we could use help in making it better.

Learn how we built this here: https://medium.com/code-for-miami/building-iot-flood-trackers-for-miami-with-miami-7186a8c7200e

## developing

it's a really standard rails app

### importing a backup

data dump from 2019-06-24:
https://i.bf1c.us/floodtracker-watcher-b006.pgdump

`pg_restore -d floodtracker-watcher_development tmp/b004.pgdump`

## deploying

it deploys mostly fine on heroku (by design)

set a "KEY" environment variable so that pushed data can be authenticated

![a screenshot of the "Settings" page for an app on the Heroku Dashboard; the "KEY" configuration should match the URL in particle](docs/heroku-configuration-example.png)

once it's migrated and running and happy (the events & sparks URLs above should
work), set up the appropriate URLs in the particle web console

![a screenshot of a Particle Webhook Integration; the full URL is https://floodtracker-watcher.herokuapp.com/events?key=KEYKEYKEY](docs/particle-webhook-example.png)

on particle, send `level_mm` events to
`https://floodtracker-watcher.herokuapp.com/events?key=YOUR KEY HERE`
and `spark` events to
`https://floodtracker-watcher.herokuapp.com/sparks?key=YOUR KEY HERE`

## questions

I learned a lot and had a lot of fun with this! If you've got questions,
email me at bkerley@brycekerley.net .

## get involved

* We suggest you fork this and get it running on your local.
* We need help with UX Design and Research.

## license

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org>
