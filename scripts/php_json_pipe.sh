#!/bin/bash
php -R 'echo ( empty(trim($argn)) ? "" : json_encode(json_decode($argn) ?? $argn, JSON_PRETTY_PRINT) ) . PHP_EOL;'
