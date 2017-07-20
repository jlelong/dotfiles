#!/usr/bin/env python
# -*- coding: latin-1 -*-

import sys

translation_iso2tex = {
    "�": "\\\"a",
    "�": "\\`a",
    "�": "\\'a",
    "�": "\\~a",
    "�": "\\^a",
    "�": "\\\"e",
    "�": "\\`e",
    "�": "\\'e",
    "�": "\\^e",
    "�": "\\\"\\i",
    "�": "\\`\\i",
    "�": "\\'\\i",
    "�": "\\^\\i",
    "�": "\\\"o",
    "�": "\\`o",
    "�": "\\'o",
    "�": "\\~o",
    "�": "\\^o",
    "�": "\\\"",
    "�": "\\`u",
    "�": "\\'u",
    "�": "\\^u",
    "�": "\\\"A",
    "�": "\\`A",
    "�": "\\'A",
    "�": "\\~A",
    "�": "\\^A",
    "�": "\\\"E",
    "�": "\\`E",
    "�": "\\'E",
    "�": "\\^E",
    "�": "\\\"I",
    "�": "\\`I",
    "�": "\\'I",
    "�": "\\^I",
    "�": "\\\"O",
    "�": "\\`O",
    "�": "\\'O",
    "�": "\\~O",
    "�": "\\^O",
    "�": "\\\"U",
    "�": "\\`U",
    "�": "\\'U",
    "�": "\\^U",
    "�": "\\~n",
    "�": "\\~N",
    "�": "\\c c",
    "�": "\\c C",
    "�": "\\pounds"
}

translation_tex2iso = {
    "{\\\"a}": "�",
    "{\\`a}": "�",
    "{\\'a}": "�",
    "{\\~a}": "�",
    "{\\^a}": "�",
    "{\\\"e}": "�",
    "{\\`e}": "�",
    "{\\'e}": "�",
    "{\\^e}": "�",
    "{\\\"\\i}": "�",
    "{\\`\\i}": "�",
    "{\\'\\i}": "�",
    "{\\^\\i}": "�",
    "{\\\"i}": "�",
    "{\\`i}": "�",
    "{\\'i}": "�",
    "{\\^i}": "�",
    "{\\\"o}": "�",
    "{\\`o}": "�",
    "{\\'o}": "�",
    "{\\~o}": "�",
    "{\\^o}": "�",
    "{\\\"u}": "�",
    "{\\`u}": "�",
    "{\\'u}": "�",
    "{\\^u}": "�",
    "{\\\"A}": "�",
    "{\\`A}": "�",
    "{\\'A}": "�",
    "{\\~A}": "�",
    "{\\^A}": "�",
    "{\\\"E}": "�",
    "{\\`E}": "�",
    "{\\'E}": "�",
    "{\\^E}": "�",
    "{\\\"I}": "�",
    "{\\`I}": "�",
    "{\\'I}": "�",
    "{\\^I}": "�",
    "{\\\"O}": "�",
    "{\\`O}": "�",
    "{\\'O}": "�",
    "{\\~O}": "�",
    "{\\^O}": "�",
    "{\\\"U}": "�",
    "{\\`U}": "�",
    "{\\'U}": "�",
    "{\\^U}": "�",
    "{\\~n}": "�",
    "{\\~N}": "�",
    "{\\c c}": "�",
    "{\\c C}": "�",
    "\\\"a": "�",
    "\\`a": "�",
    "\\'a": "�",
    "\\~a": "�",
    "\\^a": "�",
    "\\\"e": "�",
    "\\`e": "�",
    "\\'e": "�",
    "\\^e": "�",
    "\\\"i": "�",
    "\\`i": "�",
    "\\'i": "�",
    "\\^i": "�",
    "\\\"o": "�",
    "\\`o": "�",
    "\\'o": "�",
    "\\~o": "�",
    "\\^o": "�",
    "\\\"u": "�",
    "\\`u": "�",
    "\\'u": "�",
    "\\^u": "�",
    "\\\"A": "�",
    "\\`A": "�",
    "\\'A": "�",
    "\\~A": "�",
    "\\^A": "�",
    "\\\"E": "�",
    "\\`E": "�",
    "\\'E": "�",
    "\\^E": "�",
    "\\\"I": "�",
    "\\`I": "�",
    "\\'I": "�",
    "\\^I": "�",
    "\\\"O": "�",
    "\\`O": "�",
    "\\'O": "�",
    "\\~O": "�",
    "\\^O": "�",
    "\\\"U": "�",
    "\\`U": "�",
    "\\'U": "�",
    "\\^U": "�",
    "\\~n": "�",
    "\\~N": "�",
    "\\\"{a}": "�",
    "\\`{a}": "�",
    "\\'{a}": "�",
    "\\~{a}": "�",
    "\\^{a}": "�",
    "\\\"{e}": "�",
    "\\`{e}": "�",
    "\\'{e}": "�",
    "\\^{e}": "�",
    "\\\"{\\i}": "�",
    "\\`{\\i}": "�",
    "\\'{\\i}": "�",
    "\\^{\\i}": "�",
    "\\\"{i}": "�",
    "\\`{i}": "�",
    "\\'{i}": "�",
    "\\^{i}": "�",
    "\\\"{o}": "�",
    "\\`{o}": "�",
    "\\'{o}": "�",
    "\\~{o}": "�",
    "\\^{o}": "�",
    "\\\"{u}": "�",
    "\\`{u}": "�",
    "\\'{u}": "�",
    "\\^{u}": "�",
    "\\\"{A}": "�",
    "\\`{A}": "�",
    "\\'{A}": "�",
    "\\~{A}": "�",
    "\\^{A}": "�",
    "\\\"{E}": "�",
    "\\`{E}": "�",
    "\\'{E}": "�",
    "\\^{E}": "�",
    "\\\"{I}": "�",
    "\\`{I}": "�",
    "\\'{I}": "�",
    "\\^{I}": "�",
    "\\\"{O}": "�",
    "\\`{O}": "�",
    "\\'{O}": "�",
    "\\~{O}": "�",
    "\\^{O}": "�",
    "\\\"{U}": "�",
    "\\`{U}": "�",
    "\\'{U}": "�",
    "\\^{U}": "�",
    "\\~{n}": "�",
    "\\~{N}": "�",
    "\\c{c}": "�",
    "\\c{C}": "�",
    }

# Create decoded dictionnaries
translation_iso2tex_decoded = dict()
translation_tex2iso_decoded = dict()
for i, j in translation_iso2tex.iteritems():
    translation_iso2tex_decoded[i.decode('latin1')] = j.decode('latin1')
for i, j in translation_tex2iso.iteritems():
    translation_tex2iso_decoded[i.decode('latin1')] = j.decode('latin1')


if len(sys.argv) != 3:
    sys.stderr.writelines((
        "Usage: texaccents enc conversion < input > output\n",
        "\tenc is the encoding of the file (latin1 or utf8)\n",
        "\tconversion can be iso2tex or tex2iso\n"))
    exit()
else:
    encoding = sys.argv[1]
    if sys.argv[2] == "iso2tex":
        translation_table = translation_iso2tex_decoded
    elif sys.argv[2] == "tex2iso":
        translation_table = translation_tex2iso_decoded
    else:
        sys.stderr.writelines((
            "Usage: texaccents conversion < input > output\n",
            "conversion can be iso2tex or tex2iso\n"))
        exit()


for line in sys.stdin:
    line = line.decode(encoding)
    for i, j in translation_table.iteritems():
        line = line.replace(i, j)
    print line.encode(encoding),
