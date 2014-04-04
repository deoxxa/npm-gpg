npm-gpg
=======

Sign and verify npm packages using GPG

**WARNING: WORK IN PROGRESS**

Overview
--------

npm-gpg is supposed to help you sign your and verify others' npm packages. I'm
not sure I've got the right approach, but YOLO. Feel free to call me out on any
problems I've introduced, the issues interface is just over there to the right!

```
  IF YOU SEE SOMETHING, SAY SOMETHING

                  .
   .. ............;;.
    ..::::::::::::;;;;.
  . . ::::::::::::;;:'
                  :'
```

Workings
--------

npm-gpg currently works with the concept of a manifest in the root of an npm
package. That manifest is a list of all the files that would be included in the
package if it were packed by `npm pack` (which is how a package is processed
before it ends up on the npm registry), along with their sha-1 checksums. This
manifiest is then signed with `gpg --clearsign -a`.

`npm-gpg-sign` generates this manifest, and `npm-gpg-verify`, well, verifies it.

Heck. Just read the code. It's only like 60 lines all together.

Commands
--------

### npm-gpg-sign

```
$ cd /path/to/package && npm-gpg-sign
```

### npm-gpg-verify

```
$ cd /path/to/package && npm-gpg-verify
```

License
-------

3-clause BSD. A copy is included with the source.

Contact
-------

* GitHub ([deoxxa](http://github.com/deoxxa))
* Twitter ([@deoxxa](http://twitter.com/deoxxa))
* Email ([deoxxa@fknsrs.biz](mailto:deoxxa@fknsrs.biz))
