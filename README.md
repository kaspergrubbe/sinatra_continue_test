# Intro

This is made to test the behavior reported by Songkick in this blogpost: http://devblog.songkick.com/2012/11/27/a-second-here-a-second-there/#comments

# Disable/Enable the Songkick 100-continue middleware

Remove the `#` in front of this line in `config.ru`:

```
#use AlwaysRequestBody
```

# To run

- Install gems with: `bundle install`
- Start webserver with: `foreman start`
- Run `ruby generate_filetypes.rb`
- Observe result:

```
1+0 records in
1+0 records out
800 bytes transferred in 0.009919 secs (80654 bytes/sec)

1+0 records in
1+0 records out
1024 bytes transferred in 0.009238 secs (110846 bytes/sec)

15+0 records in
15+0 records out
15360 bytes transferred in 0.009338 secs (1644909 bytes/sec)

       user     system      total        real
800b
       0.000000   0.000000   0.000000 (  0.013207)
1Kb
       0.000000   0.000000   0.020000 (  1.013866)
15Kb
       0.000000   0.000000   0.010000 (  2.018526)
```
