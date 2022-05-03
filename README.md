# MoreLogger

MoreLogger is an extension of TinyLogger to add some helper method in Window and try to add coloration

## Installation

```st
Metacello new
  githubUser: 'badetitou' project: 'MoreLogger' commitish: 'main' path: 'src';
  baseline: 'MoreLogger';
  load
```

## Basic Usage

### Creation

```st
TinyLogger default ensureMoreFileLoggerNamed: 'D:/my.log'.
```

### Log something

```st
'default' record. "record as info"
'default info' recordInfo. "record as info"
'default debug' recordDebug. "record as debug"
'default error' recordError. "record as error"
```

### Open terminal

```st
logger := TinyLogger default ensureMoreFileLoggerNamed: 'D:/csn-evol.log'.
logger open
```
