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

```st
TinyLogger default addMoreFileLoggerNamed: 'D:/my.log'.
```
