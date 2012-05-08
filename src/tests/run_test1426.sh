#!/bin/bash

set -e

test $# -ge 5

tdbbin=$1; shift
bdbbin=$1; shift
tdbdump=$1; shift
bdbdump=$1; shift
original_bdbdump=$1; shift

$bdbbin
$bdbdump -p -h dir.test1426.c.bdb main > dump.bdb.1426
diff dump.bdb.1426 $original_bdbdump

$tdbbin
$tdbdump -x -p -h dir.test1426.c.tdb main > dump.tdb.1426
diff -I db_pagesize=4096 dump.bdb.1426 dump.tdb.1426