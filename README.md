# rxjava-debs
Build Debian Package for RxJava - Reactive Extensions for the JVM (v1.0.12)

**Instructions**

Inside of the debs folder

**Gets orig source code**

```
debian/rules get-orig-source
```

**Check dependencies**

```
dpkg-checkbuilddeps
```

**Build source package**

```
debuild -S -nc -uc -us
```

**Tested**

```
Debian jessie
```

**Build dependencies**

- debhelper (>= 9)
- cdbs
- default-jdk
- maven-debian-helper (>= 1.5)

**Check release**

[Release page](https://github.com/yadickson/rxjava-debs/releases)

